#!/bin/bash

# 1. Скачиваем весь зашифрованный JSON-пакет из Vault в оперативную память
#VAULT_DATA=$(curl -s -H "X-Vault-Token: your-token-HashiCorpVault" "https://your-domain/your-path-HashiCorp) #edit

# 2. С помощью jq вырезаем чистые пароли без пробелов и сразу создаем секреты Swarm
echo -n "$(echo "$VAULT_DATA" | jq -r '.data.data.postgres_password')" | docker secret create postgres_password -
echo -n "$(echo "$VAULT_DATA" | jq -r '.data.data.n8n_user')" | docker secret create n8n_user -
echo -n "$(echo "$VAULT_DATA" | jq -r '.data.data.n8n_password')" | docker secret create n8n_password -
echo -n "$(echo "$VAULT_DATA" | jq -r '.data.data.n8n_encryption_key')" | docker secret create n8n_encryption_key -

# 3. Запускаем ваш готовый compose-файл n8n
docker stack deploy -c n8n-stack.yml n8n
