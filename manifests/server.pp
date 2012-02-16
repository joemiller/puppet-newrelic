class newrelic::server {
    include newrelic::package
    $newrelic_license = $newrelic::license

    if $newrelic_license == undef{ fail('$newrelic_license not defined') }

    exec { "newrelic-set-license":
        unless  => "egrep -q '^license_key=${newrelic_license}$' /etc/newrelic/nrsysmond.cfg",
        command => "nrsysmond-config --set license_key=${newrelic_license}",
        notify => Service['newrelic-sysmond'];
    }

    exec { "newrelic-set-ssl":
        unless  => "egrep -q ^ssl=true$ /etc/newrelic/nrsysmond.cfg",
        command => "nrsysmond-config --set ssl=true",
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
