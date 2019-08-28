class grafana::install inherits grafana {

  if($grafana::manage_package)
  {
    if($grafana::params::apt_source_location!=undef)
    {
      include ::apt

      apt::key { 'grafana':
        key        => $grafana::params::apt_key,
        key_source => $grafana::params::apt_key_source,
      }

      apt::source { 'grafana':
        location => $grafana::params::apt_source_location,
        release  => 'stable',
        require  => Apt::Key['grafana'],
      }

      Package[$grafana::params::package_name] {
        require => Exec['eyp-apt apt-get update'],
      }
    }

    package { $grafana::params::package_name:
      ensure => $grafana::package_ensure,
    }
  }

}
