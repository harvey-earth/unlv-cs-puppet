# snoopy
#
# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include snoopy
class snoopy (
  $user_name         = $::snoopy::params::username,
  $user_id           = $::snoopy::params::userid,
  $group_id          = $::snoopy::params::groupid,
  $super_id          = $::snoopy::params::superid,
  $terminal          = $::snoopy::params::terminal,
  $current_directory = $::snoopy::params::currentdirectory,
  $process_id        = $::snoopy::params::processid,
  $file_name         = $::snoopy::params::filename,
  $log_file          = $::snoopy::params::logfile,
  $log_path          = $::snoopy::params::logpath,
  $date_time         = $::snoopy::params::datetime
) inherits snoopy::params {
  class { 'snoopy::install': }
  class { 'snoopy::configure':
    username         => $user_name,
    userid           => $user_id,
    groupid          => $group_id,
    superid          => $super_id,
    terminal         => $terminal,
    currentdirectory => $current_directory,
    processid        => $process_id,
    filename         => $file_name,
    logfile          => $log_file,
    logpath          => $log_path,
    datetime         => $date_time
  }
}
