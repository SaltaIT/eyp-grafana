class grafana::params {

  $package_name='grafana'
  $service_name='grafana-server'

  case $::osfamily
  {
    'redhat':
    {
      case $::operatingsystemrelease
      {
        /^[7-8].*$/:
        {
          fail('unimplemented')
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      case $::operatingsystem
      {
        'Ubuntu':
        {
          $apt_source_location = 'https://packages.grafana.com/oss/deb'
          $apt_key_source = 'https://packages.grafana.com/gpg.key'
          $apt_key = '54754BA7A63B8C9E73D8BFCB81140F31DD4C2D55'
          case $::operatingsystemrelease
          {
            /^1[68].*$/:
            {
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
