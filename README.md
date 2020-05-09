<div align="center"> <font size="6" color="black"><strong></strong>汇编DOS-BOX操作指令</font> </div>

* 在dosbox中输入debug进入debug模式
* r：查看寄存器值
* r cs：修改代码段寄存器值
* r ip：修改偏移地址值
* t：执行当前cs:ip指向的指令
* d 1000:0-查看段地址1000，偏移地址0000指向的内存的内容
* a：向当前内存中写入汇编指令mov ax,1234
* e 1000:0-修改段地址1000，偏移地址0000指向的内存的内容
* u：将内存中的内容解释为汇编语言
* CS寄存器：代码段寄存器(Code Segment)，用来存放内存代码段入口基地址
* IP寄存器：指令指针寄存器(Instruction Pointer)
* DS寄存器：存放要访问数据的段地址-操作：通过mov bx,1000H  mov ds bx来实现将数据放入ds寄存器中，从而修改为想要的段地址值
* SS寄存器：存放栈的段地址
* SP寄存器：存放栈的偏移地址
* BP寄存器：基数指针寄存器BP(base pointer)是一个寄存器，它的用途有点特殊，是和堆栈指针SP联合使用的，作为SP校准使用的，只有在寻找堆栈里的数据和使用个别的寻址方式时候才能用到。比如说，堆栈中压入了很多数据或者地址，你肯定想通过SP来访问这些数据或者地址，但SP是要指向栈顶的，是不能随便乱改的，这时候你就需要使用BP，把SP的值传递给BP，通过BP来寻找堆栈里数据或者地址．一般除了保存数据外,可以作为指针寄存器用于存储器寻址,此时它默认搭配的段寄存器是SS-堆栈段寄存器.BP是16位的,再扩充16位就是EBP,用于32位编程环境的.一般高级语言的参数传递等等,转换为汇编后经常由BP/EBP来负责寻址\处理.
* g：g 0012 执行指令到偏移地址0012h处
* p：Debug自动重复执行loop中的指令直至(cx)=0

## 汇编指令

* inc 自加
* dec 自减
* jcxz cx=0发生无条件跳转
* loop cx≠0跳转到循环标号处

![image-20200327234027452](https://i.loli.net/2020/05/09/oC9KWmfQDgVYXRv.png)

![image-20200328001508002](https://i.loli.net/2020/05/09/pWUZJziaqLg9jmR.png)

* 栈

![image-20200328230026899](https://i.loli.net/2020/05/09/LlXRTn3tIvq4wou.png)

![image-20200328002336172](https://i.loli.net/2020/05/09/W28HnN3hIxUwlmJ.png)

![image-20200328225828130](https://i.loli.net/2020/05/09/yJgilm6bz5aQR8r.png)

![image-20200328231223460](https://i.loli.net/2020/05/09/3S8t2AdVkhIJeaC.png)

![image-20200328231355282](https://i.loli.net/2020/05/09/BqvwrlPao4dQ39W.png)

> Debug的T命令在执行修改寄存器SS的指令时，下一条指令也紧接着被执行，这是由于中断机制

![image-20200329224556834](https://i.loli.net/2020/05/09/LSQAiBXgYN6ZIKW.png)

![image-20200329224640651](https://i.loli.net/2020/05/09/BaNV7i8t21jIApU.png)

## [bx]和loop指令

* [bx]指令

![image-20200330105932021](https://i.loli.net/2020/05/09/XChW5NMEOKt2pH8.png)

* loop指令

和循环有关

* ()符号

![image-20200330110323765](https://i.loli.net/2020/05/09/9ZClmALnp8hRDrd.png)

![image-20200330110355377](https://i.loli.net/2020/05/09/1Xfi49wsxo3rcO5.png)

![image-20200330110711723](https://i.loli.net/2020/05/09/OejGKM8Ip7awBy9.png)

![image-20200330110748322](https://i.loli.net/2020/05/09/MuiwPU4AkCGHK6d.png)

* 约定符号idata表示常量

![image-20200330110917300](https://i.loli.net/2020/05/09/DQqWGtbO5J8AwXr.png)

### Loop指令

* 计算2^11

<img src="https://i.loli.net/2020/05/09/YUhi7ebOtaDE2zV.png" alt="image-20200330175724137" style="zoom: 67%;" />

![image-20200330175856799](https://i.loli.net/2020/05/09/kIxwDjpZSLfe5aU.png)

![image-20200330180012743](https://i.loli.net/2020/05/09/s3lOSU4HrRuC7Vn.png)

![image-20200330180138624](https://i.loli.net/2020/05/09/ehmGH5NwJYIT2DV.png)

![image-20200330182749083](https://i.loli.net/2020/05/09/laEKCgjMdf4JThX.png)

![image-20200330184950615](https://i.loli.net/2020/05/09/nCNDblazkopKBuf.png)

![image-20200330221727376](https://i.loli.net/2020/05/09/Tl598RpjAcEeMD7.png)

* 对比汇编源程序与debug对mov ax,[1]等指令的区别

debug中mov ax,[1]指的是将ds:[1]内存的内容送进ax中，不用显式给出ds段地址

![image-20200330222458986](https://i.loli.net/2020/05/09/tmUnvdLTByZDKc2.png)

![image-20200330222734858](https://i.loli.net/2020/05/09/RxdC1hIMvYJXZfB.png)

![image-20200330222818731](https://i.loli.net/2020/05/09/AUgSbIGydZe14nr.png)

* loop和[bx]的联合应用

![image-20200330223057724](https://i.loli.net/2020/05/09/SH8WZ5n4ATdvfxc.png)

![image-20200330225811870](https://i.loli.net/2020/05/09/mRnF2BlK1UkVp78.png)

![image-20200330230329878](https://i.loli.net/2020/05/09/NOzMkH7JPFDiV3I.png)

## 第6章包含多个段的程序

![image-20200330235932035](https://i.loli.net/2020/05/09/RCSjqPDOLotmnGQ.png)

![image-20200331000222303](https://i.loli.net/2020/05/09/dE2sB6IzU3NvWV9.png)

![image-20200331000300011](https://i.loli.net/2020/05/09/c46PRXzl1GeMW9i.png)

![image-20200331000327232](https://i.loli.net/2020/05/09/hs6Bfg7RPDOETH2.png)

> end除了通知编译器程序结束以外，还通知编译器程序的入口子哪，用end指明程序的入口在start标号处，end start被转化为一个入口地址

![image-20200331001714792](https://i.loli.net/2020/05/09/GdKhtIs9FBNkzUn.png)

* 多个段

![image-20200331001938176](https://i.loli.net/2020/05/09/jtakibuq3mFIcMz.png)

![image-20200331002028462](https://i.loli.net/2020/05/09/NrdyZw5P7ICS98v.png)

![image-20200331002052549](https://i.loli.net/2020/05/09/7PKij3eRFagMroT.png)

![image-20200331002527542](https://i.loli.net/2020/05/09/NaLKhvm3irIDtkF.png)

## 第7章更灵活的定位内存地址的方法

* and和or指令：按位与和按位或

![image-20200331230850572](https://i.loli.net/2020/05/09/SDOxWvp8yeEPlBG.png)

* ASCII：'a'表达为61H(01100001B)，'A'表达为41H(01000001B)；大写字母的ASCII二进制表达的第5位上为0，小写字母第5位为1，这是大小写字母在位级表达的唯一不同的地方。可以通过and或or指令将特定的为置0或者置1来进行大小写字母的转换。
* 以字符形式给出数据：在汇编程序中以'......'明确表达是以字符形式给出，编译器将字符形式转化为ASCII

<img src="https://i.loli.net/2020/05/09/IRfyrtO6ASWv4wl.png" alt="image-20200331231526797" style="zoom: 50%;" />

<img src="https://i.loli.net/2020/05/09/SBczK9vVaLjhUf1.png" alt="image-20200331231610207" style="zoom: 50%;" />

* [bx+idata]或者idata[bx]表示同一个意思

![image-20200331231924749](https://i.loli.net/2020/05/09/CwpVdHIjsWzQJUX.png)

* 用[bx+idata]的方式可以进行数组的处理
* SI和DI寄存器：si和di是和bx功能相近的寄存器，但是si和di不能分成两个8位寄存器来使用

下面三组指令实现了同样的功能：

<img src="https://i.loli.net/2020/05/09/UMJujScgr1iwohn.png" alt="image-20200331233249850" style="zoom: 67%;" />

<img src="https://i.loli.net/2020/05/09/4HPoTS9vIs7bR6G.png" alt="image-20200331233319341" style="zoom:67%;" />

<img src="https://i.loli.net/2020/05/09/xeX9tuE5I2CNQqS.png" alt="image-20200331233352945" style="zoom:67%;" />

* [bx+si]和[bx+di]或者[bx]\[si]，[bx]\[di]

![image-20200331233712605](https://i.loli.net/2020/05/09/Asqprcb2H5ERQZU.png)

![image-20200331233748072](https://i.loli.net/2020/05/09/tXgzOiClhV4QEuy.png)

![image-20200331233927998](https://i.loli.net/2020/05/09/4FKCotmn69MiQ2u.png)

* [bx+si+idata]和[bx+di+idata]或者idata[bx]\[si]，idata[bx]\[di]

![image-20200331234040351](https://i.loli.net/2020/05/09/uhdValCIzWjRKxU.png)

![image-20200331234207567](https://i.loli.net/2020/05/09/4CmtBAErXGsgY7R.png)

![image-20200401232648279](https://i.loli.net/2020/05/09/y6OTHgZNe2pQCR1.png)

![image-20200401232846276](https://i.loli.net/2020/05/09/TxNcqGDdL7CXfb5.png)

## 第8章 数据处理的两个基本问题

![image-20200401234313633](https://i.loli.net/2020/05/09/mI6lPkcSbjZe7MB.png)

![image-20200401234442869](https://i.loli.net/2020/05/09/WvFbM1IXOryCeqP.png)

<img src="https://i.loli.net/2020/05/09/SHIeRxUudb5lrEY.png" alt="image-20200401234520179" style="zoom: 67%;" />

![image-20200401234648563](https://i.loli.net/2020/05/09/k8pVeJ3r1tLAdN7.png)

![image-20200401234728872](https://i.loli.net/2020/05/09/WGArLXmK1TR3fJe.png)

![image-20200402001920451](https://i.loli.net/2020/05/09/flxpFMqAThP5WmZ.png)

![image-20200402002018856](https://i.loli.net/2020/05/09/4nCyz7lbgo6Lh9H.png)

![image-20200402002040720](https://i.loli.net/2020/05/09/ZajBdh3Iok2e5yT.png)

![image-20200402002058051](https://i.loli.net/2020/05/09/vUgm5RPiTqEJrHL.png)

![image-20200402002213750](https://i.loli.net/2020/05/09/is152MJ6O4knWNl.png)

![image-20200402002149406](https://i.loli.net/2020/05/09/qpSHrGwezfP46i8.png)

![image-20200402002444447](https://i.loli.net/2020/05/09/RO2LTlmWwrcyQP9.png)

![image-20200416154031426](https://i.loli.net/2020/05/09/NgKdyWRVoG69QM2.png)

![image-20200416155611402](https://i.loli.net/2020/05/09/XHB4mZ39vSLoAGz.png)

<img src="https://i.loli.net/2020/05/09/VcIW7MuUo6qsYa2.png" alt="image-20200416171716363" style="zoom:67%;" />

![image-20200416171811373](https://i.loli.net/2020/05/09/7u1miLxPrGTRsnK.png)

![image-20200416174811991](https://i.loli.net/2020/05/09/Yav5iJQNofLlBpD.png)

![image-20200416174951747](https://i.loli.net/2020/05/09/eLjJf2RCi7V3Iha.png)

![image-20200416175236213](https://i.loli.net/2020/05/09/meudgFfE1TjMQlk.png)

![image-20200416175906592](https://i.loli.net/2020/05/09/ZP9x1jAcYIQyNuW.png)

![image-20200416180012558](https://i.loli.net/2020/05/09/iy1nswCjTGFL7mr.png)

![image-20200416180133673](https://i.loli.net/2020/05/09/qODoRxbSVGUgneH.png)

![image-20200416183023291](https://i.loli.net/2020/05/09/FtewHhIlLrQJGYc.png)

![image-20200416203435712](https://i.loli.net/2020/05/09/2Pmf5npNQrcOItW.png)

![image-20200416203545408](https://i.loli.net/2020/05/09/HuR9SElviIr3NgL.png)

![image-20200416203735810](https://i.loli.net/2020/05/09/k4Jan9BiqodKI25.png)

![image-20200416204244012](https://i.loli.net/2020/05/09/BKrkzXYbwGZ91hI.png)

![image-20200416205717844](https://i.loli.net/2020/05/09/sf3lCgY1PHpBZkA.png)

![image-20200416215404767](https://i.loli.net/2020/05/09/O7YVHwCyia6PjZg.png)

> 返回子程序

![image-20200416221543345](https://i.loli.net/2020/05/09/AbOpKj1YSlWcaFB.png)

![image-20200416221602713](https://i.loli.net/2020/05/09/jJQscdYnW2LGZXI.png)

![image-20200417192647215](https://i.loli.net/2020/05/09/uhi3g7P19M4Rmxv.png)

![image-20200418232249760](https://i.loli.net/2020/05/09/MPGfRVgIEHOh2pQ.png)

![image-20200418232359751](https://i.loli.net/2020/05/09/x1BhwUIpVWDgz48.png)

![image-20200418232323031](https://i.loli.net/2020/05/09/cyel7GbM8D3OzTu.png)

![image-20200418233917351](https://i.loli.net/2020/05/09/V8szpvSiHFZqcbm.png)

![image-20200418234706323](https://i.loli.net/2020/05/09/6Ex7rUPfy45FBRI.png)

![image-20200418235142511](https://i.loli.net/2020/05/09/NirXaMKA8SDeGUf.png)

![image-20200419001827190](https://i.loli.net/2020/05/09/BAcg7hFK5sDQalR.png)

![image-20200419003249047](https://i.loli.net/2020/05/09/wE62yvb4PS3Cmeo.png)

![image-20200419003215992](https://i.loli.net/2020/05/09/9kfzVQZWoJDGbnt.png)

![image-20200419003423244](https://i.loli.net/2020/05/09/cmYwpuPif9rUGDE.png)

<img src="https://i.loli.net/2020/05/09/JUr8mqcGuiekAPZ.png" alt="image-20200419003451575" style="zoom: 67%;" />

![image-20200419003803613](https://i.loli.net/2020/05/09/AFdmGzknErca1WI.png)

![image-20200419004003302](https://i.loli.net/2020/05/09/hGrO3vFlQWkuget.png)