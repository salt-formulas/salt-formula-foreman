{%- from "foreman/map.jinja" import smart_proxy with context %}
{%- if smart_proxy.proxy.dns is defined %}

include:
- foreman.smart_proxy.service

/etc/foreman-proxy/settings.d/dns.yml:
  file.managed:
  - source: salt://foreman/files/dns.yml
  - template: jinja
  - require:
    - pkg: foreman_proxy_server_packages
  - watch_in:
    - service: foreman_proxy_service

{%- endif %}