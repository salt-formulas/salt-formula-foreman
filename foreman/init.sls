
include:
{%- if pillar.foreman.server is defined %}
- foreman.server
{%- endif %}
{%- if pillar.foreman.smart_proxy is defined %}
- foreman.smart_proxy
{%- endif %}
