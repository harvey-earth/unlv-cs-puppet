# Database setup for webtest
#
#   For NetAdmin

class profile::db::webtest {

  class { 'postgresql::globals':
    manage_package_repo => true,
    version             => '9.3',
  }

  class { 'postgresql::server':
  }

  postgresql::server::db { 'netadmin_production':
    user     => 'netadmin',
    password => postgresql_password('netadmin', 'xxxxxxx'),
  }

  postgresql::server::role { 'netadmin':
    password_hash => postgresql::postgresql_password('netadmin', 'xxxxxxx'),
    createdb      => true,
  }

  postgresql::server::database_grant { 'netadmin':
    privilege => 'ALL PRIVILEGES',
    db        => 'netadmin_production',
    role      => 'netadmin',
  }

  postgresql::server::pg_hba_rule { 'allow netadmin':
    description => 'Open PostgreSQL for netadmin to netadmin_production database',
    type        => 'host',
    database    => 'netadmin_production',
    user        => 'netadmin',
    address     => '127.0.0.1/32',
    auth_method => 'md5',
  }

}
