## 文件类
# 统计当前目录下的文件个数
ls -l |grep "^-"|wc -l

# zip 分卷压缩
zip -s 4m google.zip --out ziptest   //分卷
