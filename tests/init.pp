# #this test require that mysql and apache are created outside Moodle since it is correct that  Moodle cont on something that has
# aready placed

class { 'mysql':
}

class { 'mysql::server':
  config_hash => {
    'root_password' => 'password'
  },
  require     => Class['mysql']
}

# Database <<| tag == 'moodle_db' |>>
# Database_user <<| tag == 'moodle_db' |>>
Mysql::Db <<| tag == 'moodle_db' |>>

class { 'apache':
  require => Class['mysql']
}

class { 'apache::mod::php':
}

package { [php-mysql, php-gd, php-intl, php-mbstring, php-soap, php-xml, php-xmlrpc]:
  ensure  => present,
  require => Class['apache::mod::php']
}

package { zip:
  ensure => present;
}

class { 'moodle':
  tarball_url => 'http://sourceforge.net/projects/moodle/files/Moodle/stable23/moodle-2.3.3.tgz',
}

# http://download.moodle.org/download.php/stable23/moodle-latest-23.tgz

