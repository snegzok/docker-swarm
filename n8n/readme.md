## 📋 Vault Data Prerequisites
Your HashiCorp Vault instance must have a **KV version 2** secrets engine enabled at the path `secret ` (note the hidden space character at the end).
📌!!!edit n8n-lite.sh 
enter your token and domain 



Inside this engine, a secret with the path **`n8n`** must be created, containing the following Key/Value pairs:
* `postgres_password` — PostgreSQL database password
* `n8n_user` — Admin username/email for the n8n dashboard.
* `n8n_password` — Admin login password for the n8n dashboard.
* `n8n_encryption_key` — A random 32-byte hexadecimal string used for encrypting n8n workflow credentials.


## 🚀 Execution Guide

1. Make sure the script has executable permissions:
   ```bash
   chmod +x n8n-lite.sh
   ```

2. Run the script from your standard user terminal (running with `sudo` is not required):
   ```bash
   ./n8n-lite.sh
