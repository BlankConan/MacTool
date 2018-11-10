#!/usr/bin/expect






auto_authorization() {

  expect -c "
      expect {
        "*assword:" {send 666\r}
      }
    expect eof
  "
}


passwordAlert() {
  spawn sudo [lindex $argv 1]
  set password [lindex $argv 2]
  expect "*password:"
  send "$password\r"
  expect "*password:"
  send "$password\r"
  expect eof
}



passwordAlert
