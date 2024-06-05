# Used to monitor the `server` screen process existence.
# Restart `server` screen and write log after 5 seconds delay if the screen process not found.

while true
do
	if [ $(screen -list | grep 'server' | wc -l) -lt 1 ]; then
		echo [$(date +%Y-%m-%d_%H:%M:%S)] Server is stopped, restarted.
		echo ServerStop at [$(date +%Y-%m-%d_%H:%M:%S)] >> reboot_log.log
		#/mc/atm9/boot.sh
		screen -dm -S server /mc/atm9nf/startserver.sh
	else
		echo [$(date +%Y-%m-%d_%H:%M:%S)] Server is still running, skipping.
	fi
	sleep 5
done