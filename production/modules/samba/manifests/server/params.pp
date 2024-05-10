# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include samba::server::params
class samba::server::params {
  case $::osfamily {
    'Redhat': {
      $smb_service_name = 'smbd'
      $nmb_service_name = 'nmbd'
      $server_package_name = 'samba'
      $samba_com_package_name = 'samba-common'
      $client_package_name = 'samba-client'
    }

    default: {
      fail("${::osfamily} does not work with samba puppet module")
    }
  }
}
