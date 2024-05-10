# site.pp top scope manifest
#
## Create firewall rules
resources { 'firewall':
  purge => true,
}
Firewall {
  before  => Class['cs_fw::post'],
  require => Class['cs_fw::pre'],
}
class { ['cs_fw::pre', 'cs_fw::post']: }
class { 'firewall': }

## Default node
node default {
}

## Puppetserver node
node 'puppet.cs.unlv.edu' {
  ## Configures puppet master to use puppetdb as puppetdb
  class { 'puppetdb::master::config':
    puppetdb_server => 'puppetdb.cs.unlv.edu',
  }
  firewall { '010 puppetserver':
    dport  => 8140,
    action => 'accept',
  }
}

## PuppetDB node
node 'puppetdb.cs.unlv.edu' {
  # Installs PostgreSQL and PuppetDB
  class { 'puppetdb::database::postgresql':
    listen_addresses => 'puppetdb.cs.unlv.edu',
  }
  class { 'puppetdb::server':
    database_host => 'puppetdb.cs.unlv.edu',
  }
  firewall { '011 puppetdb':
    dport  => 8081,
    source => '1.2.3.4/24',
    action => 'accept',
  }
  firewall { '012 puppetdbquery':
    dport  => 8080,
    source => '1.2.3.4/32',
    action => 'accept',
  }
}
## Lab Machines
### CentOS 7 B361 Test
node 'rh-cstest.cs.unlv.edu' {
  include role::lab::b361test
}

### All other lab machines start with rh-
node /^rh-*/ {
  include role::lab::b361
}

## Servers
node 'bobby.cs.unlv.edu' {
  include role::server::bobby
}

node 'cardiac.cs.unlv.edu' {
  include role::server::cardiac
}

node 'bob.cs.unlv.edu' {
  include role::server::bob
}

node /^elko-*/ {
  include role::server::elko
}

node 'java.cs.unlv.edu' {
  include role::server::java
}

node 'cssmp.cs.unlv.edu' {
  include role::server::cssmp
}

node 'sally.cs.unlv.edu' {
  include role::server::sally
}

node 'sally-new.cs.unlv.edu' {
  include role::server::sally
}

node 'gpu.cs.unlv.edu' {
  include role::server::gpu
}

### Webserver
node 'web2.cs.unlv.edu' {
  include role::server::web2
}
node 'web-test.cs.unlv.edu' {
  include role::server::webtest
}
