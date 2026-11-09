# OW Chat Gentle Overlay 0.1.0

Windows per-user installer for a DeepSeek-powered Overwatch chat rewrite overlay.

## Included

- `OW-Chat-Gentle-Overlay-Setup-0.1.0.exe`: Windows installer.
- `OW-Chat-Gentle-Overlay.exe`: standalone application executable.
- `.env` template; enter your own `DEEPSEEK_API_KEY` after installation.
- MIT license and third-party component notices.

## Attribution

This distribution is adapted from [OW-Light-Translator](https://github.com/Donutcheese/overwatch_translate_tool), starting from upstream revision `731b1ab`. Its MIT license and copyright notice are included in the installer. The adaptation adds DeepSeek Vision chat rewriting, an opaque chat-area overlay, and the installer.

## Notes

- DeepSeek API usage is billed to the API key owner.
- The installer is unsigned.
- Desktop OCR requires the game chat to remain visible behind the overlay. Capture briefly hides the overlay before restoring it.
- This project is independent and is not affiliated with Blizzard Entertainment or DeepSeek.
