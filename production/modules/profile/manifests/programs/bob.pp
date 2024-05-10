# Programs and services to install/remove

class profile::programs::bob {

  package { 'vim':
    ensure => 'latest',
  }

  package { 'emacs':
    ensure => 'latest',
  }

  package { 'gcc*':
    ensure => 'latest',
  }

  package { 'yasm':
    ensure => 'latest',
  }

  package { 'gdb':
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

  package { 'java-1.8.0-openjdk*':
    ensure => 'latest',
  }

}
