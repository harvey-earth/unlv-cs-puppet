# Class to configure apache to work for yabb.cs.unlv.edu

class profile::web::yabb {

  if $facts['os']['family'] == 'RedHat' {

    selboolean { 'httpd_use_nfs':
      persistent => true,
      value      => on,
    }

    package { 'nfs-utils':
      ensure => installed,
    }

  }

  mount { '/var/www/html/yabb':
    ensure  => mounted,
    device  => 'csfs01.cs.unlv.edu:/var/www/daisy-duck/yabb',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'yabb.cs.unlv.edu':
    port           => '80',
    docroot        => '/var/www/html/yabb/html',
    access_log     => true,
    access_logs    => ['/var/log/httpd/yabb-access.log'],
    error_log      => true,
    error_log_file => '/var/log/httpd/yabb-error.log',
    serveradmin    => 'matt.pedersen@unlv.edu',
  }

}
