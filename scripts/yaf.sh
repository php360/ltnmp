#!/bin/bash

install_yaf() {
    echo "--------------------------------------------"
    echo ""
    echo "     Indtall ${ltnmp_yaf}"
    echo ""
    echo "     By:Andy http://www.moqifei.com"
    echo ""
    echo "--------------------------------------------"

    cd ${current_dir}/src
    tar -zxvf ${ltnmp_yaf}.tgz
    cd ${ltnmp_yaf}

    sed -i '/yaf.so/d' /usr/local/php/etc/php.ini
    zend_ext_dir=${ltnmp_php_extension}
    if [ -s "${zend_ext_dir}yaf.so" ]; then
        rm -f "${zend_ext_dir}yaf.so"
    fi

    /usr/local/php/bin/phpize
    ./configure --with-php-config=/usr/local/php/bin/php-config
    make && make install

    sed -i '/; Windows Extensions/i\extension=yaf.so' /usr/local/php/etc/php.ini

    /etc/init.d/php-fpm restart

    echo "====== yaf install completed ======"
    echo "yaf installed successfully!"

}