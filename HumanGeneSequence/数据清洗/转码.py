#转码格式从vcf到txt
import os
def R_F_L():
    path="e:/txtmini/"
    datanames = os.listdir(path)
    for i in datanames:
        if os.path.splitext(i)[1] == '.txt':
            fiels = i[0:-4] + '.txt'
            new_fiels = "test_1.txt"
            path1  = '1.bak'
            lines = (i for i in open(path + fiels, 'r') if '##' not in i)
            f = open(path + new_fiels, 'w', encoding="utf-8")
            f.writelines(lines)
            f.close()
            os.rename(path + fiels, path + path1)
            os.rename(path + new_fiels, path + fiels)
            os.remove(path + path1)
    with open("e:/"+fiels, 'r', encoding='utf-8') as f:
        contents = f.readlines()
        a = contents[0].split('\t')
        return a
def hql():
    path="c:/"
    line = R_F_L()
    datanames = os.listdir(path)
    for i in datanames:
        if os.path.splitext(i)[1]=='.txt':
            qw = []
            for q in line:
                qw.append(q + " char,\n")
            qw[-1] = qw[-1].replace("\n", "")
            qw[-1] = qw[-1].replace(",", "")
            w = "create table if not exists " + i[0:-4] + "("
            for x in qw:
                w = w  + x
                ending = "\nrow format delimited\nfields terminated by '\\t';"
                b = w + ")" + ending
                desktop_path = "e:/sql/"  # 新创建的txt文件的存放路径
                full_path = desktop_path + i[0:-4] + "的hql语句" + ".txt"  # 也可以创建一个.doc的word文档
                file = open(full_path, 'w')
                file.write(b)

if __name__ == "__main__":
    R_F_L()
    hql()
print("转换结束！")

