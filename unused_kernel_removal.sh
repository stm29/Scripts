for kernel in $( dpkg --list |egrep linux\\-*.*-[1-9]\\.[1-9]| awk '{print $2}' | egrep -v $( cut -c -10 <<< $(uname -r)  )); do apt-get -y purge ${kernel} ; done
for kernel in $(dpkg --list |egrep linux\\-*.*-[1-9]\\.[1-9]| awk '{print $2}' | egrep -v $(echo $(uname -r) | sed 's/-aws\|-generic//g')); do apt-get -y purge ${kernel} ; done
