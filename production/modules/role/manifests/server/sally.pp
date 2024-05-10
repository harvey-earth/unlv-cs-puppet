# Role for sally.cs.unlv.edu
# Ubuntu 18

class role::server::sally {

  include profile::base
  include profile::limits
  include profile::mail
  include profile::virtualized
  include profile::motd::sally
  include profile::fw::ssh
  include profile::fw::hostsdeny
  include profile::mount::homes
  include profile::monitor::login_ssh
  include profile::idm::cs_ad
  #include profile::repo::ubuntu
  include profile::f2b::ssh
  include profile::print::ponderosa
  include profile::programs::sally
  include profile::services::sally
  include profile::cron::threeam_reboot

}
