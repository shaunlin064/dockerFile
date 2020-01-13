FROM shaunlin064/php7.3-fpm

#crontab
ENV PROJECT_PATH "* * * * * /usr/local/bin/php /var/project/dataanalysiscontrol/artisan schedule:run >> /dev/null 2>&1"
RUN touch /etc/cron.d/schedule-cron && echo ${PROJECT_PATH} >> /etc/cron.d/schedule-cron
# Give execution rights on the cron job
RUN chmod 0777 /etc/cron.d/schedule-cron

# Apply cron job
RUN crontab /etc/cron.d/schedule-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log
#
## Run the command on container startup
RUN cron
