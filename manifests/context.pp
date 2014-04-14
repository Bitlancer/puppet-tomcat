define tomcat::context(
  $path = "/",
  $docbase = undef,
  $debug = "0",
  $httponly = "true"
) {

  file { "context_dir":
    ensure => present,
    path = $tomcat::params::context_dir
  } ->
  file { "$name.xml":
    path = "$context_dir/$name",
    content => template('tomcat/context.erb'),
    require => Package['tomcat'],
    notify => Service['tomcat']
  }
}
