---
title: Is it DevOps?你這樣DevOps嗎?
date: 2020-01-09
hero: "/images/hero-3.jpg"
excerpt: A story describes a waterfall team adopting DevOps toolchain and midset. 敘述一個瀑布式開發團隊想要轉型DevOps的故事。
authors:
- Vincent Chang

---
Recently our team talks about DevOps transformation. Sometimes we joke ourselves about how we work currently by “Is it DevOps?”. Sometimes we seriously ask ourselves how to do the right things by “Is it DevOps?”. I would like to write something about what I think.

最近我們部門在討論有關DevOps轉型的話題，流行語就是『你這樣做有DevOps嗎？』當然，有時候是帶點戲謔的語氣質疑現在的作法，但有時候我們是認真想知道怎麼做比較好。在這裡，我想以我的觀點來記錄這件事情。

When you open your version control system, you may realize how your project becomes to this kind of structure today from the history logs. You may not be able to say those contributors made a mistake in the past years since they just made the best decision at that moment. But, maybe it is a good time for you to try something big to make a twist today!

攤開版本控制系統，爬梳那些前人們貢獻的歷史，你會覺得演變成今天的工作模式並不是意外。但也不能斷言過往的做法就是錯的，因為這是每個當下最適合做法的累積，只能說當時間成熟了，或許你也可以嘗試一些比較大的改變。

In the past, we released our new version product to our customers once a year. While more and more request comes from the customer side, the annual release already unable to react to the fast-changing world. The executive starts to ask your team to release faster than before and even release more versions at the same time. They also ask you to transform as a DevOps team. While the DevOps is not a new idea to the software development world, but it comes to many difficulties for us to turn into a DevOps organization from a waterfall project. In my opinion, the toolchain is the most natural thing in every kind of change. This series of articles goes to describe how an aged project with a lot of legacy code starts to use a modern version control system and release flow.

因為時代在變，以前一年發佈一個新版本的模式逐漸無法面對劇烈改變的市場，於是上層開始要求開發團隊能有更快速的發佈，甚至同時能有不同產品線的發佈。DevOps不是新的概念，但對於我們這種瀑布式開發的專案而言，因為工具鏈的成熟，要向DevOps的路線靠攏，相較前幾年又更容易一點，因此我們希望能夠對於面臨的各種問題做出一些比較大的改變！使用工具的改變儘管已是牽一髮而動全身，但往往比改變做事方法來的容易。這系列的文章會描述如何讓一個具有歷史包袱的大型專案轉型使用主流版控工具與生產工具的過程。

# Will legacy things only in legacy code?
Let me just use our project as an example. GitHub is the third version control system in our team. In the past 20 years, no one could predict that we become this kind of product today. If we just count the lines of code in our project, it almost equal to a Windows XP, and it does not include the content that we integrated from other projects. We need to face many problems in such a massive project, for example,
1. We have to integrate other projects by using their binary files from other project teams. In the past, we were a small project, and it is not a problem to commit those binary files into a version control system directly. However, it would be a big problem if you have GBs binary files inside your version control system because they cannot compare for the difference.
2. With #1, it would be a disaster if you used a distributed version control system and you did a clone behaviour.
3. For different release purposes, the easiest method is to create separate branches. But how to synchronize between different branches is another problem.
4. If your version control system does not support code review flow, how to do code review rely on team member themselves. The quality of code is a problem, but another problem is that something just understands by someone.
# 技術債只在程式碼本身嗎？
以我們的專案而言，目前所採用的GitHub已經是團隊所採用的第三套版控系統了！整個專案的歷史至少二十年，二十年間來來去去的前輩們或許都想不到專案演變至今會是這樣的規模。若單就以程式碼的行數做計算，我們的專案現今的規模大概等於當時的一套Windows XP！這還不包括從其他專案整合而來的不同模組們的程式碼內容。如此龐大而複雜的程式碼自然在專案的產出上陸續面臨一些挑戰，例如
1. 為了整合其他部門的產出，我們的產品中需要引用大量的binary files。光是管理這好幾GB的binary files本身就是一種很大的問題，過往專案規模不大的時候尚可直接提交到版控系統中，但日子久了，大量無法被diff的檔案對於版控系統是一種負擔。
2. 同第一點，若是此時是採用分散式的版控系統，可能連新人如何clone都是一個問題！
3. 為了同時應付不同產品線的需求，最簡單的方法就是開分支然後做對應的發佈，於是如何同步不同產品線之中的內容是一個問題，開分支的容易與否又是另一個問題。
4. 若版控系統不支援程式碼審查，提交程式碼前是否該交付審查便只能自由心證或是倚靠團隊紀律。在這樣的狀況下，程式碼本身的質量或許是一個問題，但專案中是否存在只有某某某才知道的內容其實也是一個問題。
# I don’t touch it because it is not my profession?
Conway’s Law told us how many people contribute to the project, how many different stages in the project. For example, two people contribute to the same feature, and the feature has one interface and two corresponding implementations. There is no one telling that Cowy effect is bad or good, and it is just telling you that it is easy to happen in cross-team collaboration.

However, does Conway’s Law only happen in software implementation? Let me use our project as an example again. In the past, our development team focused on new feature development, and the sustain team focused on sustained. There is another operation team that helps us produce our product with a standard build flow. To reduce communication effort, you can find many workarounds in our build scripts.p, for example,
1. We wrote everything’s in a build script and we have someone to investigate in logs with build failure.
2. We do not control the build flow, and it was hard to know how to make it better.
Fortunately, the operation team brought a self-service concept a few years ago. We started able to do something customized. The operation team provides us with a lot of tools, and we can build our flow for our product. The new working model offers an opportunity to make us review our release flow.
1. With new flow, we optimized the time to get a new release build, and it reduces almost 50% time cost than before.
2. With new flow, we can release more experimental features in-house and think twice before merging. In the past, we may choose not to do it due to the impact is not easy to measure. It encourages us to do more research and enhancement.
# 專業化分工不是誰只能做什麼
康威定律的基本精神是說，專案經由分工完成，那麼專案的架構也和分工的方法產生關聯。一個專案由兩個團隊合作，通常就會有一個溝通介面與兩邊分別對應的實作。這沒有說一定好或一定不好，只要是跨團隊的合作，這應該就很難避免。

但這只在軟體實作上發生嗎？以我們專案為例，過往開發部門專注開發，維運團隊專責維運，生產單位負責為不同團隊提供的『標準廠房』，為了避免麻煩，不同團隊間各種不同的workaround應運而生。
1. 為了符合標準廠房的模式，我們在一個build script當中塞入大量的步驟，當錯誤發生的時候就仰賴人工分析海量的log去解決。
2. 因為開發團隊不負責標準廠房的管理，自然也對於生產過程的優化也有些力不從心。
幸好，我們的生產團隊在幾年前便提出客製化廠房的自助式服務，開發團隊開始有機會將生產過程客製化成更合適自己的樣子。以我們專案為例，開發團隊負責在大框架底下搭建自己的生產環境，由生產團隊則提供不同的工具為開發團隊提供支援。新的合作模式讓我們有更多的機會去審視目前的發布流程，
1. 因為開發團隊對生產過程有更多的掌握，我們優化了近50%的生產時間。
2. 因為新的發布流程，我們可以產出更多的實驗室作品，而且我們可以在分支上進行更多的測試再決定是否要整合到正式的程式碼當中。變相的鼓勵大家做更多的研究與嘗試。
# Change and Challenge
What always going to happen is that you solve a problem A, but create a problem B., But you may get some valuable experience during change and facing a challenge. So, let us ask our selves,
1. Do we solve all the problems with the new toolchain?
2. Is there any special consideration in adopting new tools?
3. So we get more problems?

I will introduce more things about what we did and what we learned in the following articles.
# 改變與挑戰
事情通常是這樣，你解決了A問題，但你卻也製造了B問題。不過在過程中可以肯定的是你學到了一些寶貴的經驗。所以我們不禁也該問自己
1. 轉變就能解決所有問題嗎？
2. 轉變的過程是什麼呢？
3. 難道不會迎來新的問題嗎？

我會在接下來的文章介紹更多這部分的心得！