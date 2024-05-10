# Profile to configure grub for labs
# Configures Windows 10 menu entry to boot to hd1

class profile::grub::b361 {

  include class { 'grub': }

}
