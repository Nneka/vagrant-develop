package { "apache2":
	ensure => present,
}

class { "apache":
	default_vhost => false,
}
	
apache::vhost { "recipebox.com":
   port => "80",
   docroot => "/vagrant/docroot/baseline_gov/www/fnsdev",
   directories => [
		{  "path" => "/vagrant/docroot/baseline_gov/www/fnsdev",
		   "provider" => "files",
		   "deny" => "from all",
		 },
   ],
}

include "::mysql::server"

mysql::db { "recipebox_db":
	user => "recipebox_user",
	password => "love01hate",
	host => "localhost",
	grant => ["ALL"],
}