%北京时转世界时
%时区差8
%例如要将北京时“2018年1月1日4时”转化为世界时
%输入y=BJ2UTC([2018 3 1 14])
%将返回字符串型世界时“2018030106”给变量y
function y=BJ2UTC(time)%输入参数为“年、月、日、时”数值型数组，输出变量为“年、月、日、时”字符串数组,格式“yyyymmddtt”
if time(4)>=8%当当前时间北京时和世界时在同一天时
    time(4)=time(4)-8;
else%当当前时间世界时在北京时的前一天
    if time(2)==1&time(3)==1%跨年
        %元旦的前一个月为去年12月
        time(1)=time(1)-1;
        time(2)=12;
        time(3)=eomday(time(1),time(2));%反回该月最后一天，返回值为数值（此处即去年12月的最后一天，数值为31）
        time(4)=24-(8-time(4));
    elseif time(2)~=1&time(3)==1%跨月
        %非元月的各月第一天的前一天为上一个月的最后一天
        time(2)=time(2)-1;
        time(3)=eomday(time(1),time(2));%反回该月最后一天，返回值为数值（此处即上个月的最后一天）
        time(4)=24-(8-time(4));
    else%同月
        time(3)=time(3)-1;
        time(3)=24-(8-time(4));
    end
end
%返回字符串型世界时
yyyy=num2str(time(1));
if time(2)<10
    mm=['0',num2str(time(2))];
else
    mm=num2str(time(2));
end
if time(3)<10
    dd=['0',num2str(time(3))];
else
    dd=num2str(time(3));
end
if time(4)<10
    tt=['0',num2str(time(4))];
else
    tt=num2str(time(4));
end
y=[yyyy mm dd tt];
end
