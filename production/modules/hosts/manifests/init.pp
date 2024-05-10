# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include hosts
class hosts {

  file { '/etc/hosts.deny':
    ensure => 'file',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/hosts/hosts.deny',
  }

}
