# Role for B361 Lab Computers

class role::lab::b361 {
  include profile::base
  include profile::login
  include profile::firefox
  include profile::idm::cs_ad
  include profile::mount::homes
  include profile::print::ponderosa
  include profile::monitor::login_local
  include profile::programs::b361
  #include profile::grub::b361
  #include profile::cron::midnight_reboot
}
