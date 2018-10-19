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
percona-repo:
  pkgrepo:
    - managed
    - file: /etc/apt/sources.list.d/percona.list
    - name: deb http://repo.percona.com/apt {{ crumbs['oscodename'] }} main
    - human_name: Percona Apt Repo
    - keyid: 9334a25f8507efa5
    - keyserver: keys.gnupg.net
    - require_in:
      - pkg: percona-server
      - pkg: percona-client
