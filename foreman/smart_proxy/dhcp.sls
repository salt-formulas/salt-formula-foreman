{%- from "foreman/map.jinja" import smart_proxy with context %}
{%- if smart_proxy.proxy.dhcp is defined %}

include:
- foreman.smart_proxy.service

foreman_dhcp_proxy_config_file:
  file.managed:
  - name: /etc/dhcp/dhcpd.conf
  - group: foreman-proxy

/var/lib/dhcp/dhcpd.leases:
  file.managed:
  - group: foreman-proxy

/etc/foreman-proxy/settings.d/dhcp.yml:
  file.managed:
  - source: salt://foreman/files/dhcp.yml
  - template: jinja
  - require:
    - pkg: foreman_proxy_server_packages
  - watch_in:
    - service: foreman_proxy_service

{%- endif %}