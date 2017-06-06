class xrootd::config (
  $xrootd_user_name = $xrootd::params::xrootd_user_name,
  $xrootd_user = $xrootd::params::xrootd_user,
  $xrootd_group_name = $xrootd::params::xrootd_group_name,
  $xrootd_group = $xrootd::params::xrootd_group,
  $configdir = $xrootd::params::configdir,
  $logdir = $xrootd::params::logdir,
  $spooldir = $xrootd::params::spooldir,
  $all_pidpath = $xrootd::params::all_pidpath,
  $grid_security = $xrootd::params::grid_security,
) inherits xrootd::params {
  
  # Rely on this class to be known to Puppet in some way.
  include fetchcrl
  
  exec {'run-fetchcrl-atleastonce':
    path    => '/bin:/usr/bin:/sbin:/usr/sbin',
    command => 'fetch-crl',
    unless  => "ls -U ${grid_security}/certificates/*.r0"
  }
  
  ensure_resource('group', $xrootd_group_name, $xrootd_group)
  ensure_resource('user', $xrootd_user_name, $xrootd_user)
  
  File {
    owner  => $xrootd_user_name,
    group  => $xrootd_group_name,
  }

  file { [$configdir, $logdir, $spooldir, $all_pidpath]:
    ensure => directory,
  }
  
}
