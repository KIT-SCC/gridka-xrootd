define xrootd::create_config (
  $setenv = false,
  $set = false,
  $params = false,
) {
  require xrootd::config
  
  file {$title:
    content => template("xrootd/xrootd.cfg.erb")
  }

}
