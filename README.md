# template
my latex template and some relevant meterial. 我的latex模板和相关素材


## Known issues 已知的问题

### the content overlap 目录重叠
In `myreport.cls` line 506,toggle this comments
在`myreport.cls` 506行,去掉以下部分的注释
```latex
% % 防止目录重叠 https://www.latexstudio.net/archives/7986.html
% \makeatletter
% \renewcommand{\numberline}[1]{%
% \settowidth\@tempdimb{#1\hspace{0.15em}}%
% \ifdim\@tempdima<\@tempdimb%
% \@tempdima=\@tempdimb%
% \fi%
% \hb@xt@\@tempdima{\@cftbsnum #1\@cftasnum\hfil}\@cftasnumb}
% \makeatother
```
