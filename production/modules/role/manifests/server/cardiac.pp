# Cardiac Role includes profiles needed

class role::server::cardiac {
  include profile::base
  include profile::limits
  include profile::mail
  include profile::virtualized
  include profile::fw::ssh
  include profile::fw::hostsdeny
  #include profile::fw::ddos
  include profile::f2b::ssh
  include profile::motd::cardiac
  include profile::print::ponderosa
  include profile::repo::ubuntu
  include profile::mount::homes
  include profile::monitor::login_ssh
  include profile::idm::cs_ad
  include profile::programs::cardiac
}
