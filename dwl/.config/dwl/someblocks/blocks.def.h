//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
    {"  ", "$HOME/.scripts/cpu.sh", 2, 0},
    {"  ", "$HOME/.scripts/disk.sh", 60, 0},
    {" ", "$HOME/.scripts/wifi.sh", 5, 0},
    {" ", "$HOME/.scripts/weather.sh", 600, 0},
    {"", "$HOME/.scripts/date.sh", 5, 0},

};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
