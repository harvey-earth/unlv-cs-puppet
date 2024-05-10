# This class puts the submit and getsubmit scripts on a server
#
# @summary A short summary of the purpose of this class
#
# @example
#   include submit
class submit {

  file { '/usr/bin/submit':
    ensure => present,
    group  => 'root',
    mode   => '0755',
    owner  => 'root',
    source => 'puppet:///modules/submit/submit',
  }

  file { '/usr/bin/getsubmit':
    ensure => present,
    group  => 'root',
    owner  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/submit/getsubmit',
  }

}
