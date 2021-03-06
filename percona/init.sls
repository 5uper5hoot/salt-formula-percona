# Copyright 2013 Hewlett-Packard Development Company, L.P.
#
#    Licensed under the Apache License, Version 2.0 (the "License"); you may
#    not use this file except in compliance with the License. You may obtain
#    a copy of the License at
#
#         http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
#    WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
#    License for the specific language governing permissions and limitations
#    under the License.
#

{% set ver = salt['pillar.get']('percona:version', '5.7')|replace('.', '') %}

include:
  - percona.common
  - percona.client

percona-server:
  debconf:
    - set
    - name: percona-xtradb-cluster-server-{{ ver }}
    - data:
        'percona-server-server/root_password':
          type: password
          value: {{ salt['pillar.get']('percona:passwords:root', '') }}
        'percona-server-server/root_password_again':
          type: password
          value: {{ salt['pillar.get']('percona:passwords:root', '') }}

  pkg.installed:
    - sources:
      - percona-xtradb-cluster-server-{{ ver }}: {{ pillar['repo_url'] }}
    - require:
      - debconf: percona-server
