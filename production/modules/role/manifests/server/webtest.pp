# Role for setting up web-test.cs.unlv.edu

class role::server::webtest {
  include profile::base
  include profile::virtualized
  include profile::db::webtest
  include profile::fw::nagios_ssh
  include profile::fw::web
  include profile::programs::webtest
  include profile::web::webtest
  include profile::web::facultymentor
}
