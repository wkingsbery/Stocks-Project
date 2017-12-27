# Billy Kingsbery
# IEX Lab
# November 20, 2017
# for loop to process stock list
#
clear
while true
do
	counter=1
	row=1
	colm=10

	for stock in `cat stocks.txt`
	do


      			wget -qO- https://api.iextrading.com/1.0/stock/$stock/batch?types=quote\&range=1m\&last=10 >data1
	
	      		cat data1 | sed s/", "/" "/g >data2
	      		mv data2 data1

			change=`cat data1 | awk -F, '{print $3}'`
			negativez=`echo $change | grep "-" | wc -l` 
			if [ $negativez -eq 1 ]
			then
				tput setab 1;
				tput setaf 0;
			else
				tput setab 2;
				tput setaf 0;
			fi

      			tput cup $row $colm;
      			echo "              "
      			tput cup $row $colm;
     		 	echo "       $stock"

			row=$((row + 1))
   
      			name=`cat data1 | awk -F, '{print $1}'`
			tput cup $((row+1))  $colm;
      			echo "              "
			tput cup $((row+1))  $colm;
      			echo "$name"

			row=$((row + 1))

      			price=`cat data1 | awk -F, '{print $2}'`
			tput cup $((row+2)) $colm;
      			echo "              "
			tput cup $((row+2)) $colm;
      			echo "$price"

			row=$((row + 1))

      			change=`cat data1 | awk -F, '{print $3}'`
			tput cup $((row+3))  $colm;
      			echo "              "
			tput cup $((row+3)) $colm;
     			echo "$change"

			row=$((row + 1))

      			volume=`cat data1 | awk -F, '{print $4}'`
			tput cup $((row+4)) $colm;
      			echo "              "
			tput cup $((row+4)) $colm;
      			echo "$volume"

			counter=$((counter + 1))

			if [ $counter -eq 2 ]
			then
				row=1
				colm=40
			elif [ $counter -eq 3 ]
			then
				row=1
				colm=70
			elif [ $counter -eq 4 ]
			then 
				row=1
				colm=100
			elif [ $counter -eq 5 ]
			then 
				row=1
				colm=130

			elif [ $counter -eq 6 ]
			then
				row=1
				colm=160
		
			elif [ $counter -eq 7 ]
			then
				row=10
				colm=10
			elif [ $counter -eq 8 ]
                        then
                                row=10
                                colm=40
			elif [ $counter -eq 9 ]
                        then
                                row=10
                                colm=70
			elif [ $counter -eq 10 ]
			then
				row=10
				colm=100
			elif [ $counter -eq 11 ]
                        then
                                row=10
                                colm=130
			elif [ $counter -eq 12 ]
                        then
                                row=10
                                colm=160
			elif [ $counter -eq 13 ]
                        then
                                row=20
                                colm=10
                        elif [ $counter -eq 14 ]
                        then
                                row=20
                                colm=40
			elif [ $counter -eq 15 ]
                        then
                                row=20
                                colm=70
                        elif [ $counter -eq 16 ]
                        then
                                row=20
                                colm=100
			elif [ $counter -eq 17 ]
                        then
                                row=20
                                colm=130
                        elif [ $counter -eq 18 ]
                        then
                                row=20
                                colm=160
			elif [ $counter -eq 19 ]
                        then
                                row=30
                                colm=10
                        elif [ $counter -eq 20 ]
                        then
                                row=30
                                colm=40
                        elif [ $counter -eq 21 ]
                        then
                                row=30
                                colm=70
                        elif [ $counter -eq 22 ]
                        then
                                row=30
                                colm=100
                        elif [ $counter -eq 23 ]
                        then
                                row=30
                                colm=130
                        elif [ $counter -eq 24 ]
                        then
                                row=30
                                colm=160
			elif [ $counter -eq 25 ]
                        then
                                row=40
                                colm=10
                        elif [ $counter -eq 26 ]
                        then
                                row=40
                                colm=40
                        elif [ $counter -eq 27 ]
                        then
                                row=40
                                colm=70
                        elif [ $counter -eq 28 ]
                        then
                                row=40
                                colm=100
                        elif [ $counter -eq 29 ]
                        then
                                row=40
                                colm=130
                        elif [ $counter -eq 30 ]
                        then
                                row=40
                                colm=160
				counter=1
	
			fi

	done
done
