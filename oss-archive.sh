ossdir=~/oss
archive_remote_dir=oss://seatibackup/archive/
archive_local_dir=/mc/server
$ossdir/oss rmrf $archive_remote_dir
$ossdir/oss cp $archive_local_dir $archive_remote_dir