# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include aliases
class aliases {

  if $facts['os']['family'] == 'RedHat' {
    file { '/etc/aliases':
      ensure => 'present',
      source => 'puppet:///modules/aliases/aliases.rh',
      group  => 'root',
      owner  => 'root',
      mode   => '0644',
      notify => Exec['newaliases'],
    }
  }
  elsif $facts['os']['name'] == 'Ubuntu' {
    file { '/etc/aliases':
      ensure => 'present',
      source => 'puppet:///modules/aliases/aliases.ub',
      group  => 'root',
      owner  => 'root',
      mode   => '0644',
      notify => Exec['newaliases'],
    }
  }

  exec { 'newaliases':
    path        => ['/usr/bin', '/usr/sbin'],
    refreshonly => true,
  }
}
