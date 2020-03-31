<div align="center"> <font size="6" color="black"><strong></strong>8086 assembly language</font> </div>

## 常用指令

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
* g：g 0012 执行指令到偏移地址0012h处
* p：Debug自动重复执行loop中的指令直至(cx)=0