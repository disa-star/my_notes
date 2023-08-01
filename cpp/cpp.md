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

