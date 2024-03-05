[English](README.md) | **简体中文**

# MiniOyster
为维护私有 NixOS 配置而特地预留的空项目。

## 为什么这么做？
你可能会想要这样的 NixOS 配置：
- 被私密地存放在其它地方（如子模块 / 私有 Git 目录）。

然而，你不够聪明的 CI 并不知道如何处理 `inputs` 中的私有配置：
- CI 会无法找到私有配置，并抛出错误，且拒绝检查剩余配置的正确性。

## 这个项目如何解决该问题？
- 对于 CI：解析 inputs、读到 URL、从这个空项目拉取语法上正确的配置，并成功解析剩余非私有的 NixOS 配置；
- 对你而言：使用 `--override-input` 参数覆写 `input`，将其指向你真正私有配置的位置，以顺利的解析所有的 NixOS 配置。

## 为何不有条件的引入 inputs？
Nix 对于 `flake.nix` 仅仅只支持 [Nix 语言的子集](https://github.com/NixOS/nix/issues/3966)，这使得 `flake.nix` 无法包含高级逻辑（以有条件的引用 inputs）。