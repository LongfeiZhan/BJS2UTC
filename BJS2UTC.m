%����ʱת����ʱ
%ʱ����8
%����Ҫ������ʱ��2018��1��1��4ʱ��ת��Ϊ����ʱ
%����y=BJ2UTC([2018 3 1 14])
%�������ַ���������ʱ��2018030106��������y
function y=BJ2UTC(time)%�������Ϊ���ꡢ�¡��ա�ʱ����ֵ�����飬�������Ϊ���ꡢ�¡��ա�ʱ���ַ�������,��ʽ��yyyymmddtt��
if time(4)>=8%����ǰʱ�䱱��ʱ������ʱ��ͬһ��ʱ
    time(4)=time(4)-8;
else%����ǰʱ������ʱ�ڱ���ʱ��ǰһ��
    if time(2)==1&time(3)==1%����
        %Ԫ����ǰһ����Ϊȥ��12��
        time(1)=time(1)-1;
        time(2)=12;
        time(3)=eomday(time(1),time(2));%���ظ������һ�죬����ֵΪ��ֵ���˴���ȥ��12�µ����һ�죬��ֵΪ31��
        time(4)=24-(8-time(4));
    elseif time(2)~=1&time(3)==1%����
        %��Ԫ�µĸ��µ�һ���ǰһ��Ϊ��һ���µ����һ��
        time(2)=time(2)-1;
        time(3)=eomday(time(1),time(2));%���ظ������һ�죬����ֵΪ��ֵ���˴����ϸ��µ����һ�죩
        time(4)=24-(8-time(4));
    else%ͬ��
        time(3)=time(3)-1;
        time(3)=24-(8-time(4));
    end
end
%�����ַ���������ʱ
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
