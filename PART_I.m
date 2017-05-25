% PART_I
% 读入语音信号并叠加随机噪声并进行语音信号预处理

[x,fs] = audioread(fle);
if SNR_flag
    x=Gnoisegen(x,SNR);                 % 叠加信噪比用于测试
end
x=x/max(abs(x));
N=length(x);
time=(0:N-1)/fs;
if m_flag
    [x,xtrend]=polydetrend(x,fs,m);     % 消除趋势项
end
if filter_flag
    [n, Wn] = cheb2ord(Wp, Ws, Rp, Rs);
    [b, a] = cheby2(n, Rs, Wn);
    x = filter(b, a, x);                % 滤波
end