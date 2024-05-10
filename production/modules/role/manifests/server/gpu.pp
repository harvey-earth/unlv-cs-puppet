# Role for gpu.cs.unlv.edu
# Ubuntu 18

class role::server::gpu {

  include profile::repo::ubuntu
  include profile::base
  include profile::mail
  include profile::motd::gpu
  include profile::fw::ssh
  include profile::fw::hostsdeny
  #include profile::mount::homes
  include profile::monitor::login_ssh
  include profile::idm::cs_ad
  include profile::f2b::ssh
  include profile::programs::gpu

}
