(interfaces-pwm-control-interface)=
#  pwm-control interface

`pwm-control` permits control over any aspect of all PWM channels.

This interface is currently **under development** and has not yet been released for general use. See [
interfaces: add pwm-control interface
](https://github.com/canonical/snapd/pull/12347) for further details on this work.

The `pwm-control` interface can potentially impact the system and other snaps, and allows privileged access to hardware. See {ref}`The pwm interface <interfaces-pwm-interface>` to access a specific channel.

**{ref}`Auto-connect <explanation-interfaces-interface-auto-connection>`**: no</br>
**{ref}`Super-privileged <reference-operations-interfaces-super-privileged-interfaces>`**: yes


