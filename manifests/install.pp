class grafana::install inherits grafana {

  if($grafana::manage_package)
  {
    package { $grafana::params::package_name:
      ensure => $grafana::package_ensure,
    }
  }

}
