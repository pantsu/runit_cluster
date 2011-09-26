# Runit cluster

Web interface for management multiple installations of runit.

Based on

* [Sinatra](http://www.sinatrarb.com/)
* [runit-man](https://github.com/Undev/runit-man)

## Installation

It seems we need to write down something here

## Configuration

Customize your `host_config.yml` file with instances of your cluster.
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

Also your can send any signal from a list to any running process:

-  TERM
-  KILL
-  INT
-  USR1
-  USR2
-  ALARM
-  QUIT
-  EXIT
-  PAUSE
-  CONT
-  HUP
-  ONCE
