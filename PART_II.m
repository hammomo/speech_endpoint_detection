% PART_II

IS=0.1; overlap=wlen-inc;               % 设置IS
NIS=fix((IS*fs-wlen)/inc +1);           % 计算NIS
fn=fix((N-wlen)/inc)+1;                 % 求帧数
frameTime=frame2time(fn, wlen, inc, fs);% 计算每帧对应的时间