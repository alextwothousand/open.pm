/*  
    open.pm
    github.com/infin1tyy/open.pm
    by bork/infin1ty

    credits:
    .5150/cuber - testing
*/

#include <a_samp>
#include <sscanf2>

#include <izcmd>
#include <strlib>

#define FILTERSCRIPT

#define COLOR_YELLOW   0xf2f213ff
#define COLOR_YELLOW2  0xe2e21fff
#define COLOR_LIGHTRED 0xff6347ff

main() {}

public OnFilterScriptInit() {
    print("open.pm loaded, by bork/infin1tyy");
    return true;
}

public OnFilterScriptExit() {
    print("open.pm unloaded, I guess? lmfao");
    return true;
}

CMD:pm(playerid, params[]) {
    new message[140], userid;
    if (sscanf(params, "us[140]", userid, message)) {
        SendClientMessage(playerid, COLOR_LIGHTRED, "Syntax Error: {ffffff}/pm [playerid/partOfName] [message]");
        return false;
    }

    if (!IsPlayerConnected(userid)) {
        SendClientMessage(playerid, COLOR_LIGHTRED, "Error: That player is not connected.");
        return false;
    }

    if (strlen(message) < 1) {
        SendClientMessage(playerid, COLOR_LIGHTRED, "Error: You've got to type more than 1 character.");
        return false;
    }

    new name[MAX_PLAYER_NAME];

    GetPlayerName(userid, name, MAX_PLAYER_NAME);
    SendClientMessage(playerid, COLOR_YELLOW, sprintf("(PM to %s (%d): %s)", name, userid, message));

    GetPlayerName(playerid, name, MAX_PLAYER_NAME);
    SendClientMessage(userid, COLOR_YELLOW2, sprintf("(PM from %s (%d): %s)", name, playerid, message));

    GameTextForPlayer(userid, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~y~New message!", 3000, 3);
	PlayerPlaySound(userid, 1085, 0.0, 0.0, 0.0);

    return true;
}