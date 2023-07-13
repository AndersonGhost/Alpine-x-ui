# x-ui
适配Alpine linux  使用了F大编译的x-ui，支持reality  
纯净系统首次安装后内存占用约为27m左右，重启后内存占用约为20m
# 已知问题
- 小概率安装后无法打开x-ui或者ssh内管理x-ui提示 * status: crashed，请重新运行一次脚本。目前已对该问题做了尝试性修复
- 目前仅测试x86架构下的安装
# 功能介绍

- 系统状态监控
- 支持多用户多协议，网页可视化操作
- 支持的协议：vmess、vless、trojan、shadowsocks、dokodemo-door、socks、http
- 支持配置更多传输配置
- 流量统计，限制流量，限制到期时间
- 可自定义 xray 配置模板
- 支持 https 访问面板（自备域名 + ssl 证书）
- 支持一键SSL证书申请且自动续签
- 更多高级配置项，详见面板

# 安装&升级

```
apk add curl&&apk add bash && bash <(curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/alpine-xui.sh)
```
仅支持Alpine linux 安装  
支持x86与arm64架构的小鸡安装
# 部分问题解决方案
若跑太猛，面板crashed了，请使用以下命令重启面板
```
/etc/init.d/x-ui restart
```
特别感谢mocikate大佬，安装脚本有部分参考其脚本并修改  
感谢F大编译维护的x-ui
