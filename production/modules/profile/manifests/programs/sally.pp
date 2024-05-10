# List of packages to install for sally 

class profile::programs::sally {

  package { 'emacs':
    ensure => latest,
  }

  package { 'vim':
    ensure => latest,
  }

  package { 'valgrind':
    ensure => latest,
  }

  package { 'gcc':
    ensure => latest,
  }

  package { 'g++':
    ensure => latest,
  }

  package { 'clisp':
    ensure => latest,
  }

  package { 'libncurses5-dev':
    ensure => latest,
  }

  package { 'gnuplot':
    ensure => latest,
  }

  package { 'gcl':
    ensure => latest,
  }

  package { 'sbcl':
    ensure => latest,
  }

  package { 'gprolog':
    ensure => latest,
  }

  package { 'geany':
    ensure => latest,
  }

  package { 'make':
    ensure => latest,
  }

}
