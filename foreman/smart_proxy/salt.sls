{%- from "foreman/map.jinja" import smart_proxy with context %}
{%- if smart_proxy.proxy.salt is defined %}

include:
- foreman.smart_proxy.service

/etc/salt/autosign.conf:
  file.managed:
  - group: foreman-proxy
  - mode: 770
  - require:
    - service: foreman_proxy_service

/etc/foreman-proxy/settings.d/salt.yml:
  file.managed:
  - source: salt://foreman/files/salt.yml
  - template: jinja
  - require:
    - pkg: foreman_proxy_server_packages
  - watch_in:
    - service: foreman_proxy_service

{%- endif %}
