# === Class: moodle::params
#
#  The moodle configuration settings idiosyncratic to different operating
#  systems.
#
# === Parameters
#
# None
#
# === Examples
#
# None
#
# === Authors
#
# Lucsa Gioppo <gioppoluca@libero.it>
#
# === Copyright
#
# Copyright 2012 Luca Gioppo
#
class moodle::params {

  $tarball_url        = 'http://download.wikimedia.org/mediawiki/1.19/mediawiki-1.19.1.tar.gz'
  $conf_dir           = '/etc/mediawiki'
  $apache_daemon      = '/usr/sbin/apache2'
  $use_package        = false
  $db_host            = 'localhost'
  $db_name            = 'moodle'
  $db_user            = 'moodle'
  $db_password        = 'moodle'
  $site_url           = 'moodle.scuole-dev.cloudlabcsi.eu'
  $admin_user         = 'admin'
  $admin_password     = '1!admin0'
  $site_name          = 'Site Name'
  $site_desc          = 'Site Description'
  $moodle_data_path     = '/var/moodledata'
  $installation_files = ['api.php',
                         'api.php5',
                         'bin',
                         'docs',
                         'extensions',
                         'img_auth.php',
                         'img_auth.php5',
                         'includes',
                         'index.php',
                         'index.php5',
                         'languages',
                         'load.php',
                         'load.php5',
                         'maintenance',
                         'mw-config',
                         'opensearch_desc.php',
                         'opensearch_desc.php5',
                         'profileinfo.php',
                         'redirect.php',
                         'redirect.php5',
                         'redirect.phtml',
                         'resources',
                         'serialized',
                         'skins',
                         'StartProfiler.sample',
                         'tests',
                         'thumb_handler.php',
                         'thumb_handler.php5',
                         'thumb.php',
                         'thumb.php5',
                         'wiki.phtml']
  
  case $::operatingsystem {
    redhat, centos:  {
      $web_dir            = '/var/www/html'
      $doc_root           = "${web_dir}/wikis"
      $packages           = ['php-gd', 'php-mysql', 'wget']
      $web_user           = 'apache'
      $web_group          = 'apache'
    }
    debian:  {
      $web_dir            = '/var/www'
      $doc_root           = "${web_dir}/wikis"
      $packages           = ['php5', 'php5-mysql', 'wget']
      $web_user           = 'www-data'
      $web_group          = 'www-data'
    }
    ubuntu:  {
      $web_dir            = '/var/www'
      $doc_root           = "${web_dir}/wikis"
      $packages           = ['php5', 'php5-mysql', 'wget']
      $web_user           = 'www-data'
      $web_group          = 'www-data'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
