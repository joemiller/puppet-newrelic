class newrelic($license  = $::newrelic_license) {
    include newrelic::repo
    include newrelic::package
    include newrelic::server
}
