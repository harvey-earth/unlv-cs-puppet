# Mounts directory for wotug.cs.unlv.edu

class profile::mount::wotug {

  selboolean { 'httpd_use_nfs':
    persistent => true,
    value      => on,
  }

  package { 'nfs-utils':
    ensure => installed,
  }

  mount { '/var/www/wotug':
    ensure  => mounted,
    device  => 'csfs01.cs.unlv.edu:/var/www/daisy-duck/www_WOTUG',
    fstype  => 'nfs',
    options => 'defaults,ro',
  }

}
