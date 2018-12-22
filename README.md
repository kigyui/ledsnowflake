# ledsnowflake
Magical Latex Girl LED Snowflake necklace

I bought a strip of 100 bright white leds which were wired in parallel
on a nice thin cable for just a few dollars. I cut off 2 sections
each with 6 leds.

The snowflake was 3d printed. I designed it snowflake using OpenSCAD
(see snow.scad) and converted it to a STL file (snow.stl) ready for 3d
printing. Used a white PLA filament with .3mm layer height and 1.2mm
walls  The leds were glued in place using superglue.

I wrote the arduino code to do a flicker effect using the two PWM pins
(ledsnowflake.ino). The original plan was to use something like a
gemma arduino board, but for something so simple we can use a bare
attiny85 chip. You can program them using [arduino
ISP](https://create.arduino.cc/projecthub/arjun/programming-attiny85-with-arduino-uno-afb829)

A CR2032 battery is used for power. Ideally you'd use a couple to be
able to run at a higher brightness, but these cells are really cheap
and you can get a good 3 or 4 hours runtime.

No real circuit explanation is needed, the battery connects to
the attiny85, the positive from the LED strands runs to D0 and D1,
and all the grounds are joined.

