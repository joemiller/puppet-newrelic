class newrelic::server {
    include newrelic::package

    if $newrelic_license == undef{ fail('$newrelic_license not defined') } 

    exec { "newrelic-set-license":
        unless  => "grep -q 'license_key=${newrelic_license}' /etc/newrelic/nrsysmond.cfg",
        command => "nrsysmond-config --set license_key=${newrelic_license}",
        notify => Service['newrelic-sysmond'];
    }

    service { "newrelic-sysmond":
        enable  => true,
        ensure  => running,
        hasstatus => true,
        hasrestart => true,
        require => Class["newrelic::package"];
    }

}
