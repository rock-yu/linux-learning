#!/bin/bash

# hide secrets from bash history

_curl_vault() {
    echo '{"data":{"username":"bob","password":"secret"}}'
}

# Get both the username and password keys from e.g Vault
get_username_password_from_vault() {
    local USERNAME_VAR=$1
    local PASSWORD_VAR=$2
 	
    local vault_json=$(_curl_vault)
    
    if [ $? -eq 1 ] || [ -z "$vault_json" ]; then
        echo " error reading from vault or no data returned"
        return 1
    fi

    read -r -d '' DATA <<EOF
$vault_json
EOF

    username=$(jq -r .data.username <(echo "$DATA"))
    password=$(jq -r .data.password <(echo "$DATA"))
    eval "$USERNAME_VAR=$username"
    eval "$PASSWORD_VAR=$password"
    return 0
}


get_username_password_from_vault USER PASS
    read -r -d '' CURL_CONFIG <<curl_config
--user ${USER}:${PASS}
curl_config


SECURED_URL="localhost:9200"
curl --silent --config <(echo "$CURL_CONFIG") -XGET $SECURED_URL

