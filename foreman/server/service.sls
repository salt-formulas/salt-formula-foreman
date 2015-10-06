{%- from "foreman/map.jinja" import server with context %}
{%- if server.enabled %}

foreman_server_packages:
  pkg.installed:
  - pkgs: {{ server.pkgs }}

foreman_server_db_packages:
  pkg.installed:
  - names:
    - foreman
    {%- if server.database.engine == 'postgresql' %}
    - foreman-postgresql
    {%- endif %}
    {%- if server.database.engine == 'mysql' %}
    - foreman-mysql2
    {%- endif %}
    {%- if server.database.engine == 'sqlite' %}
    - foreman-sqlite3
    {%- endif %}
  - require:
    - pkg: foreman_server_packages

{%- for plugin in server.plugins|default([]) %}

foreman_plugin_{{ plugin }}:
  pkg.installed:
  - name: ruby-foreman-{{ plugin }}

{%- endfor %}

/etc/foreman/database.yml:
  file.managed:
  - source: salt://foreman/files/database.yml
  - template: jinja
  - require:
    - pkg: foreman_server_packages

/etc/foreman/settings.yaml:
  file.managed:
  - source: salt://foreman/files/settings.yaml
  - template: jinja
  - require:
    - pkg: foreman_server_packages

foreman_migrate_database:
  cmd.run:
  - name: /usr/sbin/foreman-rake db:migrate && /usr/sbin/foreman-rake db:seed && /usr/sbin/foreman-rake apipie:cache
  - user: foreman
  - watch:
    - file: /etc/foreman/database.yml

{%- if server.bind is defined %}

/etc/default/foreman:
  file.managed:
  - source: salt://foreman/files/foreman
  - template: jinja
  - require:
    - pkg: foreman
  - watch_in:
    - service: foreman_service

{%- endif %}

foreman_service:
  service.running:
  - name: {{ server.service }}
  - watch:
    - file: /etc/foreman/settings.yaml

{%- endif %}