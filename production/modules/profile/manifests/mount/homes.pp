# Mounts home directories from csfs01

class profile::mount::homes {

  if $facts['os']['family'] == 'RedHat' {
    selboolean { 'use_nfs_home_dirs':
      persistent => true,
      value      => on,
    }

    selboolean { 'xdm_write_home':
      persistent => true,
      value      => on,
    }
  }

  if $facts['os']['family'] == 'RedHat' {
    package { 'nfs-utils':
      ensure => installed,
    }
  } else {
    package { 'nfs-common':
      ensure => installed,
    }
  }

  mount { '/home':
    ensure  => mounted,
    device  => 'csfs.cs.unlv.edu:/home',
    fstype  => 'nfs',
    options => 'defaults,auto',
  }

}
