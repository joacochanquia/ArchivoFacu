vector1=(1 2 3 4 5 6 7 8)
vector2=(10 20 30 40 50 60 70 80)
res=()

if [ ${#vector1[*]} -ne ${#vector2[*]} ]
then
    echo "Los tamanos no coinciden"
    exit 1
fi

for((i=0 ; i < ${#vector1[*]} ; i++))
do
    let res[$i]=${vector1[$i]}+${vector2[$i]}
done

for((i=0 ; i < ${#vector1[*]} ; i++))
do
    echo "La suma en $i es ${res[$i]}"
done
