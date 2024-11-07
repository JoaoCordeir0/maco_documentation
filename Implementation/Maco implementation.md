<style>
    body {
        font-family: 'Arial', sans-serif;
    }
</style>

<div align="center">
    <img src="https://main.d2ow8gtgdi2uhu.amplifyapp.com/logo_maco.png" width="150"/>
    <h1>Documento de implantação do MACO</h1>
</div>

## Requisitos de servidor
- Linux
- Apache ou Nginx
- PHP 8.1
- Mysql

## Instalação do Backend

```bash
sudo apt update
sudo apt install apache2
sudo apt install php libapache2-mod-php
sudo apt install php-mbstring php-xml # Para extensão SlimPHP

cd /var/www/html
sudo apt install git-all
git clone https://github.com/JoaoCordeir0/maco_backend

sudo nano /etc/apache2/sites-available/slim-app.conf
```

Coleque essas informações no .conf:
```bash
<VirtualHost *:80>
    ServerAdmin admin@yourdomain.com
    DocumentRoot /var/www/html/maco_backend/public
    <Directory /var/www/html/maco_backend/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
Salve o .conf

Continue com os seguintes comandos:

```bash
sudo a2ensite slim-app.conf
sudo a2enmod rewrite

sudo a2dissite “site que tiver ativo por padrão do apache”

sudo systemctl restart apache2

sudo chown -R www-data:www-data /var/www/html/maco_backend
sudo chmod -R 755 /var/www/html/maco_backend
```

Após isso será necessário configurar o .env e database.db do projeto backend, siga a nomeclatura dos .example:
- .env.example
- database.db.example

Disponível em [https://github.com/JoaoCordeir0/maco_backend](https://github.com/JoaoCordeir0/maco_backend)

## Instalação do Mysql

Dispónivel em [https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04-pt](https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-20-04-pt)

Após instalar, restaure o backup do banco de dados do maco.

Backup disponível em: [https://github.com/JoaoCordeir0/maco_documentation/tree/main/Database/maco.sql](https://github.com/JoaoCordeir0/maco_documentation/tree/main/Database/maco.sql)

## Instalação do Frontend

Clone o projeto e abra um terminal na raiz do projeto e execute os seguintes comandos:
```bash
npm install
npm run build
cd /dist
```

Copie tudo que está dentro da pasta dist:
- assets/
    - index.js
    - index.css
- favicon.ico
- logo_maco.png
- preloader.svg
- index.html

E mova para o servidor que deverá ter o seguinte .htaccess para redirecionar todas as requisições para o index.html
```bash
RewriteEngine On

RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ /index.html [L]
```

Disponível em [https://github.com/JoaoCordeir0/maco_frontend](https://github.com/JoaoCordeir0/maco_frontend)