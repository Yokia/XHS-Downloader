#!/bin/bash

# Set script to exit on any errors.
set -e

echo 'Updating package lists... | 正在更新软件包列表...'
sudo apt-get update

echo 'Installing python3.12... | 正在安装python3.12...'
sudo apt install -y python3.12

echo 'Installing PIP3... | 正在安装PIP3...'
sudo apt install -y python3.12-pip

echo 'Installing python3.12-venv... | 正在安装python3.12-venv...'
sudo apt install -y python3.12-venv

echo 'Creating path: /www/wwwroot | 正在创建路径: /www/wwwroot'
sudo mkdir -p /www/wwwroot

cd /www/wwwroot || { echo "Failed to change directory to /www/wwwroot | 无法切换到目录 /www/wwwroot"; exit 1; }

cd rednote/ || { echo "Failed to change directory to rednote | 无法切换到目录 rednote"; exit 1; }

echo 'Creating a virtual environment | 正在创建虚拟环境'
python3.12 -m venv venv

echo 'Activating the virtual environment | 正在激活虚拟环境'
source venv/bin/activate

echo 'Setting pip to use the default PyPI index | 设置pip使用默认PyPI索引'
pip config set global.index-url https://pypi.org/simple/

echo 'Installing pip setuptools | 安装pip setuptools'
pip install setuptools

echo 'Installing dependencies from requirements.txt | 从requirements.txt安装依赖'
pip install -r requirements.txt

echo 'Deactivating the virtual environment | 正在停用虚拟环境'
deactivate

echo 'Adding rednote to system service | 将rednote添加到系统服务'
sudo cp daemon/* /etc/systemd/system/

echo 'Enabling rednote service | 启用rednote服务'
sudo systemctl enable rednote.service

echo 'Starting rednote service | 启动rednote服务'
sudo systemctl start rednote.service

echo 'rednote installation complete! | rednote安装完成!'
echo 'You can access the API at http://localhost:8001 | 您可以在http://localhost:8001访问API'
echo 'You can change the port in main.py under the /www/wwwroot/rednote directory | 您可以在/www/wwwroot/rednote目录下的main.py中更改端口'
echo 'If the API is not working, please change the cookie in settings.json under the /www/wwwroot/rednote/settings.json directory | 如果API无法工作，请更改/www/wwwroot/rednote/settings.json目录下的cookie'
echo '如果是宝塔面板，请记得在安全设置那里，给端口放行'