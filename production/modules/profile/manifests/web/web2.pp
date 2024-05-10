# Class to configure apache to work for santaclaus, wotug, and yabb

class profile::web::web2 {

  class { 'apache':
    default_vhost => false,
  }

  apache::vhost { 'munki.cs.unlv.edu':
    port    => '80',
    docroot => '/var/www/munki',
  }

}
