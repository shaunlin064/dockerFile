FROM nazarpc/phpmyadmin

RUN apt-get update && apt-get install -y vim

RUN echo " \
    \\n\
    \$cfg['LoginCookieValidity'] = 3600*24*365; \\n\
    ini_set('session.gc_maxlifetime', 3600*24*365); \\n\
    \\n" >> /var/www/html/config.inc.php

USER root
