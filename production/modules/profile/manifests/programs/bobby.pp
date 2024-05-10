# Programs and services to install/remove for bobby

class profile::programs::bobby {

  package { 'gcc-c++':
    ensure => 'latest',
  }

  package { 'gcc':
    ensure => 'latest',
  }

  package { 'yasm':
    ensure => 'latest',
  }

  package { 'gdb':
    ensure => 'latest',
  }

  package { 'mlocate':
    ensure => 'latest',
  }

  package { 'geany':
    ensure => 'latest',
  }

  package { 'emacs':
    ensure => 'latest',
  }

  package { 'vim':
    ensure => 'latest',
  }

  package { 'valgrind':
    ensure => 'latest',
  }

  package { 'ddd':
    ensure => 'latest',
  }

  package { 'sox':
    ensure => 'latest',
  }

  package { 'unzip':
    ensure => 'latest',
  }

  package { 'ImageMagick':
    ensure => 'latest',
  }

  package { 'ImageMagick-devel':
    ensure => 'latest',
  }

  package { 'gnuplot':
    ensure => 'latest',
  }

  package { 'make':
    ensure => 'latest',
  }

  package { 'xorg-x11-server-Xorg':
    ensure => 'latest',
  }

  package { 'xorg-x11-xauth':
    ensure => 'latest',
  }

  package { 'xorg-x11-apps':
    ensure => 'latest',
  }

  package { 'nodejs':
    ensure => 'latest',
  }

  package { 'ruby':
    ensure => 'latest',
  }

  package { 'centos-release-scl':
    ensure => 'installed',
  }

  # Devtoolset-7 and 8 require centos-release-scl
  package { 'devtoolset-7':
    ensure => 'latest',
  }

  package { 'devtoolset-8':
    ensure => 'latest',
  }

  package { 'devtoolset-9':
    ensure => 'latest',
  }

  file { '/usr/local/bin/g++':
    ensure => link,
    target => '/opt/rh/devtoolset-9/root/bin/g++',
  }

  package { 'gprolog':
    ensure => 'latest',
  }

  package { 'sbcl':
    ensure => 'latest',
  }

  package { 'rh-python36':
    ensure => 'latest',
  }

  package { 'rh-python35':
    ensure => 'latest',
  }

}
