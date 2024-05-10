# Sets up mail to relay at mail.oit.unlv.edu

class profile::mail {

  include class { 'postfix': }

  include class { 'aliases': }
}
