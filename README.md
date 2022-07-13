# nano_4k_quad_7segment

Example four-digit 7-segment display project for the Sipeed Tang Nano 4K, includes a ["shift-and-add-3"](https://en.wikipedia.org/wiki/Double_dabble) binary-to-BCD encoder for displaying in base-10.

The example assumes a common-anode 7-segment display where the 4 digits share the ABCDEFG cathodes:

Pins 13, 17, 18, 19, 20, 21 and 22 are connected to segments A, B, C, D, E, F and G respectively.

Pins 35, 34, 32 and 31 are connected to the anodes of digit 4, 3, 2 and 1 respectively (where digit 1 is the least signficant, digit 4 is the most significant).

![7-segment in action](https://github.com/verilog-indeed/nano_4k_quad_7segment/blob/dev/media/7segment_nano_4k.jpg)
