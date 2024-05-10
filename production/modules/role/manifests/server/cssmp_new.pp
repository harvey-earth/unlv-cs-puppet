# Test role for cssmp.cs.unlv.edu

class role::server::cssmp_new {

  include profile::base
  include profile::fw::hostsdeny
  include profile::fw::ssh
  include profile::repo::ubuntu
  include profile::virtualized
  include profile::monitor::login_ssh
  include profile::motd::cssmp
  include profile::mount::homes
  include profile::idm::cs_ad
  include profile::f2b::ssh
  include profile::programs::cssmp

}
