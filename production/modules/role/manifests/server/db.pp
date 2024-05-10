# Role class for setting up student database db.cs.unlv.edu

class role::server::db {
  include profile::base
  include profile::mail
  include profile::idm::cs_ad
  include profile::db::student
}
