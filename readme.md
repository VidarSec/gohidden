# GoHidden
---

## After use with ./gohidden.sh
### nano /etc/nginx/nginx.conf
Remove hash(#) from the following lines:

```#server_tokens off;```
```#server_name_in_redirect_off;```

Change ```#server_names_hash_bucket_size to "128"```

ctrl+x to save and exit

### nano /etc/nginx/sites-available/default
Change ```listen 80 default_server;``` to ```listen 80;```

Change ```listen [::]:80 default_server;``` to ```listen [::]:80;```

Paste your .onion link in the following line:

```server_name your.onion.link;```

ctrl+x to save and exit

### cd /etc/nginx/sites-enabled
```nginx -t```

```service nginx start```

```service nginx status```
