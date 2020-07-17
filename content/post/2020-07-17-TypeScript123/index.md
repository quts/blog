---
title: 我的TypeScript學習之旅 - 1
date: 2020-07-17
categories:
  - "typescript"
tags:
  - "typescript"
lead: "Note for a beginner to learn TypeScript"
---
因為工作上新的專案需要會JavaScript,         
而小弟又已經七八年沒有寫js了, 除了可視可讀之外, 基本程度已經退化到與hello world相去不遠         
除了佩服主管有那個用人的勇氣之外, 也是蠻佩服自己有這個勇氣說想去做這個專案的XD         
但總是不能真的兩手空空的就去新專案報到吧!!         
所以我買了一本書!!         

說來慚愧, 以前都靠老師的講義或是一些零散的文件或是google找答案         
這一次好像是我第一次想要有系統性的好好認識一個語言          
所以我買了Programming TypeScript的中文版：）        
想要好好唸唸書, 好好做一下筆記

# 為什麼選TypeScript
對啊, 第一行是說要會JavaScript, 但我卻買了TypeScript的書        
其實是因為雖然我也會弱型別的語言像是Python, 但工作這幾年接觸到production環境的案子還是C++居多        
所以一腳踏入更加奔放更加行雲流水的js的時候不免心慌慌        
在我看來TypeScript可以被當作是有型別的JavaScript, 對於看了強型別語言多年的我, 或許反而是個好的入門磚      

# 差在哪裡
所以js與tsc到底差在哪裡呢？      
除了TypeScript是可以有型別之外, 我的理解上TypeScript會做靜態語法檢查, 然後轉化成抽象語法樹(Abstract Syntax Tree, AST), 最後翻譯成JavaScript        
然而JavaScript是在轉化成AST之後就編譯成bytecode了, 所以如果有奇怪的錯誤, 可能要runtime才能發現, 而且或許還不會發現!?
這是書上提到的一個例子
```javascript {linenos=true}
let a = '3'
let b = 3
let c = 1
let d = a+b
let e = b+c
console.log(d)
console.log(e)
```
他會印出
```
33
4
```
對！當你把字串跟數字相加的時候, JavaScript會透過型別推定把他們視為字串的concate, 但如果是數字相加, 他就會如果想的給出4      
那如果是TypeScript, 他可以在合成JavaScript的時候幫我們做什麼事呢?        
首先讓我們為他加上個型別        
```typescript {linenos=table,hl_lines=["1-5"]}
let a : string = '3'
let b : number = 3
let c : number = 1
let d : number = a+b
let e : number = b+c
console.log(d)
console.log(e)
```
這時候他會告訴你
```
example.ts:4:5 - error TS2322: Type 'string' is not assignable to type 'number'.
```
嘿嘿, 所以這邊就不會得到一個被推定出來的33, 因為型別錯誤        
對我而言這樣的紀律會是一個入門的好主意        
所以接下來      
會有一些我學習TypeScript的小心得



