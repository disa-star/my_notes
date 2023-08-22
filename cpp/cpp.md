泛型编程:  
一个程序可以对多种数据类型的输入起效

![Alt text](image.png)

### in unix

>CC xxx.cpp  
>生成 xxx.o

接着编译器将目标代码文件'xxx.o'传给**系统链接程序**  
此程序将代码和库代码结合  
并生成一个可执行文件默认为`a.out`

同样 如果有多个源代码 则

>CC 1.cpp 2.cpp

存在多个源代码文件时  
.o文件不会被自动删除 

此时如果修改了`1.cpp`  
则可以直接

![Alt text](image-1.png)

(这是为什么)

>CC 1.cpp 2.o

### in linux

>g++ 1.cxx

![Alt text](image-2.png)

(这是为什么)

直接生成a.out

同样支持

>g++ 1.o 2.cxx

>创建好项目后，需要对程序进行编译和链接。IDE通常提供了多个菜单项，如Compile（编译）、Build（建立）、Make（生成）、BuildAll（全部建立）、Link（链接）、Execute（执行）、Run（运行）和Debug（调试），不过同一个IDE中，不一定包含所有这些选项。



>- Compile通常意味着对当前打开的文件中的代码进行编译。
>- Build和Make通常意味着编译项目中所有源代码文件的代码。这通常是一个递增过程，也就是说，如果项目包含3个文件，而只有其中一个文件被修改，则只重新编译该文件。
>- Build All通常意味着重新编译所有的源代码文件。
>- Link意味着（如前所述）将编译后的源代码与所需的库代码组合起来。
>- Run或Execute意味着运行程序。通常，如果您还没有执行前面的步骤，Run将在运行程序之前完成这些步骤。
>- 编译器可能让您选择要生成调试版还是发布版。调试版包含额外的代码，这会增大程序、降低执行速度，但可提供详细的调试信息。

有些闪退的IDE在查看输出的时候要使用:

![Alt text](image-3.png)

因为`cin.get()`负责读取下一次 键盘输入

## 2章

```
#include <iostream>

std::cout

```

和下面等效

```
#include <iostream.h>

cout

```

既可以

```
using namespace std;

```

或者

```
using std::cout

```

赋值连续使用

```
a = b = c = 2
```

2赋给c  
c的值赋给b  
b赋给a

```
printf('%s',"25")
printf('%d',25)
```

![Alt text](image-4.png)

函数原型和函数声明的不同之处:
- 函数原型规定了接受的输入和输出 使编译器知道如何检查函数的使用
- 函数声明真正负责实现函数的功能

函数原型以分号结束  
而函数声明需要大花括号

![Alt text](image-5.png)



这样使用using:

```
int main(){
    using namespace std;
    ...
}
```
可以只在main 内使用名称空间

sizeof 运算符(?)

`sizeof a` 会变成 a 的长度  
而对类型使用sizeof的时候应该要`sizeof (int)` (?)   

无符号类型

```
unsigned int a #无符号整型
unsigned a #同样无符号整型

```

![Alt text](image-6.png)

使用cout输出不同进制的数字  
在此处  
hex相当于传入cout的消息, 并且hex 是 std::hex  
因此在using之后  
hex不能作为变量名

并且, cout 将输入流中的数字默认存储成int  
使用
```

cout << 2022UL;
```
表示要存成 unsigned long  
被称为后缀, 同样使用ULL 可以存成unsigned long long

unsigned int 比较适合用来表示地址

cin和cout都会根据数据类型去转换输入->存储和 存储->输出

C++对字符使用单引号  
对字符串使用双引号

cout也可以同时处理字符串和字符  
同样, `cout.put()` 可以只输出一个字符

char  
char就是表示一个字节  
因此char有无符号特别重要  
可以用signed char 和 unsigned char 显式指定  
如果直接char就都有可能

宽字符集  
用 wchar_t 来申明宽字符  
宽字符可能在不同的系统上有不同的表现 (2字节 or 4字节)   
在这种情况下  
cin 和 cout 将输入视作 char 流  
因此不适用 wchar_t 类型  
而iostream 提供了 wcout 和 wcin 为了处理这种

类似的  
char16_t 长16位无符号  
char32_t 长32为无符号  

```
wchar_t a = L'P'; //L指示存储为宽字符
char16_t a = u'P'; // u指示存储为16位
char32_t a = U'P';

```

```
bool a = true;
bool a = -100; //都会让 a 成为 true

int b = true; //让 b 变成 1



```

const 加在任何变量申明前 申明的变量是不可修改的

```
//拒绝这样做
const int a;
a = 2; //太晚啦

//应该这样
const int a = 2;

```

`7.2e+15` 这是 e 表示法

浮点类型  
float 32位  
double 64位  
long double 80 96 或者是 128 位   

可以更改 `cfloat.h` 中的内容来改变 浮点数的有效位数(?)

```

std::cout.setf(ios_base::fixed, ios_base::floatfield); //固定浮点
// 这句话让cout不会删除掉输出末尾的 0 
```

```
1.2f //属于float
1.2F //float
1.2 // double
1.2L //long double

```

如果在除法的时候  
两个操作数都是整数 则cpp执行整数除法  
有任何一个是浮点数就执行浮点除法  

同样
```
1.2 / 2.3 //double 除法
1.2f / 2.3f //float 除法
1.2L / 2.3L //long 除法
```

如果把一个short赋值给long  
则会将short扩展 变成long  

反之将long赋值给short  
则会只赋值低几位  

将浮点赋值给整型会出现问题  
一个是小数部分会被截断  
并且可能浮点对整型太大了  
没有规定编译器应该对这种情况做出什么

不允许缩窄转换  
```
long = {int} //可以因为保留了所有信息
int = {long} //不可以

```

![Alt text](image-7.png)

![Alt text](image-8.png)

强制类型转换 `long (a)`

```
(long) a //创建一个新的变量类型long 值为a的
long (a)  //同上

//或者是
static_cast<long> a //也可以, 但是要求更加严格


```

数组

`short a[10]`

使用`sizeof a` 可以得到 类型 \* 数组长度 的占空间  
`sizeof a[0]` 返回 类型所占字节数   
`int cards[3] = {20, 30, 5};`来赋值  
