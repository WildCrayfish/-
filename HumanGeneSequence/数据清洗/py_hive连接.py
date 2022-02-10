#Python连接Hive查看显示数据
# coding=gbk
from impala.dbapi import connect
# 需要注意的是这里的auth_mechanism必须有，默认是NOSASL，但database不必须，user也不必须
conn = connect(host='192.168.192.100', port=10000, database='default', auth_mechanism='NOSASL',
               user='在hdfs-site中设定的用户名（如果不懂，请看https://blog.csdn.net/a6822342/article/details/80697919）')
cur = conn.cursor()
#显示所有数据库
cur.execute('SHOW DATABASES')
print(cur.fetchall())
#显示所有表
cur.execute('SHOW Tables')