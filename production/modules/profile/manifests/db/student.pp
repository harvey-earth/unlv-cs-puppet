# profile::db::student is the profile for the student database

class profile::db::student {
  include '::mysql::server'

  class { '::mysql::server':
    root_password           => 'xxxxxxx',
    remove_default_accounts => true,
    override_options        => $override_options,
  }
}
