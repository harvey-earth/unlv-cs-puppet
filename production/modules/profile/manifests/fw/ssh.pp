# Profile to open SSH to the world

class profile::fw::ssh {

  firewall { '030 accept all ssh':
    dport  => 22,
    proto  => 'tcp',
    action => 'accept',
  }
}
