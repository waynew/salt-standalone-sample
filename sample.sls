python3-pip:
  pkg.installed

install requirements:
  pip.installed:
    - requirements: salt://requirements.txt
    - bin_env: /usr/bin/pip3
    - require:
      - pkg: python3-pip
