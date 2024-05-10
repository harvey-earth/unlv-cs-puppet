# Firewall rules for Elastic Stack

class profile::fw::elastic {

  firewall { '033 accept kibana to cssys':
    dport  => 80,
    source => '1.2.3.4',
    proto  => 'tcp',
    action => 'accept',
  }

  firewall { '034 accept logstash any':
    dport  => 5044,
    proto  => 'tcp',
    action => 'accept',
  }

}
