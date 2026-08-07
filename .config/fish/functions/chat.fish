function chat
	set -l olddir $PWD
	set -l tmp (mktemp -d /tmp/pi-chat.XXXXXX)
	cd $tmp
	pia
	cd $olddir
	echo "Returned from $tmp"
end
