# This class points name servers

class resolv (
  $nameservers = [ '1.2.3.7', '1.2.3.25', '1.2.3.15', '1.2.3.17' ],
  $search      = 'CS.UNLV.EDU EGR.UNLV.EDU cs.unlv.edu egr.unlv.edu',
) {

  file { '/etc/resolv.conf':
    ensure  => file,
    content => epp('resolv/resolv.conf.epp', {'nameservers' => $nameservers, 'search' => $search }),
    path    => '/etc/resolv.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }

  file { '/etc/NetworkManager/NetworkManager.conf':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/resolv/NetworkManager.conf',
  }

}
