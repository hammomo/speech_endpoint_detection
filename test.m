%
% test
clear all; clc; close all;
run SET_I
run PART_I

pos = get(gcf,'Position');              % 作图
set(gcf,'Position',[pos(1), pos(2)-100,pos(3),(pos(4)-200)]);
plot(time,x,'k'); 
title('失败的自录语音端点检测');
ylabel('幅值'); axis([0 max(time) -1 1]); grid;
xlabel('时间/s');
run PART_II
[voiceseg,vsl,SF,NF]=vad_ezm1(x,wlen,inc,NIS);  % 端点检测

for k=1 : vsl                           % 画出起止点位置
    nx1=voiceseg(k).begin; nx2=voiceseg(k).end;
    nxl=voiceseg(k).duration;
    fprintf('%4d   %4d   %4d   %4d\n',k,nx1,nx2,nxl);
    line([frameTime(nx1) frameTime(nx1)],[-1.5 1.5],'color','k','LineStyle','-');
    line([frameTime(nx2) frameTime(nx2)],[-1.5 1.5],'color','k','LineStyle','--');
end
