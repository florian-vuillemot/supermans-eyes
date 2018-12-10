{% if grains['os_family'] == 'RedHat' %}

epel-release:
    pkg.installed

policycoreutils-python:
    pkg.installed

{% endif %}
