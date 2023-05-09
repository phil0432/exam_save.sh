# exam_save.sh
#The script takes atleast 2 arguments, shows error if the number of arguments are less than 2. The first argument is taken as the student number and the other #arguments are assigned to their values as needed. The script returns an error if any argument other than the required ones are presented.

#Code:
 
#!/bin/bash -u
PATH=/bin:/usr/bin ; export PATH
umask 022

#Alvien Vinu Philips phil0432@algonquinlive.com

if [ $# -lt 2 ]
then
        echo 1>&2 "ERROR: Please enter more number of arguments"
        echo 1>&2 "Usage: exam_save.sh STUDENT_NUMBER ANSWER1 [ANSWER2]..."
        exit 1
fi

studentnumber="$1"
shift 1

n=1
output="#1128"
for question in "$@"
do
        if [ "$question" = "1" ]; then
                output="$output\n$n) A"
        elif [ "$question" = "2" ]; then
                output="$output\n$n  B"
        elif [ "$question" = "3" ]; then
                output="$output\n$n) C"
        elif [ "$question" = "4" ]; then
                output="$output\n$n) D"
        elif [ "$question" = "5" ]; then
                output="$output\n$n) E"
        elif [ "$question" = "-" ]; then
                output="$output\n$n) -"
        else
        echo 1>&2 " ERROR:::Invalid answer : $question"
        exit 2
fi

        n=$((n+1))
done

#output to file HERE and not before!
echo -e "$output" > "$studentnumber.txt"
exit 1
