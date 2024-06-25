#!/bin/bash

chromium_pid=$(pgrep chromium | head -1)
while
[
[ -z $chromium_pid ]]; do
  echo "Chromium browser is not running yet."
  sleep 5
  chromium_pid=$(pgrep chromium | head -1)
done
echo "Chromium browser process ID: $chromium_pid"
export XDG_RUNTIME_DIR=/run/user/1000


# FOR WIRELESS USERS (RECOMMENDED)
# Sometimes the browser can open before the wireless card has completely connected to the network - the WebCanvas box opens the page faster than the network can connect to the WebCanvas box.
# If you're not using scheduled refreshes below, the following setting will wait 20 seconds after boot, then refresh the page only one time to load it.
# Uncomment the following line (remove the # character) to use this feature.

sleep 20 && wtype -k F5


while true; do
  
  
  # IF YOU ARE NOT DISPLAYING MULTIPLE WEB PAGES
  # Comment the following line (add a hash character) to not cycle between tabs on the web browser, according to the timing below
    
  wtype -d 100 -M ctrl -k Tab -m ctrl
  
  
  # Change the following line for the number of seconds between websites / how often to refresh a single-page display if you chose to uncomment the line above.

  sleep 10


  # IF YOU WANT TO REFRESH THE PAGE EVERY xx SECONDS (or every time a new page is shown, when showing multiple pages)

  # Uncomment the following line (remove the hash character) to refresh each site as it is shown, if required. Many sites do not require this.
  # This can also be used to refresh the page if you're showing a single site according to the timings below
  # It's not recommended to refresh pages too often, as some websites will deny frequent reloads and show you a blank page instead - this is the server blocking you, not the box!

  #wtype -k f5

done
