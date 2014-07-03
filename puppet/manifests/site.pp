node "development.recipebox.vm" {

Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

exec { 'apt-get update':
    command => '/usr/bin/apt-get update'
  }

include tools
include apache
include mysql
include php
include drush




}