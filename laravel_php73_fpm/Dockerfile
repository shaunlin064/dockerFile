FROM shaunlin064/php7.3_fpm

#crontab
#ADD cron line
ADD ./config/cron/schedule-cron /etc/cron.d/schedule-cron
#change mod
RUN chmod 0777 /etc/cron.d/schedule-cron
# Apply cron job
RUN crontab /etc/cron.d/schedule-cron
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
## Run the command on container startup
CMD cron && php-fpm && supervisord