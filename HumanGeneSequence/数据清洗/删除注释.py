#删除注释
import os
def txt1(path,newpath):
    dirs = os.listdir(path)
    for file in dirs:
        s = path+file
        print(s)
        with open(s, 'r',encoding="utf-8") as w:
            lines = (i for i in open(path + file, 'r') if '#' not in i)
            """一个#删所有 两个##删注释"""
            f = open(newpath + file, 'w')
            f.writelines(lines)
            f.close()
txt1("输入数据路径","输出数据路径")
