#/bin/zsh
STATUS=$(spotifycli --playbackstatus)
PRETTY="%{F#fc9003} $(spotifycli --artist)  %{F#262626}-  %{F#ff3c00}$(spotifycli --song)"
if [ "$STATUS" = "Spotify is off" ] || [ "$STATUS" = "▮▮" ] ; then
  echo ""
else
  echo $PRETTY
fi
