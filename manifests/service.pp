class xrootd::service (
  $xrootd_instances,
  $cmsd_instances,
  Stdlib::Unixpath $grid_security,
  Stdlib::Unixpath $certificate = "${grid_security}/hostcert.pem",
  Stdlib::Unixpath $key = "${grid_security}/hostkey.pem",
) {

  include systemd::systemctl::daemon_reload

  Service {
    ensure    => 'running',
    enable    => true,
    subscribe => File[$certificate, $key],
    notify    => Class['systemd::systemctl::daemon_reload']
  }

  unless $::os['family'] == 'RedHat' and ($::os['release']['major'] + 0) >= 6 {
    fail('The service can be managed for RedHat OSes only!')
  }

    if $xrootd_instances == undef {
      fail("xrootd_instances parameter should not be empty")
    }
    else {
      service {$xrootd_instances:
        provider  => systemd,
      }
    }

    if $cmsd_instances != undef {
      service {$cmsd_instances:
        provider  => systemd,
        require   => Service[$xrootd_instances],
      }
    }
  }
}
