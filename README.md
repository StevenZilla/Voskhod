# Установка зависимостей #

## Данный шаг выполняется при наличии доступа в сеть Интернет. ##

## Для обновления версии composer, установки зависимостей и node.js требуется перейти в директорию *dependencies* и выдать права на исполнение и выпонить скрипт: ##

**cd dependencies**

**sudo chmod +x dependecies.sh**

**sudo sh ./dependecies.sh**

# Сборка и установка системы ТР-Архив из исходных кодов #

## Отредактируйте файл *hosts.yaml* ##

**all:**

  **vars:**

    **ansible_become: true**

    **ansible_connection: ssh**

    **ansible_user:**

    **ansible_ssh_pass:**

    **ansible_sudo_pass:**

    **ansible_ssh_private_key_file: ~/.ssh/id_rsa**

    **home_dir:**

    **back_arch: tr-archive-back-5.3.0-trch.zip**

    **front_arch: tr-archive-v-5.3.0-trch.zip**

    **notif_arch: tr-archive-notification-3.3.0-trch.zip**

    **worker_arch: tr-archive-worker-5.2.0-trch.zip**

    **public_arch: tr-archive-public-proxy-api-1.3.1-intgapi.zip**

    **SCHEME: http://**

    **DOMAIN:**

    **DOMAIN_OPENSEARCH:**

    **IS_USE_DOMAIN: false**

    **HOSTNAME:**

    **RAM:**

    **DEB_NAME: tr-archive.deb**

    **COOCKIE: release**

    **BASE_AUTH: YWRtaW46YWRtaW4=**

    **container_password: 12345**

    **item_key1: cert_1.pfx**

    **item_key2: cert_2.pfx**

    **item_key3: cert_3.pfx**

    **item_key4: cert_4.pfx**

    **item_key5: cert_5.pfx**

    **item_key6: cert_6.pfx**

    **item_key7: cert_7.pfx**

    **ansible_python_interpreter: /usr/bin/python3**

    **medo_dir_in: /mnt/medo/in**

    **medo_dir_out: /mnt/medo/out**

    **uuid:**

  **hosts:**

    **tr-archive:**

      **ansible_host:**

    **opensearch:**

      **ansible_host:**


### Перейдите в директорию *deployment* ###


##