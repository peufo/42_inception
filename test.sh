
test() {
    local DOMAIN="jvoisard.42.fr"

    # NGINX + WORDPRESS + MARIADB
    local RESPONSE=$(curl --cacert ./secrets/site.crt "https://$DOMAIN")
    if [ $? -eq 0 ] ; then
        success NGINX server OK
    else
        error NGINX server NOK
    fi

    # REDIS
    local REDIS_ENABLE=$(echo "$RESPONSE" | grep "Performance optimized by Redis Object Cache.")
    if [ "$REDIS_ENABLE" != "" ] ; then
        success REDIS OK
    else
        error REDIS NOK
    fi

    # FTP SERVER
    if nc -zv jvoisard.42.fr 20 ; then
        success FTP server OK
    else
        error FTP server NOK
    fi

    # ADMINER
    RESPONSE=$(curl --cacert ./secrets/site.crt "https://$DOMAIN/adminer-5.3.0.php")
    local ADMINER_ENABLE=$(echo "$RESPONSE" | grep "<title>Login - Adminer</title>")
    if [ "$ADMINER_ENABLE" != "" ] ; then
        success ADMINER service OK
    else
        error ADMINER service NOK
    fi

}


info() {
	echo "\033[36m$@\033[0m"
}

error() {
	echo "\033[31m$@\033[0m"
}

success() {
	echo "\033[32m$@\033[0m"
}

warning() {
	echo "\033[33m$@\033[0m"
}

test
