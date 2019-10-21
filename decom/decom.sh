if [ ! $1 ]
then
	echo "Please input at least one parameter!"
	exit -1
fi	
reader=$1

if [ $reader != "--list" ]
then	#判断解压的文件类型并拼接字符串
	suf=${reader#*./}
	suf=${suf#*.}
else	#当输入的参数是--list时列出可解压的文件列表
	echo "Supported file formats:tar、gz、tar.gz、tgz、bz、bz2、tar.bz、tar.bz2、Z、tar.Z、zip"
	exit 0
fi

#判断是否指定解压目录
if [ $2 != "" ]
then
	decomPath=$2
else
	decomPath="./"
fi

#根据后缀名解压文件
if [ $suf == "tar" ]
then
	tar xvf $1 -C $decomPath
elif [ $suf == "gz" ]
then
	gunzip $1 $decomPath
elif [ $suf == "tar.gz" ]
then
	tar zxvf $1 -C $decomPath
elif [ $suf == "tgz" ]
then
	tar zxvf $1 -C $decomPath
elif [ $suf == "bz" ]
then
	bunzip2 $1 -C $decomPath
elif [ $suf == "bz2" ]
then
	bunzip2 $1 -C $decomPath
elif [ $suf == "tar.bz" ]
then
	tar jxvf $1 -C $decomPath
elif [ $suf == "tar.bz2" ]
then
	tar jxvf $1 -C $decomPath
elif [ $suf == "Z" ]
then
	uncompress $1 -C $decomPath
elif [ $suf == "tar.Z" ]
then
	tar Zxvf $1 -C $decomPath
elif [ $suf == "zip" ]
then
	unzip $1 -C $decomPath
else
	echo "Unsupported file format!"
	exit -1
fi
exit 0
