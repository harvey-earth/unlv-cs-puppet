# Role for B361 Lab Computers with no Windows 10

class role::lab::b361nowin {
  include profile::base
  include profile::login
  include profile::firefox
  include profile::idm::cs_ad
  include profile::mount::homes
  include profile::print::ponderosa
  include profile::monitor::login_local
  include profile::programs::b361
  include profile::cron::midnight_reboot
}
