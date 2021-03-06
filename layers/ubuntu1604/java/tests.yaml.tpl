# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

schemaVersion: "2.0.0"

commandTests:
- name: 'java-version'
  command: 'java'
  args: ['-version']
  # java outputs to stderr.
  expectedError: ["openjdk version \"1.8.*"]
- name: 'java10-version'
  command: '/usr/lib/jvm/zulu{_JAVA_REVISION}-linux_x64-allmodules/bin/java'
  args: ['-version']
  # java outputs to stderr.
  expectedError: ["openjdk version \"10.*"]
- name: 'check-openssl'
  command: 'openssl'
  args: ['version']
  expectedOutput: ['OpenSSL .*']

fileExistenceTests:
- name: 'OpenJDK'
  path: '/usr/lib/jvm/java-8-openjdk-amd64'
  shouldExist: true
- name: 'OpenJDK 10'
  path: '/usr/lib/jvm/zulu{_JAVA_REVISION}-linux_x64-allmodules'
  shouldExist: true
- name: 'OpenJDK 10 srcs'
  path: '/usr/src/jdk/zsrc{_JAVA_REVISION_ENCODED}.zip'
  shouldExist: true

metadataTest:
  env:
    - key: 'JAVA_HOME'
      value: '/usr/lib/jvm/java-8-openjdk-amd64'
