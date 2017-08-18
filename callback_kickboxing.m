function callback_kickboxing(obj, ~) 

global out_ascii
global left_ascii % �Ӵ��ڶ�ȡ��һ��������֡�����µĲ���
global plot_count
global savefile
global frame_count
global frame_dot
global sampleRate
global edgeAdot
global edgeBdot

global picShow 

global upperFlag
global lowerFlag
global left1Flag
global left2Flag
global left3Flag
global right1Flag
global right2Flag
global right3Flag

flag = [upperFlag,lowerFlag,left1Flag,left2Flag,left3Flag,right1Flag,right2Flag,right3Flag];

dataSaveFlag = false;
strikeThreshold = 1000;


freshNumPerSec = 8; %��ͼʱÿ��ˢ�´���
plotCountTres = floor(sampleRate/freshNumPerSec);


readCount = frame_dot;
out_ascii = fread(obj, readCount, 'uint8'); %ascii

% ����ԭʼascii������
% fid=fopen([savefile, '_ascii.txt'],'a+'); 
% fprintf(fid,'%3d ',out_ascii); 
% fclose(fid); 

% history = [history; out_ascii];
out_ascii = out_ascii';
out_ascii = [left_ascii, out_ascii];

%ɾ���س���
loc10 = find(out_ascii == 10);
for j=length(loc10):-1:1
    out_ascii(loc10(j)) = [];
end


loc13 = find(out_ascii == 13); %�ҵ����з������з�����֡���ݵķָ������з������ж����
if isempty(loc13)              %���޻��з���˵����ǰ֡δ�������
    left_ascii = out_ascii;
else                           %���л��з���˵����ǰ֡�������
    left_ascii = out_ascii(loc13(end)+1 : end);
    
    
    for j = 0:length(loc13)-1
        
        if j == 0
            frame_ascii = out_ascii(1:loc13(1)-1);%��һ֡
        else
            frame_ascii = out_ascii(loc13(j)+1 : loc13(j+1)-1);%��һ֡�����֡
        end
        
        while frame_ascii(1) == ','
            frame_ascii(1) = [];
        end
        while frame_ascii(end) == ','
            frame_ascii(end) = [];
        end
        frame_char = char(frame_ascii);
        frame_cell = regexp(frame_char, ',', 'split');
        frame_num = str2double(frame_cell);
        
        
        if length(frame_num) == frame_dot %��ʼ����ʱ������
            frame_count = frame_count + 1;
%             display(['frame count:',num2str(frame_count), '    frame length: ',num2str(length(frame_num))])
            
            plot_count = plot_count+1;
            if plot_count == plotCountTres
                frame = frame_num(1:frame_dot-1);            
                data = reshape(frame, edgeAdot, edgeBdot);    
%                 bar3(data)
%                 axis([0 edgeAdot+1 0 edgeBdot+1 0 4096])  
                strike = data(1,:);
                newFlag = ShowStrike(strikeThreshold, strike, flag, picShow);                
                upperFlag = newFlag(1);
                lowerFlag = newFlag(2);
                left1Flag = newFlag(3);
                left2Flag = newFlag(4);
                left3Flag = newFlag(5);
                right1Flag = newFlag(6);
                right2Flag = newFlag(7);
                right3Flag = newFlag(8);
                
%                 stem(data(1,:))
%                 axis([0 10 0 4096])
                plot_count = 0;
            end
            
            if dataSaveFlag
                fid = fopen([savefile, '.txt'], 'a+'); 
                fprintf(fid,'%3d ',frame_num); 
                fclose(fid); 
            end
        else 
            nan_count = 0;
            for h = 1:length(frame_num)
                if isnan(frame_num(h))   
                    nan_count = nan_count + 1;
                end
            end
            display(['nan count: ',num2str(nan_count),'   frame length: ',num2str(length(frame_num)), '---'])
        end
    end
end   
end


%  ���s.BytesAvailableFcnCount < fread(obj,readCount,'uint8')�е�readCount��
%  ��ô��������ֻ��s.BytesAvailableFcnCount������ʱ���ᵼ�¶��������ݡ�