Install Apache:
    pkg.installed:
        - pkgs:
            - httpd

Enable Apache:
    service.running:
        - name: httpd
        - enable: True