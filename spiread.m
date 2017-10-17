% Usage example: spiread(5, 200, 'abc')

function string = spiread(com_num, sample_sec, sample_rate, savefilename, Adot, Bdot)

clc

global left_ascii
global plot_count
global savefile
global s 
global plotdata
global frame_count
global frame_dot
global sampleRate
global edgeAdot
global edgeBdot
edgeAdot = Adot;
edgeBdot = Bdot;
sampleRate = sample_rate;
left_ascii = [];
plot_count = 0;
frame_count = 0;
frame_dot = Adot*Bdot + 1;
plotdata = [];
savefile = savefilename;

global upperFlag
global middleFlag
global lowerFlag
global left1Flag
global left2Flag
global right1Flag
global right2Flag

upperFlag = 0;
middleFlag = 0;
lowerFlag = 0;
left1Flag = 0;
left2Flag = 0;
right1Flag = 0;
right2Flag = 0;

global picShow 
picShow = cell(8,2);
[none, ~, alpha_pic_none]     = imread('./pic7/none.png');
[upper, ~, alpha_pic_upper]   = imread('./pic7/upper.png');
[middle, ~, alpha_pic_middle] = imread('./pic7/middle.png');
[lower, ~, alpha_pic_lower]   = imread('./pic7/lower.png');
[left1, ~, alpha_pic_left1]   = imread('./pic7/left1.png');
[left2, ~, alpha_pic_left2]   = imread('./pic7/left2.png');
[right1, ~, alpha_pic_right1] = imread('./pic7/right1.png');
[right2, ~, alpha_pic_right2] = imread('./pic7/right2.png');
picShow{1,1} = none;    picShow{1,2} = alpha_pic_none;
picShow{2,1} = upper;   picShow{2,2} = alpha_pic_upper;
picShow{3,1} = middle;  picShow{3,2} = alpha_pic_middle;
picShow{4,1} = lower;   picShow{4,2} = alpha_pic_lower;
picShow{5,1} = left1;   picShow{5,2} = alpha_pic_left1;
picShow{6,1} = left2;   picShow{6,2} = alpha_pic_left2;
picShow{7,1} = right1;  picShow{7,2} = alpha_pic_right1;
picShow{8,1} = right2;  picShow{8,2} = alpha_pic_right2;
ShowStrikePosition(none, alpha_pic_none)
clear none upper middle lower left1 left2 right1 right2
clear alpha_pic_none alpha_pic_upper alpha_pic_middle alpha_pic_lower alpha_pic_left1 alpha_pic_left2 alpha_pic_right1 alpha_pic_right2

com = ['COM', num2str(com_num)];
try
    s = serial(com);
catch
    error('wrong serial');
end

set(s,'BaudRate', 115200,'DataBits',8,'StopBits',1,'Parity','none','FlowControl','none');
s.BytesAvailableFcnMode='byte';   %设置事件触发为接受触发
s.InputBufferSize = 4016*32;    %设置接受缓冲区大小为5000个字节
s.BytesAvailableFcnCount = frame_dot;    %每次接受到50个数据时候触发事件
%根据经验，缓冲区太小，串口传输容易出错。


% s.BytesAvailableFcn = @callback_save_ascii;   %指向触发事件函数
% s.BytesAvailableFcn = @callback_singledot; 
% s.BytesAvailableFcn = @callback; 
s.BytesAvailableFcn = @callback_kickboxing; 

fopen(s);
string = 'running';
% tic
% pause(sample_sec);  
% fclose(s);  
% delete(s);  
% clear s  
% toc