#!/bin/bash

# https://www.unix.com/shell-programming-and-scripting/271790-implementing-linked-list-shell-scripting.html

llinsert() {
   local END=${#LST[@]}
   local i

   for((i=0; NXT[i]; i=NXT[i]))
   do
     if [ "${LST[NXT[i]]}" \> "$1" ]
     then
        ((i=NXT[i]))
        LST[END]=${LST[i]}
        LST[i]="$1"
        ((NXT[END]=NXT[i]))
        ((NXT[i]=END))
        return
     fi
   done

   LST[END]="$1"
   ((NXT[i]=END))
   NXT[END]=0
}

llfirst() {
  pos=NXT[0]
  echo "${LST[pos]}"
}

llnext() {
   (( NXT[pos] )) && {
       ((pos=NXT[pos]))
       echo "${LST[pos]}"
   }
}

LST=("")

llinsert "please"
llinsert "sort"
llinsert "this"
llinsert "small"
llinsert "list"
llinsert "of"
llinsert "words"

llfirst
while llnext
do
  :
done

# Debug - Output array contents
echo
printf "%-4s %-8s %-3s\n" Idx LST NXT
printf "%-4s %-8s %-3s\n" --- -------- ---
for((i=0;i<${#NXT[@]};i++)) {
   printf "%-4s %-8s %-3s\n" "$i" "${LST[i]}" "${NXT[i]}"
}

