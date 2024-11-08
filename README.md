# Установка зависимостей #

## Данный шаг выполняется при наличии доступа в сеть Интернет. ##

## Для обновления версии composer, установки зависимостей и node.js требуется перейти в директорию *dependencies* и выдать права на исполнение и выпонить скрипт: ##

**cd dependencies**

**sudo chmod +x dependecies.sh**

**sudo sh ./dependecies.sh**

# Сборка и установка системы ТР-Архив из исходных кодов #

## Отредактируйте файл *hosts.yaml* ##

all:
  vars:
    ansible_become: true
    ansible_connection: ssh
    ansible_user: 
    ansible_ssh_pass: 
    ansible_sudo_pass: 
    ansible_ssh_private_key_file: ~/.ssh/id_rsa
    home_dir:
    back_arch:
    ront_arch:
    notif_arch:
    worker_arch:
    public_arch:
    SCHEME: http://
    DOMAIN: 
    DOMAIN_OPENSEARCH:
    IS_USE_DOMAIN: false
    HOSTNAME: 
    RAM: 
    DEB_NAME: tr-archive.deb
    COOCKIE: release
    BASE_AUTH: YWRtaW46YWRtaW4=
    container_password: 12345
    item_key1: cert_1.pfx
    item_key2: cert_2.pfx
    item_key3: cert_3.pfx
    item_key4: cert_4.pfx
    item_key5: cert_5.pfx
    item_key6: cert_6.pfx
    item_key7: cert_7.pfx
    ansible_python_interpreter: /usr/bin/python3
    medo_dir_in: /mnt/medo/in
    medo_dir_out: /mnt/medo/out
    uuid: 
  hosts:
    tr-archive:
      ansible_host: 
    opensearch:
      ansible_host: 

### Перейдите в директорию *deployment* ###


##