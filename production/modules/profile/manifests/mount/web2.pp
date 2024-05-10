# Mounts directories for web2.cs.unlv.edu

class profile::mount::web2 {

  selboolean { 'httpd_use_nfs':
    persistent => true,
    value      => on,
  }

  package { 'nfs-utils':
    ensure => installed,
  }

  mount { '/var/www/munki':
    ensure  => mounted,
    device  => 'csfs01.cs.unlv.edu:/var/www/munki',
    fstype  => 'nfs',
    options => 'defaults,ro',
  }

}
