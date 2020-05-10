---
title: 一眼看穿x86或是x64的PE File
date: 2020-05-11
categories:
  - "Windows"
tags:
  - "Windows"
  - "troubleshooting skill"
lead: "如何一眼看穿PE File binary是x86還是x64?"
---
身為Endpoint產品的工程師，通常都會遇到各種奇奇怪怪的情況，有時候是設計上並不周全，有時候是環境使然，有時候就是怪怪的需要大家一起猜猜看，
所以大夥也都各自練就一身奇奇怪怪的功夫。今天想談的一個小故事是前一陣子我們QA敲給我的一個case，大意是說某個system services上了hotfix就一睡不起。
但其實那個hotfix沒有做任何的code change，單純就是換了某個module team來的DLL，而且module team再三保證測試如同以往一樣到位，
所以這種smooky test等級的錯誤，基本上是不可能發生的。最後發現因為某些特殊的狀況，這個測試環境並不是透過CI產生的hotfix進行部署的，而是人工做出來的，
所以會有複製到錯誤檔案的風險，加上load DLL的部分並沒有明確的error message可供追蹤。
大概是以前自己做QA的時候也常犯這種錯誤吧，所以我的第一個反應就是包錯檔案拉!!!
但我也不禁好奇
```
所以，當有人直接拿個檔案問你的時候，你怎麼知道那是x86還是x64的檔案？
```

# Reference
- https://zh.wikipedia.org/wiki/%E5%8F%AF%E7%A7%BB%E6%A4%8D%E5%8F%AF%E6%89%A7%E8%A1%8C
- https://www.itread01.com/content/1546810925.html
