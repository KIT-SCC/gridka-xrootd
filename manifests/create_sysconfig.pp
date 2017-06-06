define xrootd::create_sysconfig (
  $xrootd_user_name = $xrootd::config::xrootd_user_name,
  $xrootd_group_name = $xrootd::config::xrootd_group_name,
  $xrootd_instances_options = $xrootd::params::xrootd_instances_options,
  $cmsd_instances_options = $xrootd::params::cmsd_instances_options,
  $purd_instances_options = $xrootd::params::purd_instances_options,
  $xfrd_instances_options = $xrootd::params::xfrd_instances_options,

  $exports = $xrootd::params::exports,

  $daemon_corefile_limit = $xrootd::params::daemon_corefile_limit,
  $enable_hdfs = false,
  $java_home = undef,
) {
  require xrootd::config

  file { $title:
    content => template("xrootd/sysconfig.erb")
  }

}
