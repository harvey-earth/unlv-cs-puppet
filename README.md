# Puppet CS Code

This was created to start using configuration management for the UNLV CS Department.
It is old and not in use anymore, with their environment going through an entire overhaul.
Therefore it is now safe for me to release this code as none of these servers exist anymore.

This was in a private GitLab instance with a runner installed on the puppetserver, so CI/CD is extremely basic for this.

## Layout
- Changes are only made in dev or dev-\* 
- Inside production there are manifests, modules
- Uses Roles and Profiles method
  - Each node is assigned a single role
  - Each role is made up of several profiles that configure the machine completely
  - Each profile is made up of modules that configure a tech stack (e.g. mounting directories)

### Roles
- role::labs::
  - Role(s) for Lab machines
  - Make changes in b361test first so you don't mess up lab computers
- role::server::
  - Each role here ends with the hostname that role is assigned to

### Profiles
- firewall
  - 000-020
    - Base rules
  - 050-100
    - DDOS Rules
  - 999
    - Drop all
- profile::base
  - Sets up ntp and resolv
- profile::firefox
  - Sets up firefox
- profile::login
  - B361 Lab login screen customizations
- profile::virtualized
  - Sets up ovirt-guest-agent
- profile::cron::midnight_reboot
  - Crontab to reboot at midnight (for B361 lab computers)
- profile::db::student
  - TODO: Set up mysql (mariadb)
- profile::f2b::ssh
  - Sets up fail2ban with ssh and ssh-ddos jails
- profile::fw::hostsdeny
  - Adds [hosts.deny from hosts module](production/modules/hosts/files/hosts.deny) to /etc/hosts.deny
- profile::fw::ssh
  - Rule 030 accept all ssh on TCP 22
- profile::fw::web
  - Rule 031 accept all http on TCP 80
- profile::fw::webs
  - Rule 032 accept all https on TCP 443
- profile::grub::b361
  - Sets Windows 10 as hd1 in grub boot menu
- profile::idm::cs_ad
  - Uses realm to join to AD
- profile::monitor::login_local
  - Filebeat monitor of local logins for B361 lab
- profile::monitor::ssh
  - Filebeat monitor for ssh logins
- profile::monitor::snoopy
  - TODO: Set up to track user commands
- profile::motd::[hostname]
  - Takes motd file from motd module
- profile::mount::homes
  - Mounts csfs01.cs.unlv.edu:/home as /home
- profile::mount::bob
  - Autofs to mount /home/[user] in /home and webfiles in /var/www/html/[user]
- profile::print::ponderosa
  - Sets up cups to print to printers_cs print queue
- profile::programs::[hostname]
  - Adds packages and repos

### Modules
- Contains manifests with class information
- Contains files that hold files to copy
- Contains templates that hold templates to copy
- Spec contains unit tests to be run
- Data has Hiera data
- DON'T UPGRADE puppetlabs-stdlib

#### Module List
- Apache
- Apt
- Archive
- Concat
- DNSclient
- Filebeat
- Firewall
- HAProxy
- Inifile
- motd
- mySQL
- NFS
- NTP
- PostgreSQL
- Powershell
- PuppetDB
- Realmd
- Registry
- Resolv
- SeLinux
- Stdlib ( ___DO NOT UPGRADE PAST 4.25.1 SO MANY DEPENDENCIES FOR < 5.0.0___ )
- Translate

## CI Pipelines
- Master
  - Build
    - Pulls code from master branch
  - Test
    - Puppet-lint and check syntax
    - TODO: Add tests to check that catalog will compile
  - Deploy
    - Remove all code from /etc/puppetlabs/code/environments/ and put everything from production directory in. Remove README and .git
