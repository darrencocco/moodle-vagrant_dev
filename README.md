Moodle Vagrant
==============
### About
Development VM with shared HTML root directory.
Includes:
 * PHP(with xdebug on port 9000 and idekey of vagrant)
 * NGINX
 * PostgreSQL (accessible through port 5432 from host)
 * Selenium + Firefox
 * MailCatcher (http://mail.{folder name}.localdomain)
 * SimpleSAML (http://saml.{folder name}.localdomain)

Works with Fedora,Ubuntu and Windows(untested)

### Getting started
#### Setting up JetBrains PhpStorm
##### PHP Code Sniffer
The Code Sniffer rules for Moodle can be found in the local_codechecker plugin
at https://github.com/moodlehq/moodle-local_codechecker which can also be
installed into your Moodle development instance for additional checks.
See the local_codechecker repo for installation/set up instructions.

##### Debugger (XDebug)
To set up remote debugging go to the [Run] menu and select [Edit Configurations...]

Click the [+] symbol in the top left of [Run/Debug Configurations]
screen and select [PHP Remote Debug]

Give your new configuration a name (it is the name that will appear
in the menu to start the debugger).

Check [Filter debug connection by IDE key] and set the IDE key to `vagrant`.

Click the [...] button for the [Server:] option.
This will allow you to define servers that you are are debugging and how their
remote code paths match up to what is on your local computer.

Add a new server by clicking [+], give it a name and what host name it is at (likely
to be `{folder name}.localdomain` with this environment).

Check [Use path mappings] and define the mappings for your project.
Assuming your project is in {folder name}/moodle/ then you will
just set the [Absolute path on the server] to `/vagrant/moodle/`.

Don't forget to hit enter when you type in the path otherwise it will not save
(this is some annoying behaviour I have noticed)

Now just hit Okay until you get back to your main IDE interface
and you are ready to start debugging web requests using [Run > Debug...]

*P.S. You might need to open up port `9000` on your workstation to allow
the debugger to connect back to PhpStorm.*

##### Remote CLI(PHP) interpreter
1) Navigate to [File] > [Settings...] in the IDE menu.
2) In the settings pane navigate to [Languages & Frameworks] > [PHP]
3) Click on [...] of [CLI Interpreter:]
4) Click on [+] and select[From Docker, Vagrant, VM, Remote...]
5) Select the [Vagrant] radio button
6) For the [Vagrant Instance...] field select folder that Vagrant instance is
   launched from (e.g. `vagrant up` etc)
7) Set the [PHP interpreter path:] to `/usr/sbin/sudo_php`
8) Check [Visible for this project only]

##### Behat tests (Behavioural)
1) From `/vagrant/moodle` in the vagrant guest run
   `sudo -u apache php admin/tool/behat/cli/init.php`
2) Navigate to [Run] > [Edit Configurations...]
3) Click on [+] and select [Behat]
4) Select your remote interpreter for this vagrant server.
5) In [Test scope:] select [Directory]
6) Set the field [Directory:] to the location of the Moodle code
7) Click on the [Cog symbol] below and to the right of the [Directory:] field
8) Click on [+] and select [Behat by Remote Interpreter]
9) Set [Path to Behate executable:] to `/vagrant/moodle/vendor/bin/behat`
10) Check [Default configuration file:]  and set the value to
    `/var/www/behatdata/behatrun/behat/behat.yml`

###### To run:
Selenium must be running on vagrant box to do so use `vagrant ssh`
and run `java -jar /opt/selenium`

In PhpStorm right click on feature file and click [Run...]

##### PHPUnit tests (Unit)
1) From `/vagrant/moodle` in the vagrant guest run
   `sudo -u apache php admin/tool/phpunit/cli/init.php`
2) Navigate to [Run] > [Edit Configurations...]
3) Click on [+] and select [PHPUnit]
4) Select your remote interpreter for this vagrant server.
5) In [Test scope:] select [Directory]
6) Set the field [Directory:] to the location of the Moodle code
7) Click on the [Cog symbol] below and to the right of the [Directory:] field
8) Click on [+] and select [PHPUnit by Remote Interpreter]
9) Set [Path to script:] to `/vagrant/moodle/vendor/autoload.php`
10) Click the refresh button for [Path to script:]
11) Check [Default configuration file:]  and set to `/vagrant/moodle/phpunit.xml`

###### To run:
In PhpStorm right click on a unit test file and click [Run...]

#### Setting up JetBrains DataGrip
##### Database connection
Add a PostgreSQL data source and set the host to the host name of the vagrant box.

Set the [User:] to `postgres` and leave the [Password:] blank

Set [Database:] to `moodle` and everything should just work.

Click [Test Connection] and everything should be working

You may want to select the [Schemas] tab and tick [moodle]