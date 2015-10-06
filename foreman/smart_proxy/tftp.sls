{%- from "foreman/map.jinja" import smart_proxy with context %}
{%- if smart_proxy.proxy.tftp is defined %}

include:
- foreman.smart_proxy.service

/srv/tftp/boot:
  file.directory:
  - group: foreman-proxy
  - mode: 770
  - makedirs: true

/srv/tftp/pxelinux.0:
  file.managed:
  - user: nobody
  - group: foreman-proxy
  - mode: 770

/srv/tftp/menu.c32:
  file.managed:
  - user: nobody
  - group: foreman-proxy
  - mode: 770

/srv/tftp/chain.c32:
  file.managed:
  - user: nobody
  - group: foreman-proxy
  - mode: 770

/srv/tftp/boot/pxelinux.cfg:
  file.directory:
  - user: nobody
  - group: foreman-proxy
  - mode: 770
  - makedirs: true

/etc/foreman-proxy/settings.d/tftp.yml:
  file.managed:
  - source: salt://foreman/files/tftp.yml
  - template: jinja
  - require:
    - pkg: foreman_proxy_server_packages
  - watch_in:
    - service: foreman_proxy_service

{%- endif %}