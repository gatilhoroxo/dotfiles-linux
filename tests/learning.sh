#!/bin/sh
# im trying to learn shell things

# === primeiro ===
# # This is a comment!
# echo "Hello      World"       # This is a comment, too!
# echo "Hello World"
# echo "Hello * World"
# echo Hello * World
# echo Hello      World
# echo "Hello" World
# echo Hello "     " World
# echo "Hello "*" World"
# echo `git` world
# echo 'hello' world

# === segundo ===
# echo What is your name?
# read MY_NAME
# echo "Hello $MY_NAME - hope you're well."

# === terceiro ===
# echo "valor de LAAA: $LAAA"
# export LAAA="change"
# echo "valor de LAAA: $LAAA"

# === quarto ===
# echo "What is your name?"
# read USER_NAME
# echo "Hello $USER_NAME"
# echo "I will create you a file called ${USER_NAME}_file"
# touch "${USER_NAME}_file"
# echo "Did you saw it?"
# read answer
# rm "${USER_NAME}_file"

# === quinto ===
# for i in 1 2 3 4 5
# do
#   echo "Looping ... number $i"
# done

# === sexto ===
# for i in hello 1 * 2 goodbye 
# do
#   echo "Looping ... i is set to $i"
# done

# === sétimo ===
# INPUT_STRING=hello
# while [ "$INPUT_STRING" != "bye" ]
# do
#   echo "Please type something in (bye to quit)"
#   read INPUT_STRING
#   echo "You typed: $INPUT_STRING"
# done

# === oitavo ===
# while :
# do
#   echo "Please type something in (^C to quit)"
#   read INPUT_STRING
#   echo "You typed: $INPUT_STRING"
# done

# === nono ===
# touch myfile.txt
# echo "hello\nhowdy\ngday\nbonjour\nguten tagg\nguten tag\namerica\trica\nmente\n" > myfile.txt
# cat myfile.txt
# while read input_text
# do
#   case $input_text in
#       hello)          echo English    ;;
#       howdy)          echo American   ;;
#       gday)           echo Australian ;;
#       bonjour)        echo French     ;;
#       "guten tag")    echo German     ;;
#       *)              echo Unknown Language: $input_text
#             ;;
#   esac
# done < myfile.txt
# rm myfile.txt

# === décimo ===
##mkdir rec{0,1,2,3,4,5,6,S}.d
# for runlevel in 0 1 2 3 4 5 6 S
# do
#   mkdir rc${runlevel}.d
# done

# === décimo primeiro ===
#X=0
#X=5
X=""
#X=hello
#X=test.sh

# if [ "$X" -lt "0" ]
# then
#   echo "X is less than zero"
# fi
# if [ "$X" -gt "0" ]; then
#   echo "X is more than zero"
# fi
# [ -z "$X" ] && \
#       echo "X is zero or null"
# [ "$X" -le "0" ] && \
#       echo "X is less than or equal to  zero"
# [ "$X" -ge "0" ] && \
#       echo "X is more than or equal to zero"
# [ "$X" = "0" ] && \
#       echo "X is the string or number \"0\""
# [ "$X" = "hello" ] && \
#       echo "X matches the string \"hello\""
# [ "$X" != "hello" ] && \
#       echo "X is not the string \"hello\""
# [ -n "$X" ] && \
#       echo "X is of nonzero length"
# [ -f "$X" ] && \
#       echo "X is the path of a real file" || \
#       echo "No such file: $X"
# [ -x "$X" ] && \
#       echo "X is the path of an executable file"
# [ "$X" -nt "/etc/passwd" ] && \
#       echo "X is a file which is newer than /etc/passwd"

# === décimo segundo ===
# echo -en "Please guess the magic number: "
# read X
# echo $X | grep "[^0-9]" > /dev/null 2>&1
# if [ "$?" -eq "0" ]; then
#   # If the grep found something other than 0-9
#   # then it's not an integer.
#   echo "Sorry, wanted a number"
# else
#   # The grep found only 0-9, so it's an integer. 
#   # We can safely do a test on it.
#   if [ "$X" -eq "7" ]; then
#     echo "You entered the magic number!"
#   fi
# fi

# === décimo terceiro ===
# echo "Please talk to me ..."
# while :
# do
#   read INPUT_STRING
#   case $INPUT_STRING in
# 	hello)
# 		echo "Hello yourself!"
# 		;;
# 	bye)
# 		echo "See you again!"
# 		break
# 		;;
# 	*)
# 		echo "Sorry, I don't understand"
# 		;;
#   esac
# done
# echo 
# echo "That's all folks!"

# === décimo quarto ===
# # paramentros hello earth coiso
# echo "I was called with $# parameters"
# echo "My name is $0"
# echo "My first parameter is $1"
# echo "My second parameter is $2"
# echo "All parameters are $@"

# === décimo quinto ===
# while [ "$#" -gt "0" ]
# do
#   echo "\$1 is $1"
#   shift
# done 

# === décimo sexto ===
# /usr/local/bin/my-command
# if [ "$?" -ne "0" ]; then
#   echo "Sorry, we had a problem there!"
# fi

# === décimo sétimo ===
# old_IFS="$IFS"
# IFS=:
# echo "Please input some data separated by colons ..."
# read x y z
# #hello:how are you:today
# IFS=$old_IFS
# echo "x is $x y is $y z is $z"

# === décimo oitavo ===
# echo "Please input some data separated by colons ..."
# read x y z
# echo "x is $x y is $y z is $z"

# === décimo nono ===
#isso não está funcionando da maneira que deveria pois pede que seja '#!/bin/bash'
#echo -en "What is your name [ `whoami` ] "
#alternativa que funciona em sh, bash, zsh
#printf "What is your name [ `whoami` ] "
#ou
# printf "What is your name [ %s ] " "$(whoami)"
# read myname
# if [ -z "$myname" ]; then
#   myname=`whoami`
# fi
# echo "Your name is : $myname"

# === vigésimo ===
printf "What is your name [ `whoami` ] "
read myname
echo "Your name is : ${myname:-`whoami`}"
echo "Your name is : ${myname:-John}"
echo "Your name is : ${myname:=America}"
echo "${myname}"

# === vigésimo primeiro ===


