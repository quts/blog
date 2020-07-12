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
## Kernel
1. Find machine name in kernel dump.        
```cpp
r @$t0 = @@masm(mrxsmb!SmbCeContext); dx (nt!_UNICODE_STRING[4])(@$t0)
```
2. Switch to process
    - get process address        
    ```cpp
    !process 0 0 <process_name>
    ```
    - switch to process        
    ```cpp
    .process /r /P <process_address>
    ```
    - list process threads        
    ```cpp
    !process 0 7 <process_name>
    ```
