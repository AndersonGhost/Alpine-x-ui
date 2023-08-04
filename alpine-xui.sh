#!/bin/sh
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
echo -e "${green}Alpine-x-ui 安装脚本v test "
echo -e "${green}项目地址：https://github.com/Lynn-Becky/Alpine-x-ui"
read -p "回车键继续..."
echo -e "x-ui install for alpine"

# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1

# check os
if cat /etc/issue | grep -Eqi "alpine"; then
    release="alpine"
else
    echo -e "${red}未检测到系统版本，请联系脚本作者！${plain}\n" && exit 1
fi


echo "检查安装环境"
apk add curl && apk add wget
mkdir /lib64
cp /lib/ld-musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# install x-ui
bash <(curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/test/install.sh)

# repair datebase
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/Dependency/x-ui.db -o x-ui.db
mv x-ui.db /etc/x-ui/
chown 501.dialout /etc/x-ui/x-ui.db

echo -e "${plain}x-ui安装完成"
echo -e "${green}正在启动x-ui...."
/etc/init.d/x-ui restart

echo -e "${green}默认用户名与密码均为admin，端口为9000，需要修改请使用x-ui命令"
