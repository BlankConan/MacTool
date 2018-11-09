#!/bin/expect





















auto_authorization() {

  expect -c "
      set timeout 10
      spawn sudo ls
      expect {
        "*assword:" {send 666\r}
      }
    expect eof
  "
}

auto_authorization
