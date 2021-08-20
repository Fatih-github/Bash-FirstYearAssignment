#!/bin/bash
a=1

updatedata()
{
	filename='data.csv'
        Total=0
        tryme=0
        while IFS=";" read Date_of_report Municipality_code Municipality_name Province Total_reported Hospital_admission Deceased
        do
        	if [ $2 == "Total_reported" ]; then
        		tryme=$Total_reported
                elif [ $2 == "Hospital_admission" ]; then
                        tryme=$Hospital_admission
                elif [ $2 == "Deceased" ]; then
                        tryme=$Deceased
                fi
                printf -v int '%d\n' "$tryme" 2>/dev/null
                Total=`expr $Total + $int`
	done < $filename
        echo $Total
}

func() 
{
	if [ $1 == 1 ]; then 
		echo $2
	elif [ $1 == 2 ]; then
		echo "$(eval $2)"
	elif [ $1 == 3 ]; then
		functie=$(updatedata $type "$value")
                echo $functie
	else
	echo "Deze optie bestaat niet"
	fi
}

while (( "$#" )); do
if [ $a == 1 ]; then
	index=$1
elif [ $a == 2 ]; then
	type=$1
elif [ $a == 3 ]; then
	value=$1
fi

if [ $(($a % 3)) == 0 ]; then
	if [ $index == 0 ]; then
		if [ "$value" == null ]; then
			indexNul=[]
		else
			functie=$(func $type "$value")
        		indexNul=[$functie]
		fi
	elif [ $index == 1 ]; then
                if [ "$value" == null ]; then
			indexOne=[]
		else
			functie=$(func $type "$value")
        		indexOne=[$functie]
		fi
	elif [ $index == 2 ]; then
                if [ "$value" == null ]; then
			indexTwo=[]
		else
			functie=$(func $type "$value")
        		indexTwo=[$functie]
		fi
	elif [ $index == 3 ]; then
                if [ "$value" == null ]; then
			indexThree=[]
		else
			functie=$(func $type "$value")
        		indexThree=[$functie]
		fi
	fi
	((a=0))
fi
((a++))

shift

done
PS1=$indexNul$indexOne$indexTwo$indexThree$
