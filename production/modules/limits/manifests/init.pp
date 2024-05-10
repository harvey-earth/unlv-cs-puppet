# limits
#
#  This module will place limits.conf in the proper location
#
class limits {

  file { '/etc/security/limits.d/student_limits.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/limits/student_limits.conf',
  }

  file { '/etc/security/limits.d/fac_limits.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/limits/fac_limits.conf',
  }

  file { '/etc/security/limits.d/default_limits.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/limits/default_limits.conf',
  }

}
