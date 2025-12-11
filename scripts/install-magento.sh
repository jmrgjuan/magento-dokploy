#!/usr/bin/env bash
set -e

# Comprobar si ./pub/index.php no existe
if [ ! -f "./pub/index.php" ]; then
    # Crear el directorio ./pub si no existe
    mkdir -p ./pub
    
    # Crear el archivo ./pub/index.php con contenido "hello world"
    echo -e '<?php\n\necho "<h1>hello world</h1>";\n' > ./pub/index.php
else
    echo "---- No hago nada"
fi

echo "------> script de pruebas completado"
exit 0

if [ "$INSTALL_MAGENTO" = "true" ] && [ ! -f app/etc/env.php ]; then
  echo "Instalando Magento..."
  
  php bin/magento setup:install \
    --base-url=${MAGENTO_BASE_URL} \
    --db-host=mariadb \
    --db-name=${MARIADB_DATABASE} \
    --db-user=${MARIADB_USER} \
    --db-password=${MARIADB_PASSWORD} \
    --admin-firstname=${MAGENTO_ADMIN_FIRSTNAME} \
    --admin-lastname=${MAGENTO_ADMIN_LASTNAME} \
    --admin-email=${MAGENTO_ADMIN_EMAIL} \
    --admin-user=${MAGENTO_ADMIN_USER} \
    --admin-password=${MAGENTO_ADMIN_PASSWORD} \
    --language=${MAGENTO_LANGUAGE:-es_ES} \
    --currency=${MAGENTO_CURRENCY:-EUR} \
    --timezone=${MAGENTO_TIMEZONE:-Europe/Madrid} \
    --use-rewrites=1 \
    --search-engine=opensearch \
    --opensearch-host=opensearch \
    --opensearch-port=9200
else
  echo "Magento ya está instalado o INSTALL_MAGENTO=false."
fi
