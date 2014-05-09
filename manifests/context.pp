define tomcat::context(
  $path = "/",
  $docbase = undef,
  $debug = "0",
  $httponly = "true",
  $resources = [],
  $manager = {}
) {

  exec { "mkdir -p $tomcat::context_dir":
    unless => "test -d $tomcat::context_dir",
    path => ["/bin", "/usr/bin", "/usr/sbin", "/usr/local/bin"]
  } ->
  file { "$name":
    path => "$tomcat::context_dir/$name.xml",
    content => template('tomcat/context.erb'),
    require => Package['tomcat'],
    notify => Service['tomcat']
  }
}
