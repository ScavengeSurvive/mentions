# mentions.inc

Provides a function for replacing instances of `@<id>` with the corresponding player ID's name and replcing instances of `&<colour>` with an inline colour code.

For example, given that:

* there are three players named: Alice, Bob and Steve
* their player colours are: 0xFF0000, 0x00FF00 and 0x0000FF
* the chat colour is white, 0xFFFFFF

`Hello @0, do you know @1 and @2?`

Becomes:

`Hello {FF0000}Alice{FFFFFF}, do you know {00FF00}Bob{FFFFFF} and {0000FF}Steve{FFFFFF}?`

Via:

`ExpandMentions(in, out, 128, 0xFFFFFFAA);`

## Usage

Simply add to your `pawn.json` and include:

```json
{
    "dependencies": ["ScavengeSurvive/mentions"]
}
```

```pawn
#include <mentions>
```

## Testing

To test, simply run the package:

```bash
sampctl package run
```

The test suite isn't quite done yet though, I need to use Misiur;s `ut_mock_players` to make the @ mentions work but the colour ones do.
