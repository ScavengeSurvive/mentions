#define RUN_TESTS
#include <ut_mock_players>
#include <YSI\y_testing>

#include "mentions.inc"


main() {
	SetPlayerName(0, "Player0");
	SetPlayerName(1, "Player1");
	SetPlayerName(2, "Player2");
	SetPlayerColor(0, 0xFF0000AA);
	SetPlayerColor(1, 0x00FF00AA);
	SetPlayerColor(2, 0x0000FFAA);
}

Test:ColourCodes() {
	new out[128];
	new ret = ExpandMentions("&rred, &ggreen, &bblue.", out, 128, X11_WHITE);
	printf("%d: '%s'", ret, out);
	ASSERT(!strcmp(out, "{FF0000}red, {00FF00}green, {0000FF}blue."));
	ASSERT(ret == 3);
}

Test:ColourCodesOverflow() {
	new out[128];
	new ret = ExpandMentions("&rred &ggreen &bblue", out, 21, X11_WHITE);
	printf("%d: '%s'", ret, out);
	ASSERT(!strcmp(out, "{FF0000}red {00FF00}g"));
	ASSERT(ret == 2);
}

Test:MentionOne() {
	new out[128];
	new ret = ExpandMentions("@0", out, 128, X11_WHITE);
	printf("%d: '%s'", ret, out);
	ASSERT(!strcmp(out, "{000000}Player0{FFFFFF}"));
	ASSERT(ret == 1);
}

Test:MentionThree() {
	new out[128];
	new ret = ExpandMentions("Hello @0, do you know @1 and @2?", out, 128, X11_WHITE);
	printf("%d: '%s'", ret, out);
	ASSERT(!strcmp(out, "Hello {000000}Player0{FFFFFF}, do you know {000000}Player1{FFFFFF} and {000000}Player2{FFFFFF}?"));
	ASSERT(ret == 3);
}

Test:MentionWithColours() {
	new out[128];
	new ret = ExpandMentions("&battempt to recolour &r@1&b", out, 128, X11_WHITE);
	printf("%d: '%s'", ret, out);
	ASSERT(!strcmp(out, "{0000FF}attempt to recolour {FF0000}{000000}Player1{FFFFFF}&b"));
	ASSERT(ret == 3);
}

blank(s[], len = sizeof(s)) {
	for(new i; i < len; i++) {
		s[i] = 0;
	}
}
