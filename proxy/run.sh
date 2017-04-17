#! /bin/sh

NGINX_CONF_DIR=/etc/nginx/conf.d/
TEMPLATE_DIR=templates/

rename_template(){
    path=$1
    name=${path##*/}
    name=${name%.template.conf}
    renamed_filename="$NGINX_CONF_DIR$name.conf"
    echo $renamed_filename
}

sub_template(){
    file_to_sub=$1

    rename_template $file_to_sub

    echo "subsituting $file_to_sub and copying to new file $renamed_filename"
    envsubst  '${HOST_NAME}' < $file_to_sub > $renamed_filename
    cat $renamed_filename
}

sub_all_templates(){
    for file in $TEMPLATE_DIR*.template.conf; do
        sub_template $file
    done
}

sub_all_templates && \
    nginx -g 'daemon off;'
