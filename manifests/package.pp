class newrelic::package {
    include newrelic::repo

    package { "newrelic-sysmond":
        ensure  => latest,
        notify  => Class["newrelic::server"],
        require => Class["newrelic::repo"];
    }
}
