# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include postfix
class postfix {

  if $facts['os']['family'] == 'RedHat' {
    file { '/etc/postfix/main.cf':
      ensure  => 'present',
      source  => 'puppet:///modules/postfix/main.cf.r7',
      group   => 'root',
      owner   => 'root',
      mode    => '0644',
      notify  => Service['postfix'],
    }
  }
  elsif $facts['os']['name'] == 'Ubuntu' {
    file { '/etc/postfix/main.cf':
      ensure  => 'present',
      source  => 'puppet:///modules/postfix/main.cf.ub',
      group   => 'root',
      owner   => 'root',
      mode    => '0644',
      notify  => Service['postfix'],
    }

    package { 'mailutils':
      ensure => latest,
    }

    package { 'postfix':
      ensure => latest,
    }

  }

  service { 'postfix':
    ensure => 'running',
  }

}
