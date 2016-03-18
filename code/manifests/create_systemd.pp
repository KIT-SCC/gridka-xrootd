define xrootd::create_systemd (
  $filename = $title,
  $xrootd_user = $xrootd::config::xrootd_user,
  $xrootd_group = $xrootd::config::xrootd_group,
  $exports = $xrootd::config::exports,
  $daemon_corefile_limit = $xrootd::config::daemon_corefile_limit
) {
  include xrootd::config

  exec {
    'systemctl-daemon-reload':
      command => 'systemctl daemon-reload',
  }

  file {"/etc/systemd/system/$filename.service.d/":
    ensure => directory,
    owner   => root,
    group   => root,
  } ->
  file {"/etc/systemd/system/$filename.service.d/override.conf":
    ensure  => file,
    owner   => root,
    group   => root,
    content => "puppet:///modules/xrootd/override.erb",
  } -> Exec['systemctl-daemon-reload']

}
