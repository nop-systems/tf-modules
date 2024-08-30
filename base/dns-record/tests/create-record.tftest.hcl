run "create-A-record" {
  variables {
    zone_id = "96c197469cc8a73db1d9c6f1bba05574"
    name    = "tftest.testing"
    type    = "A"
    value   = "203.0.113.42"
  }
}

run "create-AAAA-record" {
  variables {
    zone_id = "96c197469cc8a73db1d9c6f1bba05574"
    name    = "tftest.testing"
    type    = "AAAA"
    value   = "2001:db8::acab"
  }
}

run "create-CNAME-record" {
  variables {
    zone_id = "96c197469cc8a73db1d9c6f1bba05574"
    name    = "tftest-cname.testing"
    type    = "CNAME"
    value   = "tftest.testing.nop.systems"
  }
}

run "create-A-record-null" {
  variables {
    zone_id = "96c197469cc8a73db1d9c6f1bba05574"
    name    = "tftest-null.testing"
    type    = "A"
    value   = null
  }
  expect_failures = [
    var.value
  ]
}
