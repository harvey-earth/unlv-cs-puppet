# Profile for Ubuntu to include other repositories other than main

class profile::repo::ubuntu {

  class { 'apt':
    sources => lookup('apt::sources'),
  }

}
