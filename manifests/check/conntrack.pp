class nagios::check::conntrack (
  $ensure                   = undef,
  $args                     = '75% 90%',
  $check_title              = $::nagios::client::host_name,
  $servicegroups            = undef,
  $check_period             = $::nagios::client::service_check_period,
  $contact_groups           = $::nagios::client::service_contact_groups,
  $first_notification_delay = $::nagios::client::service_first_notification_delay,
  $max_check_attempts       = $::nagios::client::service_max_check_attempts,
  $notification_period      = $::nagios::client::service_notification_period,
  $use                      = $::nagios::client::service_use,
) inherits ::nagios::client {

  nagios::client::nrpe_plugin { 'check_conntrack':
    ensure => $ensure,
  }

  nagios::client::nrpe_file { 'check_conntrack':
    ensure => $ensure,
    args   => $args,
  }

  nagios::service { "check_conntrack_${check_title}":
    ensure                   => $ensure,
    check_command            => 'check_nrpe_conntrack',
    service_description      => 'conntrack',
    servicegroups            => $servicegroups,
    check_period             => $check_period,
    contact_groups           => $contact_groups,
    first_notification_delay => $first_notification_delay,
    notification_period      => $notification_period,
    max_check_attempts       => $max_check_attempts,
    use                      => $use,
  }

}
