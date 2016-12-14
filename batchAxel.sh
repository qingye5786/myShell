#!/bin/bash
#-----------------------------------------------------
# 批量从list文件中读取下载地址行，使用Axel进行批量下载
#-----------------------------------------------------

date=$(date "+%Y-%m-%d_%H:%M:%S")
for line in $(cat list)
do
	/usr/bin/axel -n 500 $line	
	if [ $? -eq 0 ]
	then
		echo -e "下载文件 $line 成功,时间：$date" >> batchAxel.log
	else
		echo -e "下载文件 $line 失败,时间：$date" >> batchAxel.log
	fi
done
