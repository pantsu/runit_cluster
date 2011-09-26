# Runit cluster

Web interface for management multiple installations of runit.

Based on

* [runit](http://smarden.org/runit/)
* [Sinatra](http://www.sinatrarb.com/)

## Installation

It seems we need to write down something here

## Configuration

Customize your `host_config.rb` file with instances of your cluster.
You need to define credentials to each host

1. Hostname
2. Port
3. Login
4. Password

## Interface

Runit cluster provides interface similar to [runit-man](https://github.com/Undev/runit-man), but with aggregated data from all configured hosts.

### View

This tools displays state of all processes grouped by host or service.
Data for each process includes:

-  Hostname
-  PID
-  Process
-  Time started at
-  Uptime
-  Status

In addition you can view tail logs of any running service

### Management

You can manage your services with supported commands:

-  up
-  down
-  restart
-  switch\_up (*activates service*)
-  switch\_down (*deactivates service*)

Also your can send a signal to any running process:

- t: TERM
- k: KILL
- i: INT
- 1: USR1
- 2: USR2
- a: ALARM
- q: QUIT
- x: EXIT
- p: PAUSE
- c: CONT
- h: HUP
- o: ONCE
