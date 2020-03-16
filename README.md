# InfectStatisticWeb
结对第二次作业

作业的运行环境为win10系统，因为本身是一个javaEE项目，所以需要eclipse编译器，Tomcat服务器，

在eclipse编译器上新建一个名为InfectStatisticWeb的Dynamic Web Project项目



![1](C:\Users\lenovo\Desktop\1.jpg)



项目建好后如图所示：

![2](C:\Users\lenovo\Desktop\2.png)





本次作业需要用到的文件主要有backend目录下的所有java文件，css目录下的所有css文件，js目录下的所有js文件，index.jsp、statistics.jsp文件，以及助教提供的部分疫情日志log目录



将backend目录放到Java Resources下src下，如图所示：

![3](C:\Users\lenovo\Desktop\3.png)



将css目录、js目录、index.jsp、statistics.jsp放到WebContent目录下，如图所示：

![4](C:\Users\lenovo\Desktop\4.png)



然后需要进入到Entry.java、Interface.java、index.jsp、statistics.jsp这四个文件中，将变量path改为自己电脑目录下日志目录的绝对路径，因为不同电脑日志目录所放的位置不同，所以一定要根据自己电脑下的路径修改path这个字符串（例如“C:\\\Users\\\lenovo\\\Desktop\\\部分疫情日志log”），如果这四个文件里的path路径没有写对，将因为无法访问到日志目录而无法运行程序

![6](C:\Users\lenovo\Desktop\6.png)



![5](C:\Users\lenovo\Desktop\5.png)





修改好所有的path后，点击eclipse编译器上的运行按钮，运行index.jsp这个文件，将会在编译器自带的浏览器中打开。因为eclipse自带的编译器功能不够强大，所以需要用另外的浏览器，比如谷歌浏览器火狐浏览器，输入运行index.jsp的路径（例如：http://localhost:8080/InfectStatisticWeb/index.jsp）即可在浏览器上展示作业

![7](C:\Users\lenovo\Desktop\7.png)



## 注：一定要根据自己电脑上日志目录路径修改好Entry.java、Interface.java、index.jsp、statistics.jsp这四个文件里的path路径，否则无法访问到日志目录而无法运行程序！切记！！！

