# Установка зависимостей #

## Данный шаг выполняется при наличии доступа в сеть Интернет. ##

## Для обновления версии composer, установки зависимостей и node.js требуется перейти в директорию *dependencies* и выдать права на исполнение и выпонить скрипт: ##

**cd dependencies**

**sudo chmod +x dependecies.sh**

**sudo sh ./dependecies.sh**

# Сборка и установка системы ТР-Архив из исходных кодов #

## Установите Ansible и sshpass: ##

**sudo apt install -y ansible sshpass**

## Перейдите в директорию *deployment*: ##

**cd deployment**

## Отредактируйте файл *hosts.yaml*, заменив значения переменных в строках, где присутсвует комментарий в скобках, на актуальные значения: ##

    all:
  
        vars:
    
            ansible_become: true
  
            ansible_connection: ssh
    
            ansible_user: user  (заменить на имя пользователя)
    
            ansible_ssh_pass: useruser  (указать пароль пользователя)
    
            ansible_sudo_pass: useruser  (указать пароль пользователя)
    
            ansible_ssh_private_key_file: ~/.ssh/id_rsa
    
            home_dir: /home/user/   (заменить на домашнюю директорию пользователя)

            back_arch: tr-archive-back-5.3.0-trch.zip
    
            front_arch: tr-archive-v-5.3.0-trch.zip
    
            notif_arch: tr-archive-notification-3.3.0-trch.zip
    
            worker_arch: tr-archive-worker-5.2.0-trch.zip
    
            public_arch: tr-archive-public-proxy-api-1.3.1-intgapi.zip
    
            SCHEME: http:// (протокол, по которому будет доступен UI)
    
            DOMAIN: 127.0.0.1   (IP-адрес подсистемы взаимодействия с пользователями или доменное имя, по которому будет доступен UI. Для использования доменного имени требуется указать протокол https:// в переменной SCHEME, и установить флаг true в переменной IS_USE_DOMAIN. Для использования IP-адреса требуется протокол http:// и флаг false в соответствующих переменных.)
    
            DOMAIN_OPENSEARCH: 127.0.0.1 (IP-адрес подсистемы семантического поиска)
    
            IS_USE_DOMAIN: false    (использование доменного имени для доступа к UI)
    
            HOSTNAME: hostname  (хостнейм виртуальной машины подсистемы семантического поиска)
    
            RAM: 4  (четвертая часть от общего количества оперативной памяти подсистемы семантического поиска)
    
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
    
            uuid: 1d04ca3e-df1a-0cb4-c325-6ef4003ca2ab  (ГУИД, который будет присвоен подсистеме ТР-Архив)
  
        hosts:
    
            tr-archive:
    
                ansible_host: 127.0.0.1   (IP-адрес подсистемы ТР-Архив)
    
            opensearch:
    
                ansible_host: 127.0.0.1 (IP-адрес подсистемы семантического поиска)

## Запустите выполнение плейбука Ansible от пользователя, указанного в *hosts.yaml*: ##

**ansible-playbook -i hosts.yaml playbook.yaml**

## После успешного проигрыша плейбука перейдит по адресу *http://127.0.0.1*, подставив значения протокола и адреса их *hosts.yaml* ##

## Учетные данные для авторизации в системе: ##
### Логин: *admin* ###
### Пароль: *admin* ###