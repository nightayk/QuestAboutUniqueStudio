if [ $1 ]
then
	if [ $1 == "-ip" ]
	then
		ifconfig eth0 $2 netmask 255.255.0.0
	else
		echo "Wrong parameter!"
	fi
else
	ifconfig | grep -A 2 "eth0" | grep "inet"
fi
