<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

The code takes in two 4-bit inputs, and multiplies them, outputting the 8-bit result.

## How to test

Put inputs in test.py, with input 1 being the left 4 bits of dut.ui_in.value, and input 2 being the right 4 bits of dut.ui_in.value.
The corresponding output is compared with dut.uo_out.value, which should be the correct result of the multiplication.

## External hardware

N/A
