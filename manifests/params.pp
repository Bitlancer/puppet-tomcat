class tomcat::params {

  case $::osfamily {
    default: { fail("unsupported OS: ${::osfamily}") }
    'RedHat': {
      $user            = 'tomcat'
      $group           = 'tomcat'
      $service         = 'tomcat6'
      $tomcat_package  = 'tomcat6'
      $user_homedir    = '/usr/share/tomcat6'
      $context_dir     = '/etc/tomcat6/Catelina/localhost'
    }
    'Debian': {
      $user            = 'tomcat6'
      $group           = 'tomcat6'
      $service         = 'tomcat6'
      $tomcat_package  = 'tomcat6'
      $user_homedir    = '/usr/share/tomcat6'
      $context_dir     = '/etc/tomcat6/Catelina/localhost'
    }
  }
}
