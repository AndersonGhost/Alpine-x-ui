# x-ui
适配Alpine linux|
x86-64版本使用了FranzKafkaYu编译的新x-ui，支持新协议，arm64版使用原版|

# 已知问题
小概率安装后无法打开x-ui或者ssh内管理x-ui提示 * status: crashed，请重新运行一次脚本。目前已对该问题做了尝试性修复|
注意：重复使用脚本会导致小鸡内存占用上升，纯净系统首次安装完毕后内存占用约在25m|目前似乎无法使用v4端口创建入站，请使用ipv6
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
