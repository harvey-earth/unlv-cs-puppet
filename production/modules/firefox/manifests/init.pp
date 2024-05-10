# firefox
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include firefox
class firefox {

  if ($::osfamily == 'RedHat') {
    file { '/etc/firefox/pref/autoconfig.js':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/firefox/autoconfig.js',
    }->
    file { '/usr/lib64/firefox/firefox.cfg':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/firefox/firefox.cfg',
    }
  }

}
