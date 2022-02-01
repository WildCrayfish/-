#读取表头文件生成HiveSQL语句
import os
def dele_txt(path):
    dirs=os.listdir(path)
    for file in dirs:
        if file[-3:] =="txt":
            print(file[-3:])
        new_fiels="test_1.txt"
        path1='1.bak'
        lines = (i for i in open(path+file, 'r') if '##' not in i )
        f = open(path+new_fiels, 'w', encoding="utf-8")
        f.writelines(lines)
        f.close()
        os.rename(path+file, path+path1)
        os.rename(path+new_fiels, path+file)
        os.remove(path+path1)
def firstline(path):
    with open(path, 'r', encoding='utf-8') as f:  # 打开文件
        lines = f.readlines(1)  # 读取所有行
        first_line = lines[0]  # 取第一行
        first_line = first_line[1:]
        ls=first_line.split('\t')
        return ls
def text_create(msg,name,path):
    desktop_path = path  # 新创建的txt文件的存放路径
    full_path = desktop_path + name + '.txt'  # 也可以创建一个.doc的word文档
    file = open(full_path, 'w')
    file.write(msg)  # msg也就是下面的Hello world!
    file.close()
def hsql(path,newpath):
    dele_txt(path)
    filed=os.listdir(path)
    for file in filed:
        if file[-3:] == "txt":
            print(file)
            l=firstline(path+file)
            cow=[]
            tbcows= ""     #表 字段
            for i in l:
                cow.append(i + ",\n")
            cow[-1] = cow[-1].replace("\n", "")
            cow[-1] = cow[-1].replace(",", "")
            for i in cow:
                tbcows = tbcows + i
            head = "create table if not exists "               #hql 建表语句
            tbname =file.split('.')[1]+file.split('.')[0]   #表名
            tail = "\nrow format delimited\nfields terminated by '\\t';"
            hive = head + tbname+"(\n"+tbcows+"\n)"+tail
            text_create(hive,tbname,newpath)
hsql("输入数据路径","输出数据路径")

