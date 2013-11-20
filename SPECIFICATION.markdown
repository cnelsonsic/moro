# Moro Game Console Specification

Version: {major}.{minor}.{patch}

Last Modified: {datetimestamp}

Authors: {authors}

The key words
"MUST", "MUST NOT", "REQUIRED",
"SHALL", "SHALL NOT", "SHOULD",
"SHOULD NOT", "RECOMMENDED", "MAY",
and "OPTIONAL"
in this document
are to be interpreted
as described in RFC 2119.

This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/.

The spirit of this specification is to define a limited,
retro, cartridge-based console.
It defines a very limited set of parameters
which should be adhered to by implementing parties
to maintain the feeling and spirit of Moro.
Moro is meant to be old-fashioned and nostalgic.
Modern conveniences should be shunned.

Moro is the Amish of the game console world.

## Software
Implementations of this specification
MUST use GNU/Linux.

It is RECOMMENDED
to use a Debian-based distribution,
but most distributions will work.

Implementations MUST also use X11.
It is RECOMMENDED to use XOrg.

Implementations SHOULD have
a very basic window manager,
configured such that
normal applications will be
displayed fullscreen
and with no window decorators.

The reference implementation uses
lightdm (http://www.freedesktop.org/wiki/Software/LightDM/) as its display manager,
and fluxbox (http://fluxbox.org/) as its window manager.

When started,
the OS SHOULD automatically
mount any mass storage drives
that are connected.

The mass storage drives
SHOULD be mounted according to
their filesystem labels
following the pattern "/media/<LABEL>".

After mounting,
the OS MUST attempt to
execute "/media/app/launcher".

The file MUST be executable.

Its current/working directory
SHOULD be "~".

## Hardware

### Cartridge
There MAY be only one mass storage drive
in the cartridge.
Any additional drives in the cartridge SHOULD
be used by the application itself,
and will not be automatically used by the operating system.

The filesystem
containing the main executable
MUST be labeled "app".
Additional mass storage drives
SHOULD be labeled
with meaningful names,
but they will not be used directly.

The auxilliary drives
MAY be used for cached data files,
cartridge-local game saves,
or other application data.

Digital Restrictions Management (http://drm.info/)
MAY be implemented
(though NOT RECOMMENDED)
by requiring a device
to always be connected
to the GPIO connector
and respond to challenges
presented by the application.
It is RECOMMENDED that
if this is implemented in an application,
only a warning is presented
about the application's authenticity.

Applications MUST NOT
require a network connection
to operate unless it is a
vital part of the application.

### Console

#### Slot
The Slot is the
opening that receives game cartridges.

The Slot MUST be at least,
10cm long,
2cm wide,
with a minimum depth of 2cm,
and a maximum depth of 4cm.

The connectors between the console
and the cartridge
SHOULD be out of sight
during normal usage.

#### Cartridge Connectors
There are two connectors supported for connecting cartridges.

##### USB
There MUST be
two female USB connectors
on either end of
the area immediately below
the slot.

They MUST be
offset toward the
ends of the slot
by 5cm from the center of
of the slot,
measured from the furthest inside edges
of the USB connector.

They MUST be 8cm away from each other,
measured from the furthest inside edges
of the USB connector.

They MUST be centered
along the axis
intersecting the short edge
of the slot.

They MUST be
aligned such that
the long edge
of the USB connector
is aligned with the short edge
of the slot.

The open portion
of the female USB connector
must be oriented
such that it is
nearest the outside edge.

##### GPIO
In the dead center
of the area
immediately below the slot,
there SHOULD be a bank
of 26 (2x13) female pin headers.
If present, they MUST be 0.1"-spaced.

There MAY be
more than 26
female pin headers,
but they must be
the same spacing
and extend on either side
as an addition
to the primary bank of 26.
If present,
the additional banks
MUST NOT have any space
between it and
the primary bank of headers.

#### Gamepad Connectors
There MUST be
at least two USB connectors
(more are RECOMMENDED)
on the front of the console.
These connectors SHOULD be
suggested to the end-user
that they are for
gamepads, keyboards, mice,
and other user input devices.
