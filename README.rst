=======
Foreman
=======

Foreman is aimed to be a Single Address For All Machines Life Cycle Management.

* Foreman integrates with Puppet (and acts as web front end to it).
* Foreman takes care of provisioning until the point puppet is running, allowing Puppet to do what it does best.
* Foreman shows you Systems Inventory (based on Facter) and provides real time information about hosts status based on Puppet reports.
* Foreman creates everything you need when adding a new machine to your network,It's goal being automatically managing everything you would normally manage manually - this include DNS, DHCP, TFTP, Virtual Machines, PuppetCA, CMDB etc.

Sample pillar
=============

Foreman server to use with apache

.. code-block:: yaml

    foreman:
      server:
        enabled: true
        domain: domain.com
        fqdn: foreman.domain.com
        database:
          engine: 'postgresql'
          host: '127.0.0.1'
          name: 'foreman'
          password: 'password'
          user: 'foreman'
        mail:
          host: mail.domain.com
          password: passwd
          user: robot@domain.com
          domain: domain.com

Foreman smart proxy
-------------------

.. code-block:: yaml

    foreman:
      smart_proxy:
        enabled: true

Usage
=====

Generated  user:pasword is in database seed and printed to the output during db:seed process.

Read more
=========

* http://theforeman.org/manuals/1.5/index.html#3.InstallingForeman
* http://projects.theforeman.org/projects/foreman/wiki/Upgrade_instructions
* http://mauricio.github.io/2014/02/09/foreman-and-environment-variables.html