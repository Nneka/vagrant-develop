class apache {
  package { "apache2":
    ensure => present,
  }
  
  file { "/etc/apache2/sites-available/vagrant_webroot":
    ensure => present,
    source => "/vagrant/puppet/manifests/vagrant_webroot",
    require => Package["apache2"],
  }
  
  
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
    subscribe => [
      File["/etc/apache2/sites-available/vagrant_webroot"]
    ],
  }

}