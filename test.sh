source "srcs/.env"

test() {

    # NGINX + WORDPRESS + MARIADB
    local RES=$(curl -s --cacert ./secrets/site.crt "https://$WP_SITE_URL")
    if [ $? -eq 0 ] ; then
        success NGINX server OK
    else
        error NGINX server NOK
    fi

    # REDIS
    local REDIS_ENABLE=$(echo "$RES" | grep "Performance optimized by Redis Object Cache.")
    if [ "$REDIS_ENABLE" != "" ] ; then
        success REDIS OK
    else
        error REDIS NOK
    fi

    # FTP Server
    local RES=$(lftp -u "$WP_ADMIN_USER,$WP_ADMIN_PASSWORD" -e "set ssl:ca-file $PWD/secrets/site.crt; ls; bye" "$WP_SITE_URL")
    if [ $? -eq 0 ] ; then
        success FTP server OK, $(echo "$RES" | wc -l) files listed from server
    else
        success FTP server NOK
    fi

    # ADMINER
    RES=$(curl -s --cacert ./secrets/site.crt "https://$WP_SITE_URL/adminer-5.3.0.php")
    local ADMINER_ENABLE=$(echo "$RES" | grep "<title>Login - Adminer</title>")
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
