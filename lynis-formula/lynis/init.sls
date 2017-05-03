{% from "lynis/map.jinja" import lynis with context %}

include:
  - lynis.repo

lynis.packages:
  pkg.installed:
    - pkgs:
      - lynis
      {% if lynis.repo.use_customers_repo and lynis.repo.install_plugins %}
      - lynis-plugins
      {% endif %}
    - refresh_db: True
    - require:
      - sls: lynis.repo
