# profile::fw::ddos is all the firewall rules to prevent ddos attacks

class profile::fw::ddos {

  if $facts['os']['family'] == 'RedHat' {
    include sysctl
  }

  firewall { '050 syn w/o tcp established':
    table   => 'mangle',
    chain   => 'PREROUTING',
    ctstate => 'INVALID',
    action  => 'drop',
  }

  firewall { '051 block new non syn':
    table     => 'mangle',
    chain     => 'PREROUTING',
    ctstate   => 'NEW',
    proto     => 'tcp',
    tcp_flags => '! SYN',
    action    => 'drop',
  }

  firewall { '052 block uncommon mss':
    table   => 'mangle',
    chain   => 'PREROUTING',
    proto   => 'tcp',
    ctstate => 'NEW',
    mss     => '! 536:65535',
    action  => 'drop',
  }

  firewall { '053 block bogus tcp flags':
    table     => 'mangle',
    chain     => 'PREROUTING',
    proto     => 'tcp',
    tcp_flags => [
      'FIN,SYN,RST,PSH,ACK,URG NONE',
      'FIN,SYN FIN,SYN',
      'SYN,RST SYN,RST',
      'FIN,RST FIN,RST',
      'FIN,ACK FIN',
      'ACK,URG URG',
      'ACK,FIN FIN',
      'ACK,PSH PSH',
      'ALL ALL',
      'ALL NONE',
      'ALL FIN,PSH,URG',
      'ALL SYN,FIN,PSH,URG',
      'ALL SYN,RST,ACK,FIN,URG',
    ],
    action    => 'drop',
  }

  firewall { '054 block conn attacks':
    chain           => 'INPUT',
    proto           => 'tcp',
    connlimit_above => '80',
    action          => 'reject',
  }

}
