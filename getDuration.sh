#!/bin/bash

# dnetto v0.1
# 21/12/2021

# on error scape script whitout initialize that
[[ "$#" -lt 1 ]] && echo -e "imput error\n\$>$0 *.mp3" && exit


declare vb=1
#	verbose hightverbose [1]
#	verbose only total in seconds [0]
#	verbose only total days:hours:minutes:seconds [2]
#	verbose simply [3]
declare y=0 # var to loop and print colors 

declare td=0 #total days
declare th=0 #total hours
declare tm=0 #total minutes
declare ts=0 #total seconds  (this vars take all time and only convert that at the end of  scritp)

# convert secound to minutes hours and days
function updateTotal
{
	[[ "$ts" -gt 60 ]] && tm=`echo $tm + $ts / 60 | bc` ; ts=`echo $ts % 60 | bc`
	[[ "$tm" -gt 60 ]] && th=`echo $th + $tm / 60 | bc` ; tm=`echo $tm % 60 | bc`
	[[ "$th" -gt 24 ]] && td=`echo $td + $th / 24 | bc`
}

#print issues
function printSpecial
{
	[[ $y -eq 0 ]] && echo -e "geting time of all songs"
	if [ $vb -eq 3 ] ; then 
		m=`mp3info -p %m $1`
		s=`mp3info -p %s $1`

		[[ "$color" = "" ]] && color="\033[38;5;199m" || color=""
		printf "$color%.2d:%.2d  -=- %s\033[0m\n" $m $s $i
	else 	
		[[ $y -eq 0 ]] && printf "please wait: "
		case "`echo $y % 4 | bc`" in
			0) printf "\b|";;
			1) printf "\b/";;
			2) printf "\b-";;
			3) printf "\b\\";;	
		esac
	fi
}

function printEnd
{
	[[ $vb -eq 1 ]] && printf "\b[done]\n"
	updateTotal
	printf -- '=%.0s' {1..57}
	printf '\n=%15s music you have a total time:%12s' "for: $y" "="
	printf '\n=%10s days %.2d hours %.2d minutes %.2d seconds%10s\n' $td $th $tm $ts "="
	printf -- '=%.0s' {1..57}
	echo ""
}

#pase arg
y=0
for i in "$@" ; do
	case "$i" in
		"-0") vb=0 ; shift;;
		"-2") vb=2 ; shift;;
		"-3") vb=3 ; shift;;	
	esac
	[[ $y -gt 10 ]] && break || let y++
done
y=0

#iparse songs
for i in "$@"; do
	t=`mp3info -p %S $i`
	ts=`echo $ts + $t | bc`
	[[ $vb -eq 1 ]] || [[ $vb -eq 3 ]] && printSpecial $i ; y=`echo $y+1|bc`
done

# for end of scripti
case $vb in 
	0) echo "$ts";;
	2) updateTotal ; printf '%s:%.2d:%.2d:%.2d\n' $td $th $tm $ts;;
	*) printEnd ;;
esac

