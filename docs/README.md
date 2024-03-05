**English** | [简体中文](README_CN.md)

# MiniOyster
Yet another placeholder for maintaining private configs.

## Why?
You may wanna writeup some NixOS config that is:
- Privately stored in other places (like submodules / private git repos).

However, your dumb CI does not know the exact way to access private configs:
- CI will not find them, throw evaluate errors and refuse to check the rest of configs.

## How does this repo helps solve the problem?
- For CI: They evaluate the inputs, read the url, fetch stub code from this repo, and successfully evaluate the rest of configs.
- For you: Use `--override-input` argument to overwrite stub repo to actual place where you hold the private things, and successfully evaluate the whole NixOS configs.

## Why don't you conditionally introduce inputs?
Nix only support [subsets of Nix language](https://github.com/NixOS/nix/issues/3966) for `flake.nix`, which (possibly) eliminates the possibility to write logic (to conditionally introduce inputs).