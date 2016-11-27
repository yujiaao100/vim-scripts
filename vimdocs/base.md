## vim基础内容

<C-R>  可以使用寄存器
标准模式下 是后退

:'<,'>w !bash 选中某段执行代码并返回
:'<,'> !bash  选中执行

i <C-o>  插入模式下临时切换回标准模式

n zz 居中




分割行移动
gj
gk



There are ten types of registers:                       registers E354
1. The unnamed register ""                               
2. 10 numbered registers "0 to "9                        
3. The small delete register "-                          
4. 26 named registers "a to "z or "A to "Z               
5. three read-only registers ":, "., "%                  
6. alternate buffer register "#                          
7. the expression register "=                            
8. The selection and drop registers "*, "+ and "~        
9. The black hole register "_                            
10. Last search pattern register "/  
