syms t
u = heaviside(t);
figure,
fplot(u,[-5 5]); %接受一个范围而不是一串向量

%% 
clear all
syms y t b
y = sin(t);
y2 = subs(y,t,t+b);
y2 = subs(y2,t,1);
y2 = subs(y2,b,4)

%%
%int(被积函数,积分变量,积分下限,积分上限)
clear all
syms f x y
f = -2*x/(1+x^2)^2
y1 = int(f,x);

%%
%卷积 conv(被卷积信号1,被卷积信号2,sign)
%sign='full' or 无参数: 全卷积
%sign='same'把信号2 截取成与被卷积信号1相同的长度
%'valid' 一旦任何信号碰到了彼此未定义的部分则直接无法计算 (信号不够长不补零)
clear all
x = [3,-1];
h = [-1,2,2];
y = conv(x,h)
figure 
stem(y);

%%
ny = 0:length(y)-1;
figure 
stem(ny,y);
xticks(ny);
%%

%如何保证卷积结果的下标正确?
%y的最大值等于x的最大值+h的最大值
%最小值等于x最小值_h最小值

clear all
h = [-1,2,2];
nh=[-3:-1]

x = [3,-1,1,2,2,2,1];
nx=[-2:4];
%下标运算向来如此
ny_min = nh(1)+nx(1);
ny_max = nh(end)+nx(end);
ny = ny_min:ny_max;

y = conv(h,x);
figure
stem(ny,y);

%%
%常微分方程
%dsolve(equation)
clear all
syms y(t) a
equation = diff(y,t) == a*y;
S = dsolve(equation);
%diff(y,t,2) 二阶导
equation = diff(y,t,90) == a*y;
%S = dsolve(equation);
%可以使用condition 来让c1 c2唯一确定
Dy = diff(y,t);
condition = [y(0)==1, Dy(0)==1];
S = dsolve(equation,condition);

%%

%ode 求解器

%[t,y] = ode45(待求解等式, 求解区间, 初始条件, 设置)
clear all
span = [0 5];
y0 = 0;
[t,y] = ode45(@(t,y)2*t,span,y0);
plot(t,y)
%%
%求解器可以求解 y' = xxxx的形式
%甚至可以求方程组
%y1' = xxxx & y2' = xxxxxx %%在这里y2是二阶导的意思 y1是一阶 
%对于ode45
%自定义方程输出的第一行默认是y(1)方程的导数
%自定义方程输出的第一行默认是y(2)方程的导数
%定义y(1)' = y(2) 让y(2)的方程变成y(1)的导数
%因此第二个方程相当于y(1)的二阶导 从此可列方程
clear all
[t,y] = ode45(@eqn,[0,2],[2,9]);
plot(t,y)
%%



function a = eqn(t,y)
    a = [y(2)+y(1)-t;(1-y(1)^2)*y(2)-y(1)]; %eqn必须返回列向量
end
function a = eqn1(t,y)
    a = [y(2)+y(3)]; %eqn必须返回列向量
end
