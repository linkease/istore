#!/usr/bin/awk -f
BEGIN {
	D="cd /usr/lib/opkg/info&&"
	C=D"ls *.list"
	S="sort -n"
	while(C|getline>0) {
		P=substr(F=$1,1,length($1)-5)
		J=D"du -sk $(cat "F")"
		s=0
		while(J|getline>0) s+=$1
		close(J)
		t+=s
		print s" "P|S
	}
	close(S)
}