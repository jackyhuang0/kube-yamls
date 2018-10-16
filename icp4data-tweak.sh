for i in `find . -type f -print`;
do
    echo $i"======>"
    #grep "containers:" $i
awk -i inplace -F'con' '{ if (!/containers:/) {print} else {print $1"nodeSelector:\n"$1"  kubernetes.io/hostname: 172.16.102.30\n"$1"tolerations:\n"$1"- key: dedicated\n"$1"  operator: Equal\n"$1"  value: \"gpu\"\n"$1"  effect: NoSchedule\n"$1"con"$2} }' $i
done
