# Test class for Ubuntu 18

class role::server::ubuntutest {
  include profile::motd::sally
  #
  # These are not working
  include profile::virtualized
  #
  # Following manifests are working
  #
  # This works and is commented out now
  # include profile::monitor::login_ssh
  include profile::base
  include profile::fw::hostsdeny
  include profile::mount::homes
  include profile::idm::cs_ad
  include profile::repo::ubuntu
  include profile::f2b::ssh
  include profile::fw::ssh
  include profile::print::ponderosa
}
