class xrootd::config (
  String $xrootd_user_name,
  Hash[String[1], Data] $xrootd_user,
  String $xrootd_group_name,
  Hash[String[1], Data] $xrootd_group,
  Stdlib::Unixpath $configdir,
  Stdlib::Unixpath $logdir,
  Stdlib::Unixpath $spooldir,
  Stdlib::Unixpath $all_pidpath,
) {

  ensure_resource('group', $xrootd_group_name, $xrootd_group)
  ensure_resource('user', $xrootd_user_name, $xrootd_user)

  File {
    owner => $xrootd_user_name,
    group => $xrootd_group_name,
  }

  file { [$configdir, $logdir, $spooldir, $all_pidpath]:
    ensure => 'directory',
  }

}
