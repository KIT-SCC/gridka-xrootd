class xrootd (
  $xrootd_instances = undef,
  $cmsd_instances = undef,
) {

  class { 'xrootd::install': }
  -> class { 'xrootd::config': }
    -> class { 'xrootd::service':
      xrootd_instances => $xrootd_instances,
      cmsd_instances   => $cmsd_instances,
    }

}
