#从处理后的数据中读取表头
import os
def txt100(path,newpath):
    dirs = os.listdir(path)
    for file in dirs:
        print(path+file)
        for i in open(path+file, 'r',encoding="utf-8"):
            if "#CHROM" in i:
                f = open(newpath + file, 'w')
                f.writelines(i)
                f.close()
                break
txt100("输入数据路径","输出数据路径")