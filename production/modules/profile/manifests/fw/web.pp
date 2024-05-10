# Profile to open HTTP to the world

class profile::fw::web {

  firewall { '031 accept all http':
    dport  => 80,
    proto  => 'tcp',
    action => 'accept',
  }
}
