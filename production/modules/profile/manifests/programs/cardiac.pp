# Programs and services to install/remove

class profile::programs::cardiac {

  package { 'gcc':
    ensure => 'latest',
  }

  package { 'cpp':
    ensure => 'latest',
  }

  package { 'g++':
    ensure => 'latest',
  }

  package { 'make':
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

  package { 'nasm':
    ensure => 'latest',
  }

  package { 'yasm':
    ensure => 'latest',
  }

  package { 'gnuplot':
    ensure => latest,
  }

  package { 'libncurses5-dev':
    ensure => latest,
  }

  package { 'libncursesw5-dev':
    ensure => latest,
  }


}
