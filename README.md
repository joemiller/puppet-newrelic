puppet-newrelic - New Relic Server Monitor
==========================================

This puppet module will install New Relic's FREE Server monitor
agent on your servers.

Currently this module only supports rpm-based distributions like rhel/centos.
Patches for other distributions are welcome.

Installation
------------

1. Sign up for an account at http://newrelic.com/signup if you
   haven't yet.
2. Copy this directory to your puppet master module path
3. Set your license key in the `$license_key` var in the `package.pp` file.
4. Apply the `newrelic` class to any nodes you want the agent installed on.
5. Login to your New Relic dashboard and you should see your servers show up
   in a few minutes.

Todo
----

- Add support for .deb based systems.  Pull requests very welcome on this
  since I don't currently run any debian-based systems.
  
Contributing
------------

- fork on github (https://github.com/joemiller/puppet-newrelic)
- send a pull request

Author
------
Joe Miller (http://joemiller.me / https://github.com/joemiller)

LICENSE
-------

    Author:: Joe Miller (http://joemiller.me)
    Copyright:: Copyright (c) 2011 Joe Miller
    License:: Apache License, Version 2.0

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.