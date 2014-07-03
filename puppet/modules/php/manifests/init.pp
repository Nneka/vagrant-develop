class php {

	package { ['php5',
             'php5-cli',
             'libapache2-mod-php5',
             'php-apc',
             'php5-curl',
             'php5-dev',
             'php5-gd',
             'php5-json',
             'php5-mcrypt',
             'php5-memcache',
             'php5-mysql',
             'php5-tidy',
             'php5-xdebug',
             'php5-xmlrpc',
             'php5-xsl']:
    ensure => present;
  }

}