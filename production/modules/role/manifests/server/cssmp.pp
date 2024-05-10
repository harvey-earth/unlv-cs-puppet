# Role for cssmp.cs.unlv.edu

class role::server::cssmp {

  include profile::base
  include profile::mail
  include profile::f2b::ssh
  include profile::fw::hostsdeny
  include profile::fw::ssh
  include profile::repo::ubuntu
  include profile::monitor::login_ssh
  include profile::motd::cssmp
  include profile::mount::homes
  include profile::idm::cs_ad
  include profile::programs::cssmp

}
