# mentions.inc

Provides a function for replacing instances of `@<id>` with the corresponding player ID's name and replcing instances of `&<colour>` with an inline colour code.

## Player Mentions

For example, given that:

* there are three players named: Alice, Bob and Steve
* their player colours are: 0xFF0000, 0x00FF00 and 0x0000FF
* the chat colour is white, 0xFFFFFF

`Hello @0, do you know @1 and @2?`

Becomes:

`Hello {FF0000}Alice{FFFFFF}, do you know {00FF00}Bob{FFFFFF} and {0000FF}Steve{FFFFFF}?`

Via:

`ExpandMentions(in, out, 128, 0xFFFFFFAA);`

## Colour Codes

Colour codes can be inserted using:

* `&r`: RED
* `&g`: GREEN
* `&b`: BLUE
* `&y`: YELLOW
* `&p`: PINK
* `&w`: WHITE
* `&o`: ORANGE
* `&n`: NAVY

For example:

`This &rtext &gis &bcoloured!`

Becomes:

`This {FF0000}text {00FF00}is {0000FF}coloured!`

## Installation

Simply install to your project:

```bash
sampctl package install ScavengeSurvive/mentions
```

Include in your code and begin using the library:

```pawn
#include <mentions>
```

## Testing

To test, simply run the package:

```bash
sampctl package run
```

And observe the y_testing output.
