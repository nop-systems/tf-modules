#!/usr/bin/env python3

import json
import os
import os.path
import urllib.request
import subprocess
import shutil
import re

def main():
    download_dir = os.environ["DOWNLOAD_DIR"]
    fcos_stream = os.getenv("FCOS_STREAM", default="stable")

    try:
        os.mkdir(download_dir)
    except FileExistsError:
        pass

    with urllib.request.urlopen(f"https://builds.coreos.fedoraproject.org/streams/{fcos_stream}.json") as http_request:
        data = json.load(http_request)
    version = data["architectures"]["x86_64"]["artifacts"]["metal"]["release"]

    version_dir = os.path.join(download_dir, version)
    print(f"Downloading Fedora CoreoOS {version} PXE to {version_dir}")
    try:
        os.mkdir(version_dir)
    except FileExistsError:
        pass
    coreos_installer = subprocess.run(["coreos-installer", "download", "-f" ,"pxe", "-s", fcos_stream], capture_output=True, check=True, cwd=version_dir, text=True)
    print(coreos_installer.stderr)
    downloaded = coreos_installer.stdout.splitlines()
    print(f"Downloaded files: \n  {"\n  ".join(downloaded)}")

    print("Updating symlinks:")
    for file in downloaded:
        symlink_name = file.replace(f"{version}-", "")
        src = os.path.normpath(os.path.join(version, file))
        dst = os.path.normpath(os.path.join(download_dir, symlink_name))
        tmp_dst = f"{dst}.new"
        try:
            os.remove(tmp_dst)
        except FileNotFoundError:
            pass
        os.symlink(src, tmp_dst)
        os.rename(tmp_dst, dst)
        print(f"  {dst} \t=> {src}")

    for entry in os.scandir(path=download_dir):
        if not entry.is_dir():
            continue
        if entry.name == version:
            continue
        print(f"Deleting old version: {entry.name}")
        shutil.rmtree(entry.path)

if __name__ == "__main__":
    main()
