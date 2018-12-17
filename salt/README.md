# Create OwnCloud with SaltStack

## Before beggining
First you need a machine with a minion configure with you master.

**The goal is not to do beautiful SaltStack code. The code is a quick dirty but work. Is a one shot school project**

For school rules respect I re do the wheel :)

Apply `top.sls` for build a create and configure a OwnCloud on a machine.

Be careful admin and password are set in code. Moreover, all ip different from the local are denied.

## Installation

When you run the `top.sls` you:

- Install `epel` that will allow you to install some tools
- Install `remi` for PHP7 packages
- Intall `php` version 7
- Install `apache` for OwnCloud Web and Application Server
- Install `redis` and `mariadb` for OwnCloud db need
- Install `owncloud` code from sources
- Set up the firewall rules


Note: This script were test with CentOS 7 only
