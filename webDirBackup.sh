#!/bin/bash
#---------------------------------------
# 打包压缩当前目录下所有网站目录到tar.gz
#---------------------------------------
date=$(date "+%Y%m%d")
date2=$(date "+%Y年%m月%d日%H时%M分%S秒")

for i in $(ls)
do
	if [ -d $i ]
	then
		/bin/tar -zcvf "./backup/"${i}"_backup_$date.tar.gz" $i		
		if [ $? -eq 0 ]
		then
			echo -e "文件夹 $i 于 ${date2} 打包压缩成功\n" >> ./backup/backup.log
		else
			echo -e "文件夹 $i 于 ${$date2} 打包压缩失败\n" >> ./backup/backup.log
		fi
	fi
done
