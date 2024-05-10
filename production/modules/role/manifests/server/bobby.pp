# Role for bobby.cs.unlv.edu
# Includes profiles to set up

class role::server::bobby {
  include profile::base
  include profile::limits
  include profile::mail
  include profile::virtualized
  include profile::fw::ssh
  include profile::fw::hostsdeny
  include profile::f2b::ssh
  include profile::motd::bobby
  include profile::print::ponderosa
  include profile::mount::homes
  include profile::monitor::login_ssh
  include profile::idm::cs_ad
  include profile::programs::submit
  include profile::programs::bobby
}
