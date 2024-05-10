# List of packages to install for java

class profile::programs::java {

  package { 'emacs':
    ensure => latest,
  }

  package { 'ant':
    ensure => latest,
  }

  package { 'devtoolset-3':
    ensure => latest,
  }

  package { 'gcc':
    ensure => latest,
  }

  package { 'gdb':
    ensure => latest,
  }

  package { 'java-1.8.0-openjdk':
    ensure => latest,
  }

  package { 'rh-python38':
    ensure => latest,
  }

}
