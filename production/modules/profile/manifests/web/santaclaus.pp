# Class to configure apache to work for santaclausproblem.cs.unlv.edu

class profile::web::santaclaus {

  if $facts['os']['family'] == 'RedHat' {

    selboolean { 'httpd_use_nfs':
      persistent => true,
      value      => on,
    }

    package { 'nfs-utils':
      ensure => installed,
    }

  }

  mount { '/var/www/html/santaclaus':
    ensure  => mounted,
    device  => 'csfs01.cs.unlv.edu:/var/www/daisy-duck/www_SantaClaus',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'santaclausproblem.cs.unlv.edu':
    port           => '80',
    docroot        => '/var/www/html/santaclaus/html',
    access_log     => true,
    access_logs    => ['/var/log/httpd/santaclaus-access.log'],
    error_log      => true,
    error_log_file => '/var/log/httpd/santaclaus-error.log',
    serveradmin    => 'matt.pedersen@unlv.edu',
  }

}
