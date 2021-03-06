#!/bin/bash

ln -s $PWD/memcached_ /etc/munin/plugins/memcached_bytes
ln -s $PWD/memcached_ /etc/munin/plugins/memcached_counters
ln -s $PWD/memcached_ /etc/munin/plugins/memcached_rates
ln -s $PWD/rails_database_time  /etc/munin/plugins/rails_database_time
ln -s $PWD/rails_passenger_memory  /etc/munin/plugins/rails_passenger_memory
ln -s $PWD/rails_passenger_status  /etc/munin/plugins/rails_passenger_status
ln -s $PWD/rails_request_duration  /etc/munin/plugins/rails_request_duration
ln -s $PWD/rails_request_error  /etc/munin/plugins/rails_request_error
ln -s $PWD/rails_requests  /etc/munin/plugins/rails_requests
ln -s $PWD/rails_view_render_time /etc/munin/plugins/rails_view_render_time

echo "" >> /etc/munin/plugin-conf.d/munin-node
echo "[rails*]" >> /etc/munin/plugin-conf.d/munin-node
echo "user root" >> /etc/munin/plugin-conf.d/munin-node
echo "command /opt/ree/bin/ruby %c" >> /etc/munin/plugin-conf.d/munin-node
echo "timeout 60" >> /etc/munin/plugin-conf.d/munin-node
echo -n "Path to rails log file: "
read -e RAILS_LOG
echo "env.log_file $RAILS_LOG" >> /etc/munin/plugin-conf.d/munin-node

echo "" >> /etc/munin/plugin-conf.d/munin-node
echo "[memcached_*]" >> /etc/munin/plugin-conf.d/munin-node
echo "user root" >> /etc/munin/plugin-conf.d/munin-node
echo "timeout 60" >> /etc/munin/plugin-conf.d/munin-node

/etc/init.d/munin-node restart
