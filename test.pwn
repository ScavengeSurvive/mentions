#include "mentions.inc"

/* todo: use ut_mock_players

#define IsPlayerConnected(%0) (%0 == %0)

#if defined _ALS_GetPlayerName
    #undef GetPlayerName
#else
    #define _ALS_GetPlayerName
#endif

#define GetPlayerName(%0,%1,%2) FakeGetPlayerName(%0,%1,%2)

#if defined _ALS_GetPlayerColor
    #undef GetPlayerColor
#else
    #define _ALS_GetPlayerColor
#endif
#define GetPlayerColor(%0) FakeGetPlayerColor(%0)

FakeGetPlayerName(playerid, out[], len) {
	switch(playerid) {
		case 0:
			format(out, len, "Player0");
		case 1:
			format(out, len, "Player1");
		case 2:
			format(out, len, "Player2");
	}
}
FakeGetPlayerColor(playerid) {
	switch(playerid) {
		case 0:
			return X11_RED;
		case 1:
			return X11_GREEN;
		case 2:
			return X11_BLUE;
	}
	return 0;
}
*/

main() {
	new
		out[128],
		ret;

	blank(out);
	ret = ExpandMentions("&rred &ggreen &bblue", out, 128, X11_WHITE);
	printf("%d: '%s'", ret, out);

	blank(out);
	ret = ExpandMentions("&rred &ggreen &bblue", out, 20, X11_WHITE);
	printf("%d: '%s'", ret, out);

	blank(out);
	ret = ExpandMentions("@0", out, 128, X11_WHITE);
	printf("%d: '%s'", ret, out);

	blank(out);
	ret = ExpandMentions("Hello @0, do you know @1 and @2?", out, 128, X11_WHITE);
	printf("%d: '%s'", ret, out);

	blank(out);
	ret = ExpandMentions("attempt to recolour &r@1&b", out, 128, X11_WHITE);
	printf("%d: '%s'", ret, out);
}

blank(s[], len = sizeof(s)) {
	for(new i; i < len; i++) {
		s[i] = 0;
	}
}
