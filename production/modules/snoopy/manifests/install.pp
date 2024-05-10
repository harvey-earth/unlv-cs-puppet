# snoopy::install
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include snoopy::install
class snoopy::install {
  # Download snoopy installation script
  file { 'https://github.com/a2o/snoopy/raw/install/doc/install/bin/snoopy-install.sh':
    ensure => 'present',
    path   => '/tmp/snoopy-install.sh',
    mode   => '0755'
  }
  # Install Snoopy stable version
  exec { '/tmp/snoopy-install.sh stable':
    cwd     => '/tmp',
    command => '',
    path    => [ '/bin/bash' ],
    unless  => [ 'test -f /tmp/snoopy-install.sh']
  }
}
