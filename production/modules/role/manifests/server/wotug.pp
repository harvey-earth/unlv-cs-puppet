# Role class for setting up wotug

class role::server::wotug {
  include profile::base
  include profile::virtualized
  include profile::fw::web
  include profile::monitor::ssh
  include profile::monitor::web
  include profile::mount::wotug
  include profile::web::wotug
}
