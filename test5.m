% test5
% 测试信噪比为5dB的语音信号的端点检测

clear all; clc; close all;
addpath(genpath(pwd));

filedir = './DATA/'; 
filename = 'bluesky1.wav';
fle = [filedir filename];
[x, fs] = audioread(fle);
x = Gnoisegen(x,5);

x = x/max(abs(x));
N = length(x);
time = (0:N - 1)/fs;
pos = get(gcf,'Position');
set(gcf, 'Position', [pos(1), pos(2)-100, pos(3), (pos(4)-200)]);
plot(time, x, 'k');
title('信噪比为5dB的端点检测');
ylabel('幅值'); axis([0 max(time) -1 1]); grid;
xlabel('时间/s');
wlen = 200; inc = 80;
IS = 0.1; overlap = wlen - inc;
NIS = fix((IS * fs - wlen)/inc + 1);
fn = fix((N - wlen)/inc) + 1;
frameTime = frame2time(fn, wlen, inc, fs);
[voiceseg, vsl, SF, NF] = vad_ezrm(x, wlen, inc, NIS);

for k = 1 : vsl
    nx1 = voiceseg(k).begin; nx2 = voiceseg(k).end;
    nxl = voiceseg(k).duration;
    fprintf('%4d    %4d    %4d    %4d\n', k, nx1, nx2, nxl);
    line([frameTime(nx1) frameTime(nx1)], [-1.5 1.5], 'color', 'k', 'LineStyle', '-');
    line([frameTime(nx2) frameTime(nx2)], [-1.5 1.5], 'color', 'k', 'LineStyle', '- -');
end