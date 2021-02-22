class xrootd::install (
  Variant[
    Pattern[/\A[0-9.]+(\w|[-.])*\Z/],
    Enum['latest', 'present', 'absent']
  ] $version = 'latest',
) {
  # Rely on the environment to find this package on its own.
  package { 'xrootd': }
}
