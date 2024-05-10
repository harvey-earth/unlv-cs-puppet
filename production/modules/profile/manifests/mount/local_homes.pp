# Local homes will set up pam mkhomedir so that users directories are not accessible to each other

class profile::mount::local_homes {

  if $facts['os']['name'] == 'Ubuntu' {
    file { '/etc/pam.d/common-session':
      ensure => 'present',
      source => 'puppet:///modules/profile/common-session',
      group  => 'root',
      owner  => 'root',
      mode   => '0644',
    }

    file { '/etc/pam.d/common-session-noninteractive':
      ensure => 'present',
      source => 'puppet://modules/profile/common-session-noninteractive',
      group  => 'root',
      owner  => 'root',
      mode   => '0644',
    }

  }

}
