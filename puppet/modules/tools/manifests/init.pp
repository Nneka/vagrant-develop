class tools {

  # package install list
  $packages = [
    "curl",
    "vim",
    "git",
    "unzip",
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}