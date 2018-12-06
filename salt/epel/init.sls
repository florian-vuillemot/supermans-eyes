{% if grains['os_family'] == 'RedHat' %}

epel-release:
    pkg.installed

{% endif %}
