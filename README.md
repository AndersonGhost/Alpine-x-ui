# x-ui

支持多协议多用户的 xray 面板
对Alpine linux做了尝试性适配
![捕获2](https://github.com/Lynn-Becky/Alpine-x-ui/assets/60915579/b823282b-d88d-4588-a2b4-89148bee0856)

# 已知问题
部分机器安装后无法打开x-ui或者ssh内管理x-ui提示 * status: crashed，请重新运行一次脚本，大概率可用解决问题
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
