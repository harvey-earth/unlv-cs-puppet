# Class to configure apache to work for processj.cs.unlv.edu

class profile::web::processj {

  if $facts['os']['family'] == 'RedHat' {

    selboolean { 'httpd_use_nfs':
      persistent => true,
      value      => on,
    }

    package { 'nfs-utils':
      ensure => installed,
    }

  }

  mount { '/var/www/html/processj':
    ensure  => mounted,
    device  => 'csfs01.cs.unlv.edu:/var/www/daisy-duck/www_processj',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'processj.cs.unlv.edu':
    port           => '80',
    docroot        => '/var/www/html/processj/html',
    access_log     => true,
    access_logs    => ['/var/log/httpd/processj-access.log'],
    error_log      => true,
    error_log_file => '/var/log/httpd/processj-error.log',
    serveradmin    => 'matt.pedersen@unlv.edu',
  }

}
