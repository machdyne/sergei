# Sergei Motherboard

Sergei is a motherboard that when paired with a [Sechzig](https://github.com/machdyne/sechzig) compute module can function as a computer.

This repo contains schematics, PCB layouts, pinouts and documentation.

Find more information on the [Sergei product page](https://machdyne.com/product/sergei-motherboard/).

## Using Sergei

Sergei requires a Sechzig module to power on. **When inserting a Sechzig module, make sure that pin 2 on Sergei and pin 2 on the module are both on the same side.**

## Firmware

Sergei has a JTAG and USB CDC interface that are both accessible on the USB-C port. These interfaces are provided by a [fork of pico-dirtyJtag](https://github.com/machdyne/sergei/tree/main/firmware). You can update the RP2040 firmware by holding down the BOOT button and then applying power.

To build the firmware from source:

```
$ cd firmware/pico-dirtyJtag
$ mkdir build
$ cmake ..
$ make
```

## Programming

Program the configuration SRAM of a Sechzig module:

```
sudo openFPGALoader -c dirtyJtag image.bit
```

Program the configuration flash on a Sechzig MLx module:

```
sudo openFPGALoader -f -c dirtyJtag image.bit
```

Program the configuration flash on a Sechzig MX1 module:

```
sudo openFPGALoader -c dirtyJtag -f image.bit --fpga-part xc7a35tftg256
```

## Linux

See the [Kakao Linux](https://github.com/machdyne/kakao) repo for the latest instructions.

## Pinouts

### DDMI Port

See the [DDMI repo](https://github.com/machdyne/ddmi) for details.

## Revisions

| Revision | Stackup | Notes |
| -------- | ------- | ----- |
| V0 | JLC04161H-3313 | Initial prototype |

## License

The contents of this repo are released under the [Lone Dynamics Open License](LICENSE.md) with the following exception(s):

  * The pico-dirtyJtag firmware is released under the MIT license; see the firmware LICENSE file for details.
