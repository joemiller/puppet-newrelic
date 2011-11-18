class newrelic::server {
    include newrelic::package

    $license = ""   # Set this before applying this class to your nodes!!!

    exec { "newrelic-set-license":
        path    => ["/bin", "/usr/bin", "/sbin", "/usr/sbin"],
        unless  => "grep -q 'license_key=${license}' /etc/newrelic/nrsysmond.cfg",
        command => "nrsysmond-config --set license_key=${license}";
    }

    service { "newrelic-sysmond":
        enable  => true,
        ensure  => running,
        require => Class["newrelic::package"];
    }

}
