# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include mail
class mail {

  file { '/etc/postfix/main.cf':
    ensure => file,
    source => 'puppet:///modules/mail/main.cf',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    notify => Service['postfix'],
  }

  service { 'postfix':
    ensure => 'running',
    enable => true,
  }

  file { '/etc/aliases':
    ensure => file,
    source => 'puppet:///modules/mail/aliases',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  exec { '/usr/bin/newaliases':
    subscribe   => File['/etc/aliases'],
    refreshonly => true,
  }

}
