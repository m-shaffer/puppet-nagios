# nagios::check::services
class nagios::check::services($services) {
  create_resources(nagios::check::service, $services)
}

