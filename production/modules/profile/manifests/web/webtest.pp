# Profile to set up web stuff for webtest
#
#   NetAdmin uses
#     nginx
#     phusion passenger
#
class profile::web::webtest {

  include nginx

  file { '/etc/nginx/conf.d/passenger.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/web/passenger.conf',
  }

  file { '/etc/nginx/conf.d/netadmin.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/web/netadmin_nginx.conf',
  }

  file { '/etc/nginx/conf.d/dynamic-pages.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/web/netadmin_dynamic_pages.conf',
  }

  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    source => 'puppet:///modules/web/default.conf',
  }

  # Allow httpd_can_network_connect for nginx proxy to work
  selboolean { 'httpd_can_network_connect':
    persistent => true,
    value      => 'on',
  }

}
