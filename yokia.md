C:\Users\Lenovo\AppData\Local\Programs\Python\Python312\python.exe -m venv .venv        # 创建名为 .venv 的虚拟环境 (推荐使用 .venv)
source .venv/bin/activate   # 在 Linux/macOS 上激活虚拟环境
.venv\Scripts\activate      # 在 Windows 上激活虚拟环境
pip install -r requirements.txt #安装对应扩展

python main.py server #执行

C:\Users\Lenovo\AppData\Local\Programs\Python\Python312


python .\main.py --browser_cookie Chrome --update_settings #读取cookies

python .\main.py server #运行服务器版本



服务器部分
将文件上传到服务器后，可能需要升级服务器的版本才可以安装python3.12
sudo add-apt-repository ppa:deadsnakes/ppa -y
如果还不可以安装，则升级apt
sudo apt upgrade
目前只指定了3.12的版本

执行
systemctl start rednote.service
停止
systemctl stop rednote.service
查看状态
systemctl status rednote.service