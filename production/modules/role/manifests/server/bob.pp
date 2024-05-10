# Bob server for faculty

class role::server::bob {
  include profile::base
  include profile::mail
  include profile::virtualized
  include profile::fw::ssh
  include profile::fw::hostsdeny
  include profile::f2b::ssh
  include profile::print::ponderosa
  include profile::programs::bobby
  include profile::mount::bob
  include profile::monitor::login_ssh
  include profile::idm::cs_ad
  include profile::motd::bob
}
