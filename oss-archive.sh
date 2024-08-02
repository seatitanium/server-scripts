ossdir=/root/oss
archive_remote_dir=oss://seatibackup/archive/
archive_local_dir=/mc/atm9nf/world
cd $ossdir
./oss rmrf $archive_remote_dir
./oss cp $archive_local_dir $archive_remote_dir