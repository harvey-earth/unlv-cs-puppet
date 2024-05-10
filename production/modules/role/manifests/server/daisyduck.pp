# Role class for setting up daisy-duck.cs.unlv.edu webserver

class role::server::daisyduck {
  include profile::base
  include profile::mail
  include profile::virtualized
  include profile::monitor::nrpe::check_users
  include profile::web::wotug
  include profile::web::santaclaus
  include profile::web::processj
  include profile::web::yabb
  include profile::fw::web
}
