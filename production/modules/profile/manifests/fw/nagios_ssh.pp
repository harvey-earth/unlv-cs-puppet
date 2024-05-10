# Profile to open SSH to Nagios

class profile::fw::nagios_ssh {

  firewall { '060 accept all ssh':
    dport  => 22,
    source => '1.2.3.4/32',
    proto  => 'tcp',
    action => 'accept',
  }
}
