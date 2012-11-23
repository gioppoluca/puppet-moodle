# moodle #

This is the moodle module. It provides the functionality to install Moodle in a single host or multiple host (MySQL DB could be on a second host).

The approach is to let each module to manage it's own stuff so it depends on some puppetlabs modules.

The usage is:

# These are the requirements you have to place in the node you want to install
			class { 'mysql':
			}

			class { 'mysql::server':
			  config_hash => {
				'root_password' => 'password'
			  },
			  require     => Class['mysql']
			}

			Mysql::Db <<| tag == 'moodle_db' |>>

			class { 'apache':
			  require => Class['mysql']
			}

			class { 'apache::mod::php':
			}

			package { [php-mysql, php-gd, php-intl, php-mbstring, php-soap, php-xml, php-xmlrpc, sudo]:
			  ensure  => present,
			  require => Class['apache::mod::php'],
			  notify  => Service['httpd'],
			}

			package { zip:
			  ensure => present;
			}

# comes the proper Moodel class
			class { 'moodle':
			  tarball_url => 'http://sourceforge.net/projects/moodle/files/Moodle/stable23/moodle-2.3.3.tgz',
			}

The code is still under development, and in a pre-alfa stage, but should manage to install a working moodle installation.

TODO:
- Overall check
- using also package and not only the tgz
