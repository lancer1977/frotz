#!/bin/bash
export TERM=ansi

#!/bin/bash

LOGFILE=/games/zork.log
GAMEFILE="/games/${GAME_FILE}"


# Ensure log file is writable
touch "$LOGFILE"
chmod 666 "$LOGFILE"

if [ ! -f "$GAME_FILE" ]; then
  echo "ERROR: Game file '$GAME_FILE' does not exist."
  exit 1
fi

# Log execution
echo "Starting Frotz with $GAMEFILE" >> "$LOGFILE"
/usr/games/frotz "$GAMEFILE"
#/usr/games/frotz -Z 0 "$GAMEFILE"
