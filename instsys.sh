# !/bin/bash

sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum -y install yum-utils
sudo yum-config-manager --enable remi-php74
sudo yum install php php-cli
sudo yum install composer -y

NODEJS=/usr/lib/node_modules
newex="export NODE_PATH=$NODEJS:\$NODE_PATH"

checkNodePath(){
    
    if [ -z $NODE_PATH ] > /dev/null ; then
        echo '没有找到NODE_PATH，现在安装'
        export NODE_PATH=$NODEJS
        echo $newex >> /etc/profile
        echo $newex >> ~/.bashrc
    fi
}

if which node > /dev/null
then
    echo "node is installed, skipping..."
    checkNodePath
else
    cd /~
    curl -sL https://rpm.nodesource.com/setup_10.x | bash -
    sudo yum clean all && sudo yum makecache fast
    sudo yum install -y gcc-c++ make
    sudo yum install -y nodejs
    checkNodePath
    sudo npm i -g --unsafe-perm=true --allow-root autoprefixer browser-sync child_process cssnano dotenv gulp glob gulp-clean gulp-concat gulp-connect-php gulp-cssnano gulp-eslint gulp-if gulp-imagemin gulp-insert gulp-less gulp-minify gulp-newer gulp-plumber gulp-postcss postcss gulp-preprocess gulp-rename node-sass gulp-sass gulp-uglify gulp-wait imagemin-gifsicle imagemin-jpegtran imagemin-svgo merge-stream webpack webpack-stream
fi
