#Python����Hive�鿴��ʾ����
# coding=gbk
from impala.dbapi import connect
# ��Ҫע����������auth_mechanism�����У�Ĭ����NOSASL����database�����룬userҲ������
conn = connect(host='192.168.192.100', port=10000, database='default', auth_mechanism='NOSASL',
               user='��hdfs-site���趨���û���������������뿴https://blog.csdn.net/a6822342/article/details/80697919��')
cur = conn.cursor()
#��ʾ�������ݿ�
cur.execute('SHOW DATABASES')
print(cur.fetchall())
#��ʾ���б�
cur.execute('SHOW Tables')