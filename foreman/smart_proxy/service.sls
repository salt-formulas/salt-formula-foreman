{%- from "foreman/map.jinja" import smart_proxy with context %}
{%- if smart_proxy.enabled %}

foreman_proxy_server_packages:
  pkg.installed:
  - pkgs: {{ smart_proxy.pkgs }}

/etc/foreman-proxy/settings.yml:
  file.managed:
  - source: salt://foreman/conf/proxy_settings.yml
  - template: jinja
  - require:
    - pkg: foreman_proxy_server_packages

foreman_proxy_service:
  service.running:
  - name: {{ smart_proxy.service }}
  - watch:
    - file: /etc/foreman-proxy/settings.yml

{%- endif %}