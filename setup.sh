#!/bin/bash

ln -s memcached_ /etc/munin/plugins/memcached_bytes
ln -s memcached_ /etc/munin/plugins/memcached_counters
ln -s memcached_ /etc/munin/plugins/memcached_rates
ln -s /etc/munin/plugins/
ln -s rails_database_time  /etc/munin/plugins/.
ln -s rails_passenger_memory  /etc/munin/plugins/.
ln -s rails_passenger_status  /etc/munin/plugins/.
ln -s rails_request_duration  /etc/munin/plugins/.
ln -s rails_request_error  /etc/munin/plugins/.
ln -s rails_requests  /etc/munin/plugins/.
ln -s rails_view_render_time /etc/munin/plugins/.

echo "" >> /etc/munin/plugin-conf.d/munin-node
echo "[rails*]" >> /etc/munin/plugin-conf.d/munin-node
echo "env.log_file '/var/log/apache2/access.log'" >> /etc/munin/plugin-conf.d/munin-node
echo "user root" >> /etc/munin/plugin-conf.d/munin-node
echo "command /opt/ree/bin/ruby %c" >> /etc/munin/plugin-conf.d/munin-node
echo "timeout 60" >> /etc/munin/plugin-conf.d/munin-node

