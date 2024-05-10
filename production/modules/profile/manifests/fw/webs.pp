# Profile to open HTTPS to the world

class profile::fw::webs {

  firewall { '032 accept all https':
    dport  => 443,
    proto  => 'tcp',
    action => 'accept',
  }
}
