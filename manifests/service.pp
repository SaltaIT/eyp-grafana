class grafana::service inherits grafana {

  #
  validate_bool($grafana::manage_docker_service)
  validate_bool($grafana::manage_service)
  validate_bool($grafana::service_enable)

  validate_re($grafana::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${grafana::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $grafana::manage_docker_service)
  {
    if($grafana::manage_service)
    {
      service { $grafana::params::service_name:
        ensure => $grafana::service_ensure,
        enable => $grafana::service_enable,
      }
    }
  }
}
