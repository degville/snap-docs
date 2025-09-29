(interfaces-hardware-io-interfaces)=
# hardware-io-interfaces

Hardware IO (input/output) interfaces, including the [serial-port](/interfaces/serial-port-interface), [gpio](/interfaces/gpio-interface), [gpio-chardev](/interfaces/gpio-chardev) and [i2c](/interfaces/i2c-interface) interfaces, are designed to be used on devices running [Ubuntu Core](/t/glossary/14612#heading--ubuntu-core). These interfaces are exposed as _slots_ from a device's [gadget snap](/) which is used to define and configure a device's system properties.

This approach is more robust because it allows the gadget snap providing the slot to centralise and arbitrate the connection conditions. These conditions include which other snaps, identified by their snap ID, can connect to the slots the gadget offers and, consequently, gain privileged access to the hardware.  For the application snap, usually no change is required other than to declare and use an appropriately-configured plug.


The following are exeptions to the above, and can be used without being declared in the gadget snap:
- [gpio-control interface](/interfaces/gpio-control-interface)
- [serial-port interface](/interfaces/serial-port-interface) (experimental support)

See [Supported interfaces](/interfaces/index) for a complete list of interfaces.

## Interface considerations

The extent of access an interface has is granted through both _connection permissions_ and the specifics of the _interface connections_ being requested.

1. **Connection permissions**: [auto-connect](/) | [privileged](/) | [super-privileged](/)
   </br>Connection requirements are dependent on which store a developer is using.
     - [Global Snap Store](https://forum.snapcraft.io/t/glossary/14612#heading--snap-store): privileged and super-privileged interfaces require store approval because of the level of trust and permissiveness these interfaces have, which is also why certain interfaces need certain oversight. See [Permission requests](/interfaces/permission-requests) for further details.
    * [Dedicated Snap Store](/t/glossary/14612#heading--dedicated): trust and permissiveness are now  the responsibility of the store owner, and many privileged interface connections can be self-served and defined within the dedicated snap store and the device context.
1. **Interface connections**: hardware IO interfaces | app-provided interfaces | other interfaces
    * **Hardware IO interfaces**: These require either a [slot](/t/interface-management/6154#heading--slots-plugs) to be defined by a device's _gadget snap_ or an interface with [Hotplug support](/interfaces/hotplug-support), in which case the slot appears from the system snap.
      * An unconstrained [auto-connection](/t/the-interface-auto-connection-mechanism/20179#heading--autoconnect) cannot be used because there may be _many slots of a given interface_, resulting in ambiguity that requires  an extensive set of store rules to manage and maintain.
      * Each plug should therefore be connected to a slot, for example:
        * green led plug on app => green led slot on gadget
        * red led plug on app => red led slot on gadget
      - This kind of 1-to-1 connections can usually be established via [slot rules in the snap-declaration](/) for the gadget.
    * **App-provided interfaces**: slots are defined by apps, or occasionally from the gadget snap, 
      * May require access, such as from the [content](/interfaces/content-interface) or [shared-memory](/interfaces/shared-memory-interface) interfaces.
      * A slot might may be provided by the system snap to cover the case of an equivalent system service, such as [audio-playback](/interfaces/audio-playback-interface)
      * the slot might be [super-privileged](/)
    * **Other interfaces**: For more system level access, slots are provided by the system snap.

<h3 id='heading--code-examples'>Code examples</h3>

The [gadget snap](https://github.com/snapcore/pi-gadget/tree/20-arm64) definition for the reference [Raspberry Pi Ubuntu Core](https://ubuntu.com/core/docs/install-raspberry-pi) image contains interface definitions for various hardware IO interfaces on the system, including slots for each specific GPIO pin, i2c connections, the Bluetooth serial port, and the generic serial ports:

```yaml
slots:
  bcm-gpio-0:
    interface: gpio
    number: 0
  bcm-gpio-1:
    interface: gpio
    number: 1
  bcm-gpio-2:
    interface: gpio
    number: 2
[...]
  i2c-0:
    interface: i2c
    path: /dev/i2c-0
[...]
  bt-serial:
    interface: serial-port
    path: /dev/ttyAMA0
[...]
  serial0:
    interface: serial-port
    path: /dev/ttyS0
  serial1:
    interface: serial-port
    path: /dev/ttyS1
```

On a Raspberry Pi, the above hardware IO interfaces are accessible to apps from the system snap without requiring any further configuration.

## Interface list

| Interface | Description | Categories | Auto-connect |
|---|----|---|---|
| [device-buttons](/interfaces/device-buttons-interface) | use any device-buttons | Hardware, Developer | no |
| [dsp](/interfaces/dsp-interface) | enables the control of digital signal processors (DSPs) | Hardware, Developer | no |
| [dvb](/interfaces/dvb-interface) | allows access to all DVB devices and APIs | Hardware, Developer, [Media](/) | no |
| [fpga](/interfaces/fpga-interface) | permits access to an FPGA subsystem | Hardware, Developer | no |
| [framebuffer](/interfaces/framebuffer-interface) | access to universal framebuffer devices | Hardware, Developer | no |
| [gpio](/interfaces/gpio-interface) | access specific GPIO pins | GPIO, Hardware, Developer | no |
| [gpio-chardev](/interfaces/gpio-chardev) | access specific GPIO chardev lines. | GPIO, Hardware, Developer | no |
| [gpio-memory-control](/interfaces/gpio-memory-control-interface) | allows write access to all GPIO memory | GPIO, Hardware, Developer | no |
| [hardware-observe](/interfaces/hardware-observe-interface) | access hardware information | [System](/), Hardware | no |
| [hardware-random-control](/interfaces/hardware-random-control-interface) | provide entropy to hardware random number generator | [System](/), Hardware | no |
| [hardware-random-observe](/interfaces/hardware-random-observe-interface) | use hardware-generated random numbers | [System](/), Hardware | no |
| [i2c](/interfaces/i2c-interface) | access i²c devices | [System](/), Hardware | no |
| [iio](/interfaces/iio-interface) | access IIO devices | [System](/), Hardware | no |
| [intel_qat](/interfaces/intel-qat) | provides permissions for Intel QAT devices | [Hardware](/interfaces/hardware-io-interfaces) | no  |
| [joystick](/interfaces/joystick-interface) | use any connected joystick | Hardware, Developer | no |
| [media-control](/t/the-media-control-interface/26504/) | access media control devices and Video4Linux (V4L) devices | Hardware, Developer, [Media](/), Video | no |
| [optical-drive](/interfaces/optical-drive-interface) | read/write access to CD/DVD drives | Storage, Hardware, Developer | yes, unless drive can write |
| [pwm](/interfaces/pwm-interface) | access specific PWM channels | [System](/), Developer, Hardware, WIP | no |
| [raw-input](/interfaces/raw-input-interface) | access raw input devices directly | [System](/), Developer, Hardware | no |
| [raw-usb](/interfaces/raw-usb-interface) | access USB hardware directly | [System](/), Developer, Hardware | no |
| [serial-port](/interfaces/serial-port-interface) | access serial port hardware | [System](/), Developer, Hardware | no by default, yes with snaps from the same publisher |
| [spi](/interfaces/spi-interface) | access specific SPI devices | [System](/), Developer, Hardware | no |
| [u2f-devices](/t/the-u2f-devices-interface/9722/) | use any U2F devices | [Security](/), Hardware, Developer | no |
| [uhid](/interfaces/uhid-interface) | create kernel UID devices from user-space | Hardware, Kernel, [System](/) | no |
| [uinput](/interfaces/uinput-interface) | allows write access to /dev/uinput | [Super privileged](/), Hardware | no |
| [uio](/interfaces/uio-interface) | access uio devices | Hardware, [System](/) | no |

