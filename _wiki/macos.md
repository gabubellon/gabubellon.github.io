---
name: macos
tags:
- wiki
- macos
- apple
- mac

---
# MacOS

***

## Codecs AptX e AAC

* Ativando AptX e AAC na linha de comando (Catalina e BigSur):

```bash
sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true
sudo defaults write bluetoothaudiod "Enable AAC codec" -bool true
```

* Desativando AptX e AAC na linha de comando (Catalina e BigSur):

```bash
sudo defaults write bluetoothaudiod "Enable AptX codec" -bool false
sudo defaults write bluetoothaudiod "Enable AAC codec" -bool false
```

[ref.](https://www.macrumors.com/how-to/enable-aptx-aac-bluetooth-audio-codecs-macos/)