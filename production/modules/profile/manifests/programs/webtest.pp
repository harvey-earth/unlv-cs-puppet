class profile::programs::webtest {

  # Packages for Ruby on Rails
  package { 'nodejs':
    ensure => 'latest',
  }

  yumrepo { 'yarn.repo':
    ensure   => present,
    baseurl  => 'https://dl.yarnpkg.com/rpm/',
    enabled  => true,
    gpgkey   => 'https://dl.yarnpkg.com/rpm/pubkey.gpg',
    gpgcheck => true,
  }

  package { 'yarn':
    ensure => 'latest',
  }

  package { 'epel-release':
    ensure => 'latest',
  }

  # Packages for flask app
  package { 'python-pip':
    ensure => 'latest',
  }

  package { 'python-devel':
    ensure => 'latest',
  }

  package { 'python3':
    ensure => 'latest',
  }

  package { 'python3-devel':
    ensure => 'latest',
  }

  package { 'virtualenv':
    ensure   => 'latest',
    provider => 'pip',
  }

}
