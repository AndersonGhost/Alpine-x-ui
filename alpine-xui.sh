#!/bin/sh
#
# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1

# check os
if cat /etc/issue | grep -Eqi "alpine"; then
    release="alpine"
else
    echo -e "${red}未检测到系统版本，请联系脚本作者！${plain}\n" && exit 1
fi


echo "检查安装环境"
apk add curl && apk add bash && apk add sudo && apk add wget
mkdir /lib64
cp /lib/ld-musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

echo "安装Alpine所需文件"
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/Dependency/x-ui.db -o x-ui.db
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/Dependency/config.json -o config.json
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/Dependency/x-ui -o x-ui
mv x-ui.db /etc/x-ui/
mv x-ui /etc/init.d/
mv config.json  /usr/local/x-ui/bin/
chown 501.dialout /etc/x-ui/x-ui.db
chown 501.dialout /usr/local/x-ui/bin/config.json
chmod +x /etc/init.d/x-ui
chmod 0644 /etc/x-ui/x-ui.db
chmod 0644 /usr/local/x-ui/bin/config.json
rc-update add /etc/init.d/x-ui
/etc/init.d/x-ui start

# install x-ui
bash <(curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/install.sh)

echo -e "${plain}x-ui安装完成"
echo -e "${green}正在启动x-ui...."
/etc/init.d/x-ui restart

# 尝试修复一次安装失败 
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/Dependency/x-ui.db -o x-ui.db
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/Dependency/config.json -o config.json
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/Dependency/x-ui -o x-ui
mv x-ui.db /etc/x-ui/
mv x-ui /etc/init.d/
mv config.json  /usr/local/x-ui/bin/
chown 501.dialout /etc/x-ui/x-ui.db
chown 501.dialout /usr/local/x-ui/bin/config.json
chmod +x /etc/init.d/x-ui
chmod 0644 /etc/x-ui/x-ui.db
chmod 0644 /usr/local/x-ui/bin/config.json
rc-update add /etc/init.d/x-ui
/etc/init.d/x-ui restart
