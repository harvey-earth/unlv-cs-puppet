# Profile that sets up mysql database server for GPU

class profile::db::gpu {
  include '::mysql::server'

  class { '::mysql::server':
    root_password           => 'xxxxx',
    remove_default_accounts => true,
    restart                 => true,
  }

}
