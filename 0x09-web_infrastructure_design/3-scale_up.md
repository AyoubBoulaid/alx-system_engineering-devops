In this version, all SPOFs have been removed and each of the major components (web server, application server, and database servers) have been moved to separate GNU/Linux servers. The SSL protection isn't terminated at the load-balancer and each server's network is protected with a firewall and they're also monitored.
Specifics About This Infrastructure

    The addition of firewall between each server.
    This protects each server from unwanted and unauthorized users rather than protecting a single server.

Issues

    High maintenance costs.
