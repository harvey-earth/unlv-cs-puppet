# snoopy::configure
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include snoopy::configure
class snoopy::configure (
  $username          = undef,
  $userid            = undef,
  $groupid           = undef,
  $superid           = undef,
  $terminal          = undef,
  $currentdirectory  = undef,
  $processid         = undef,
  $filename          = undef,
  $logfile           = undef,
  $logpath           = undef,
  $datetime          = undef
) {
  file { 'Create snoopy configuration file':
    ensure  => 'present',
    path    => '/etc/snoopy.ini',
    content => template('snoopy/snoopy.ini.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644'
  }
}
