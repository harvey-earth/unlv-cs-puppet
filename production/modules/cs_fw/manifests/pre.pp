# This class has all default rules to apply first to all firewalls

class cs_fw::pre {
  Firewall {
    require => undef,
  }

  firewall { '000 accept related established':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }->
  firewall { '001 accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  }->
  firewall { '002 accept all lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '003 reject local not on lo':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  }->
  firewall { '004 allow cssys':
    dport  => 22,
    source => '1.2.3.64/32',
    action => 'accept',
  }->
  firewall { '005 allow shu':
    dport  => 22,
    source => '1.2.3.45/32',
    action => 'accept',
  }->
  firewall { '006 allow nrpe':
    dport  => 5666,
    source => '1.2.3.35/32',
    action => 'accept',
  }->
  firewall { '007 allow nagios ssh check':
    dport  => 22,
    source => '1.2.3.35/32',
    action => 'accept',
  }
}
