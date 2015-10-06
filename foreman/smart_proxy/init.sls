{%- from "foreman/map.jinja" import smart_proxy with context %}
include:
- foreman.smart_proxy.service
{%- if smart_proxy.proxy.dhcp is defined %}
- foreman.smart_proxy.dhcp
{%- endif %}
{%- if smart_proxy.proxy.dns is defined %}
- foreman.smart_proxy.dns
{%- endif %}
{%- if smart_proxy.proxy.salt is defined %}
- foreman.smart_proxy.salt
{%- endif %}
{%- if smart_proxy.proxy.tftp is defined %}
- foreman.smart_proxy.tftp
{%- endif %}
