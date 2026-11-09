# OW-Light-Translator · 聊天客观改写

基于 OW-Light-Translator 的 Windows 外部悬浮窗。它读取你对齐的屏幕区域，把聊天截图交给 DeepSeek Vision，按原语言重写后显示在原聊天区域。

本项目改编自 [Donutcheese/overwatch_translate_tool](https://github.com/Donutcheese/overwatch_translate_tool)，包含其悬浮窗、桌面区域截图、快捷键和打包结构；上游 MIT 许可证和版权信息随项目与安装包保留。具体组件和改动见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。

## 行为

- 保留玩家名、频道顺序、事实、英雄名、数字和战术信息；改写字幕使用更大的字体。
- 将恶意或辱骂内容改成客观、中性、尊重的表达，去除嘲讽；其他发言保持原意并改成清晰、礼貌的语气，不刻意卑微或添加奉承。
- `F9` 启用不透明遮布；锁定时程序每 1.8 秒检查一次画面，只有聊天颜色掩码变化时才请求模型。`F8` 可立即强制刷新；点击遮布右上角“返回设置”或再次按 `F9` 可回到编辑模式。
- 截图使用 Windows 桌面区域捕获；程序不读取游戏内存、不注入 DLL，也不模拟键鼠。

## 重要限制

- 游戏聊天必须继续显示在画面里，屏幕识别才能取得原文。若在《守望先锋》设置中关闭聊天频道，程序也读不到该频道的消息。
- 捕获时遮布会短暂隐藏，默认等待 35 毫秒后截屏，再恢复不透明遮布继续请求 DeepSeek。此方案无法保证原聊天在截屏瞬间完全不可见。
- 聊天截图会发送给 DeepSeek API。请填写自己的 API Key，并按 DeepSeek 的服务条款和计费方式使用。
- 这是外部悬浮窗，不保证游戏或反作弊系统会如何处理第三方覆盖层。

## 安装与启动

1. 安装 Python 3.10 或更新版本。
2. 双击 `scripts/setup_venv.bat` 安装依赖。
3. 复制 `.env.example` 为 `.env`，填入 `DEEPSEEK_API_KEY`。
4. 运行 `python main.py`，或从工作区根目录双击 `启动悬浮窗.bat`。
5. 将半透明窗口拖到聊天区域并调整大小；按 `F9` 启用遮布。

Windows 全局热键 `F8` / `F9` 可能需要管理员权限。编辑模式用于对齐；锁定后会阻止鼠标点击穿过遮布。

## 构建 Windows 安装程序

1. 运行 `scripts/setup_venv.bat` 安装项目依赖。
2. 安装 [Inno Setup](https://jrsoftware.org/isdl.php) 6 或 7。
3. 运行 `scripts/build_installer.bat`。
4. 安装程序生成在 `dist/OW-Chat-Gentle-Overlay-Setup-0.1.2.exe`。

安装包包含应用、MIT 许可证、上游组件声明和 `.env` 配置模板。DeepSeek API Key 不会打进程序或安装包。

## 配置

```env
DEEPSEEK_API_KEY=填入你的密钥
DEEPSEEK_URL=https://api.deepseek.com/chat/completions
DEEPSEEK_MODEL=deepseek-flash
DEEPSEEK_THINKING_DISABLED=1
DEEPSEEK_MAX_TOKENS=2048
PREFETCH_ENABLED=1
PREFETCH_INTERVAL_MS=1800
CAPTURE_HIDE_DELAY_MS=35
```

保留上游 MIT 许可证，见 [LICENSE](LICENSE)。
