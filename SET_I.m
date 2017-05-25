% SET_I
% 设置文件和参数

filedir='./DATA/';                      % 指定文件路径
filename='demo2.wav';               % 指定文件名
fle=[filedir filename]                  % 构成路径和文件名的字符串

% 设置分帧参数
wlen=200; inc=80;
% 设置信噪比
SNR = 5;
SNR_flag = false;
% 设置消除趋势项的参数
m = 3;
m_flag = false;
% 设置滤波参数
fp = 500; fs1 = 750;
Fs = 8000; Fs2 = Fs/2;
Wp = fp/Fs2; Ws = fs1/Fs2;
Rp = 3; Rs = 50;
filter_flag = false;