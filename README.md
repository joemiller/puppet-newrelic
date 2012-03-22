puppet-newrelic - New Relic Server Monitor
==========================================

This puppet module will install New Relic's FREE Server monitor
agent on your servers.

This module supports yum and apt-based distributions

Installation
------------

1. Sign up for an account at http://newrelic.com/signup if you
   haven't yet.
2. Copy this directory to your puppet master module path
3. Apply the `newrelic` class to any nodes you want the agent installed on: `class { 'newrelic': license => '<your license key'>' }`
4. Login to your New Relic dashboard and you should see your servers show up
   in a few minutes.

Contributing
------------

- fork on github (https://github.com/joemiller/puppet-newrelic)
- send a pull request

Author
------
Joe Miller (http://joemiller.me / https://github.com/joemiller)

Co-Authors
----------
Caspar Clemens Mierau (http://www.screenage.de/blog/ https://github.com/damokles/)

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
