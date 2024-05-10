# Class for programs for cssmp

class profile::programs::cssmp {

  package { 'openmpi-bin':
    ensure => latest,
  }

  package { 'vim':
    ensure => latest,
  }

  package { 'emacs':
    ensure => latest,
  }

  package { 'geany':
    ensure => latest,
  }

  package { 'gcc':
    ensure => latest,
  }

  package { 'g++':
    ensure => latest,
  }

  package { 'valgrind':
    ensure => latest,
  }

  package { 'make':
    ensure => latest,
  }

  package { 'default-jre':
    ensure => latest,
  }

  package { 'default-jdk':
    ensure => latest,
  }

}
