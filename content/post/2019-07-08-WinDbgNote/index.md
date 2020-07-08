---
title: Learning WinDbg
date: 2020-07-07
categories:
  - "windows"
tags:
  - "dump"
  - "windbg"
lead: "Note for learning Windbg"
---
# Commands
1. Find machine name in kernel dump
```cpp
6: kd> r @$t0 = @@masm(mrxsmb!SmbCeContext); dx (nt!_UNICODE_STRING[4])(@$t0)
(nt!_UNICODE_STRING[4])(@$t0)                 [Type: _UNICODE_STRING [4]]
    [0]              : "ABCDEF" [Type: _UNICODE_STRING]
    [1]              : "MN123456" [Type: _UNICODE_STRING]
    [2]              : "Windows 10 Enterprise 18363" [Type: _UNICODE_STRING]
    [3]              : "Windows 10 Enterprise 6.3" [Type: _UNICODE_STRING]
```
