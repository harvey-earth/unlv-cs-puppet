# Class to configure apache to work for wotug

class profile::web::wotug {

  if $facts['os']['family'] == 'RedHat' {

    selboolean { 'httpd_use_nfs':
      persistent => true,
      value      => on,
    }

    package { 'nfs-utils':
      ensure => installed,
    }

  }

  mount { '/var/www/html/wotug':
    ensure  => mounted,
    device  => 'csfs01.cs.unlv.edu:/var/www/daisy-duck/www_WOTUG',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'wotug.cs.unlv.edu':
    port           => '80',
    docroot        => '/var/www/html/wotug/html',
    access_log     => true,
    access_logs    => ['/var/log/httpd/wotug-access.log'],
    error_log      => true,
    error_log_file => '/var/log/httpd/wotug-error.log',
    serveradmin    => 'matt.pedersen@unlv.edu',
  }

}
