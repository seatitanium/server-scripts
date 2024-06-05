# Should be used with crontab
# Copy `from` directory into `to` directory
# Delete the oldest if the count of backups exceeds the `max_keep_count` limit

from=/mc/atm9nf/world
to="/mc/backups"
max_keep_count=5

cp -r $from "$to/world_$(date +%Y-%m-%d_%H:%M:%S)"
cd $to
ls -tr | head -n -$max_keep_count | xargs --no-run-if-empty rm -rf