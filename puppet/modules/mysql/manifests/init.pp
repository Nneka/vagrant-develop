class mysql {
  $mysqlpw = "ezr2TYP#"
  $user = "recipebox_user"
  $password = "3P!dural"

  package { "mysql-server":
    ensure => present,
    require => Exec["apt-get update"]
  }

  service { "mysql":
    ensure => running,
    require => Package["mysql-server"],
  }

  exec { "set-mysql-password":
    unless => "mysqladmin -uroot -p$mysqlpw status",
    command => "mysqladmin -uroot password $mysqlpw",
    require => Service["mysql"],
  }
  
  define mysqldb( $user, $password ) {
     exec { "create-${name}-db":
       unless => "/usr/bin/mysql -u${user} -p${password} ${name}",
       command => "/usr/bin/mysql -uroot -p$mysql_password -e \"create database ${name}; grant all on ${name}.* to ${user}@localhost identified by '$password';\"",
      require => Service["mysqld"],
    }
  }


  
  }