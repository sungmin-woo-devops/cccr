 declare -A arr=( [start]=foo [foo]=bar [bar]=quux [quux]=grault [grault]=end [end]=end )
 key=start
 while [ $key != "end" ]
 do 
    echo "$key  ${arr[$key]}"
    key=${arr[$key]}
 done
