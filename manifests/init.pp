class tomcat (
  $version = 'present',
  $package = $tomcat::params::tomcat_package,
  $java_home = $tomcat::params::java_home,
  $catelina_home = $tomcat::params::user_homedir,
  $context_dir = $tomcat::params::context_dir,
  $runas = $tomcat::params::user,
  $waitfor = 30,
  $security = 'on',
  $java_opts = undef
) inherits tomcat::params {

  include ::java

  package { 'tomcat':
    ensure => $version,
    name   => $package,
    before => Service['tomcat'],
  } -> 
  file { 'config-file':
    ensure => 'present',
    purge => true,
    path => $tomcat::params::config_path,
    content => template('tomcat/config.erb'),
  } ~>
  service { 'tomcat':
    ensure => running,
    enable => true,
    name   => $tomcat::params::service,
  }
}
