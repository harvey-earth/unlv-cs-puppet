# Role class for setting up web2

class role::server::web2 {
  include profile::base
  include profile::virtualized
  #include profile::mount::web2
  include profile::monitor::nrpe::check_users
  #include profile::web::web2
  #include profile::fw::web
}
