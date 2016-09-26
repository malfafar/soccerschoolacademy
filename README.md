# Getting Started with git

Fazer git clone (está no canto superior esquerdo)

# Getting Started with Rails

* é necessário ter o rails instalado.
* é necessário ter o postgresql instalado
* é necessário ter o postgresql configurado para este projecto

# Install Rails (Linux)

Como instalar o ruby on rails no linux mint

----------


### Prepare

Fazer os updates:
> sudo apt-get update

Instalar o curl:
> sudo apt-get install curl



----------


### RVM


Instalar o curl:
> \curl -L https://get.rvm.io | bash -s stable `--`ruby


Adicionar esta linha ao `~/.bashrc`:
> export PATH=\$PATH:$HOME/.rvm/bin

Adicionar esta linha ao `~/.bash_profile`:
> [[ -s "\$HOME/.profile" ]] && source "$HOME/.profile"

>[[ -s "\$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

finalmente é fazer estes dois comandos:
> source ~/.rvm/scripts/rvm

> rvm requirements

----------


### Ruby

Instalar o ruby:
>rvm get stable `--`autolibs=enable

>rvm install ruby

Este passo pode não ser necessário:
>rvm `--`default use ruby-2.1.2

----------


### Node.js

>sudo apt-get install nodejs

Adicionar esta linha ao `~/.bashrc`:
>export PATH=$PATH:/usr/local/node/bin

e correr
>source $HOME/.bashrc

----------


### Rails

Instalar:
>gem install rails

Para a instalação ser mais rápida pode-se tirar a documentação adicionando esta linha `--no-ri --no-rdoc` ao comando anterior.

----------


### Testar o Ruby On Rails


Correr:
>rails new teste

Ir para uma consola nova e abrir o projecto criado:
>rails s

Caso apareça erros de railties e cenas, ir à consola a profile preferences > title and command > run command as a login shell


----------


#### Urls

https://www.linuxcasts.net/casts/ubuntu/1004.shtml

http://railsapps.github.io/installrubyonrails-ubuntu.html

http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/


# Install Postgresql (Linux)

Correr os comandos na consola

>sudo apt-get install postgresql

>sudo apt-get install libpq-dev

# Install Postgresql (Mac)
Fazer download da app, e instalar...

# Config Postgresql (Linux)

>sudo -u postgres psql

>create user userdb with password 'passworddb';

>alter user userdb with superuser;

>CREATE DATABASE projectox_development;

>GRANT ALL PRIVILEGES ON DATABASE projectox_development to userdb;

>\q

# Config Postgresql (Mac)

Abrir a aplicação e carregar no botão do terminal

>create user userdb with password 'passworddb';

>alter user userdb with superuser;

>CREATE DATABASE projectox_development;

>GRANT ALL PRIVILEGES ON DATABASE projectox_development to userdb;

>\q
