define xrootd::create_authfile (
  $entries,
) {
  require xrootd::config
  
  file { $title:
    content => template("xrootd/authfile_generic.erb")
  }

}
