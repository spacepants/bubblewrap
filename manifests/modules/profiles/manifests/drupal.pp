class profiles::drupal {

  require ::profiles::mariadb
  require ::epel

  $admin_pw = hiera('www::admin_pw')
  $db_name  = hiera('www::db_name')
  $db_user  = hiera('www::db_user')
  $db_pass  = hiera('www::db_pass')
  $site_url = hiera('www::site_url')

  class { '::nginx': } ->
  class { '::ius': } ->
  class { '::redis': } ->
  class { '::php': } ->
  class { '::drupal': } ->
  mysql::db { $db_name:
    ensure   => present,
    user     => $db_user,
    password => $db_pass,
    host     => 'localhost',
    grant    => ['all'],
  } ->
  drupal::site { $site_url:
    admin_password => $admin_pw,
    database       => $db_name,
    db_user        => $db_user,
    db_password    => $db_pass,
    db_host        => 'localhost',
    db_port        => '3306',
    db_driver      => 'mysql',
    docroot        => '/var/www',
    dev            => true,
    web_user       => 'nginx',
    web_group      => 'nginx',
  }

}
