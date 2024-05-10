# This class sets up groups for CS AD

class profile::idm::linux_groups {

  group { 'csugrad':
    ensure => present,
    gid    => '1001',
  }

  group { 'csgrad':
    ensure => present,
    gid    => '1005',
  }

  group { 'csstaff':
    ensure => present,
    gid    => '1013',
  }

}
