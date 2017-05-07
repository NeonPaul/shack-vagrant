# node-shack dev server

Vagrant is a system that lets you easily configure and share virtual machine
setups. This repo contains a configuration that will create a development server
that runs the node-shack code, along with the database, http server and all that
goodness.

## Getting started
Install vagrant, virtualbox, git

 - [Vagrant](https://www.vagrantup.com/downloads.html)
 - [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
 - [Git](https://git-scm.com/downloads)

Make sure the vagrant and node-shack repos are checked out side-by side. The
latter *must* be in a directory called `shack`. It doesn't matter what this one is
called.

CD into the directory this readme file is in and run this command to start
the virtual machine:

```
vagrant up
```

The first time you run this, it'll install the OS (Ubuntu 16.04) and all the
software it requires, before starting the server. Every other time it'll just
start the server.

Once the server is running, visit http://localhost:4567 in your host OS and
through the magic of port-forwarding you'll get the site.

If you need to stop the server, run `vagrant halt`. If you need do destroy and
reinstall it all, run `vagrant destroy` followed by `vagrant up`. To log in to
the machine via ssh, run `vagrant ssh`.

## Test data
The user in the test database has the following credentials:

| **Email**    | `test@example.com` | `test2@example.com`
| **password** | `test`             | `test`
