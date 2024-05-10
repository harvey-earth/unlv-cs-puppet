# Chrony class sets up chrony.conf file and restarts the service
class chrony {

  file { '/etc/chrony.conf':
    ensure => present,
    source => 'puppet:///modules/chrony/chrony.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Exec['systemctl restart chronyd'],
  }

  exec { 'systemctl restart chronyd':
    path        => '/usr/bin',
    refreshonly => true,
  }
}
