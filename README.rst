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
Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-foreman/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-foreman

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
