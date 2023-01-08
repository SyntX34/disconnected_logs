#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR "ZombieFeyk, +SyntX"
#define PLUGIN_VERSION "2.00"

#include <sourcemod>
#include <sdktools>
#include <morecolors>

#pragma newdecls required

public Plugin myinfo = 
{
	name = "Disconnect Logs and Join Logs.",
	author = PLUGIN_AUTHOR,
	description = "allows admins to see the STEAMID of disconnected players.",
	version = PLUGIN_VERSION,
	url = ""
};

public void OnPluginStart()
{
	
}

public void OnClientDisconnect(int client)
{
	char name[256];
	char steamid[64];
	GetClientName(client, name, sizeof(name));
	GetClientAuthId(client, AuthId_Steam2, steamid, 32);
	for(int i = 1; i < MaxClients; i++)
	{
		if(GetAdminFlag(GetUserAdmin(i), Admin_Reservation))
		{
			CPrintToChat(i, "{green}[SM] {white}Player {green}%s {white}Disconnected. STEAMID: {green}%s", name, steamid);
			PrintToConsole(i, "######################  Admin Message ########################### \n");
			PrintToConsole(i, "Player %s left the game!. SteamID: %s \n", name, steamid);
			PrintToConsole(i, "###################### Admin Message Ended ######################");
		}		
	}
}