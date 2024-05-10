# Class to set up databases needed for daisy-duck-1

class profile::db::daisyduck {
  include '::mysql::server'

  class { '::mysql::server':
    root_password           => 'xxxxx',
    remove_default_accounts => true,
  }

}
