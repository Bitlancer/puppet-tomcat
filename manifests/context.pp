define tomcat::context(
  $path = "/",
  $docbase = undef,
  $debug = "0",
  $httponly = "true"
) {

  file { "$name.xml":
    path = "$context_dir/$name",
    content => template('tomcat/context'),
    require => Package['tomcat'],
    notify => Service['tomcat']
  }
}
