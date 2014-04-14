define tomcat::context(
  $path = "/",
  $docbase = undef,
  $debug = "0",
  $httponly = "true"
) {

  file { "$name":
    path => "$tomcat::context_dir/$name.xml",
    content => template('tomcat/context.erb'),
    require => Package['tomcat'],
    notify => Service['tomcat']
  }
}
