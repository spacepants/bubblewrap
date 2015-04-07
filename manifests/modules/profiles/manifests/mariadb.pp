class profiles::mariadb {

  yumrepo { 'mariadb':
    ensure   => present,
    descr    => 'MariaDB',
    baseurl  => 'http://yum.mariadb.org/10.0/centos6-amd64',
    gpgkey   => 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
    gpgcheck => '0',
  } ->
  group { 'mysql':
    ensure => present,
    system => true,
  } ->
  user { 'mysql':
    ensure  => present,
    system  => true,
    comment => 'MySQL server',
    home    => '/var/lib/mysql',
    shell   => '/sbin/nologin',
  } ->
  file { [ '/var/log/mariadb', '/var/run/mariadb', ]:
    ensure => directory,
    mode   => '0755',
    owner  => 'mysql',
    group  => 'mysql',
  } ->
  class { '::mysql::server':
    includedir       => '/etc/my.cnf.d/galera',
    override_options => hiera('mysql::server::override_options', {})
  }

}
