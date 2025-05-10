#!/bin/bash
export TERM=vt100 

#!/bin/bash

LOGFILE=/games/zork.log
GAMEFILE="/games/${GAME_FILE}"

# Ensure log file is writable
touch "$LOGFILE"
chmod 666 "$LOGFILE"

# Log execution
echo "Starting Frotz with $GAMEFILE" >> "$LOGFILE"
/usr/games/frotz  "$GAMEFILE" >> "$LOGFILE" 2>&1
