echo "HOLa Mundo"
echo "Prueba" > Probando
ls Probando
PRUEBA="Hola a ver si funciona"
PRUEBA
echo $PRUEBA
echo $PRUEBA >> Probando
echo Probando
echo $Probando
cat Probando
echo $PRUEBA >> Probando
cat Probando
echo PRUEBA >> Probando
echo chau >> Probando
cat Probando
echo chau >> Probando
cat Probando
echo chau > Probando
cat Probando
vim prueba.exe
cat > prueba.exe
ls -l
vim prueba.exe
vi prueba.exe
cat prueba.exe
vim prueba.exe
vi prueba.exe
cat prueba.exe
cat -E prueba.exe
cat -n prueba.exe
cat -v prueba.exe
cat -T prueba.exe
cat -b prueba.exe
tac prueba.exe
cat -s prueba.exe
cat -b prueba.exe
cat prueba.exe > nuevaprueba.exe
cat nuevaprueba.exe
tac nuevaprueba.exe > alrevez.exe
cat alrevez.exe
tac alrevez.exe
echo "hola que onda"
mkdir CSO2022
cd CSO2022
ls
ls -l
touch cso2022-{1..2}.txt
ls -l
ls
ls /
ls -R /
ls /
ls /home
ls /home/joaco
ls /home/joaco/CSO2022
cat /home/joaco/CSO2022/*.txt  
cat /home/joaco/CSO2022/*
ls ~
ls -R ~
ls ..
ls ../..
ls ../../..
ls ../../../..
ls ../../..
ls *
cd ..
ls *
ls 
ls *
ls -R
ls -s
ls -l
ls -lh
ls -R -l
pwd
cd ~/CSO2022
pwd
man pwd
type pwd
type cat
type mkdir
find cso
find "cso"
find "cso*"
ls
find "cso2022-1.txt"
find "cso2022-1.*"
find -name "cso2022-1.*"
find -name "cso20*"
find -name "cso*"
find -name "cSo*"
find -iname "cSo*"
cd ..
find -iname "cSo*"
find -name "cso*"
find -iname "cso*"
find -iname "cso*" -type f
find -iname "cso*" -type d
find -iname "cso"
find -name "cso"
find -not -name "cso"
find -not -name "cso" -and -iname "Doc*"
find \( -not -name "cso" \) -and \( -iname "Doc*" \)
find \( -not -name "cso" \) -and \( -iname "Doc*" )
find \(  -name "cso" \) -and \( -iname "Doc*" \)
find \(  -name "cso" \) -or \( -iname "Doc*" \)
find \( -name "cso" \) -or \( -iname "Doc*" \)
find \( -name "cso*" \) -or \( -iname "Doc*" \)
find \( -iname "cso*" \) -or \( -iname "Doc*" \)
find -iname "cso*", -iname "Doc*"
find -iname "cso*", -iname "*.txt"
find -iname "cso*" -and -iname "*.txt"
cd ..
cd ~/CSO2022
ls -l
find . -perm 644
find . -perm 643
find . -perm -643
find . -perm -6-43
find . -perm -644
find . -perm /644
find . -perm /-4-
find . -perm /644
man -perm
cd ..
find . -perm 644
find . -perm -644 -more
find . -perm -644 | more
find . -perm 644 | more
cd ~
cd ~/CSO2022
ls
ls -l
chmod o=7 cso2022-1.tx
chmod o = 7 cso2022-1.txt
chmod o = rwx cso2022-1.txt
chmod --help
ls -l
chmod o+w cso2022-1.txt
ls -l
chmod o=w cso2022-1.txt
ls -l
chmod o=7 cso2022-1.txt
chmod o=rwx cso2022-1.txt
ls -l}
ls -l
df
find -iname "cso*"
find -iname "cso*" -printf "%a"
find -iname "cso*" -printf "%a \n"
find -iname "cso*" -printf "%b \n"
find -iname "cso*" -printf "%d \n"
find -iname "cso*" -printf "%p \n"
find -iname "cso*" -printf "%p\n"
find -iname "cso*" -printf "%p , %a\n"
find -iname "cso*" -printf "%p , %g\n"
find -iname "cso*" -printf "%p , %m\n"
find -iname "cso*" -printf "%p , %s\n"
find -iname "cso*" -printf "%p , %u\n"
cd ..
find -iname "cso*"
find -iname "cso*" -prune
who
who -H
who -b
who -u
who -q
who -T
who -w
-a
who -a
cd ~/CSO2022
cd ..
ls
tail nuevaprueba.exe
cat >> nuevaprueba.exe
tail nuevaprueba.exe
head nuevaprueba.exe
head -2 nuevaprueba.exe
head -12 nuevaprueba.exe
head -n5 nuevaprueba.exe
head -c5 nuevaprueba.exe
head -c15 nuevaprueba.exe
head -c17 nuevaprueba.exe
head -q nuevaprueba.exe
ls
head nuevaprueba.exe prueba.exe
head -q nuevaprueba.exe prueba.exe
uptime
su
ls
su
su/
cat /etc/passwd
su
sudo useradd -d /home/cso_2022 -g catedra
su
echo chau > Probando
du
echo "hola" > 2
ls
Emacs nuevaprueba
emacs nuevaprueba
emacs nuevaprueba.exe
nano nuevaprueba.exe
pstree
man adduser
useradd --help
adduser --help
cat --help
cat
less
less stdin
less stdout
who --help
su
ls /usr/passwd
cat /etc/passwd
su
cat /etc/passwd
pwd
mkdir paraborrar
ls
cd .paraborrar
cd ./paraborrar
cat > uno.txt
cat > dos.exe
cd ..
rmdir ./paraborrar
rmdir -ignore-fail-on-empty ./paraborrar
rmdir --help
rmdir -ignore-fail-on-non-empty ./paraborrar
rmdir --ignore-fail-on-non-empty ./paraborrar
ls
rmdir -v ./paraborrar
mkdir --help
mount --help
11
umount --help
pwd -h
pwd --help
pwd
pwd -L
pwd -P
ln --help
man ln
man ls
man cp
man mv
man ln
man mount
man cut
cat /etc/passwd | cut -d: -f1 | grep a | wc -1
cat /etc/passwd | cut -d: -f1 | grep a | wc -l
man read
man echo
read | echo
read
du
df
du ./CSO2022
du ./CSO2022/*
df -h
df -m
df -h -T
ls -l
find -perm u=rw
find -perm u=rw -prune
find -prune -perm u=rw
find -prune -perm g=rw
find -perm g=rw
find -perm g=rwx
find -perm u=rwx
find -iname "cso*"
find -iname "cso*" -printf "%m \t%p \n"
find -iname "cso*" -perm 644 -printf "%m \t%p \n"
find -iname "cso*" -perm 4 -printf "%m \t%p \n"
find -iname "cso*" -perm u=4 -printf "%m \t%p \n"
find -iname "cso*" -perm u=r -printf "%m \t%p \n"
find -iname "cso*" -perm g=r -printf "%m \t%p \n"
find -iname "cso*" -perm u=rwx -printf "%m \t%p \n"
find -iname "cso*" -perm 644 -printf "%m \t%p \n"
find -iname "cso*" -perm 644 -printf "%u \t%p \n"
find -iname "cso*" -printf "%u \t%p \n"
find -iname "cso*" -printf "% \t%p \n"
find -iname "cso*" -perm u=rwx,g=r,o=r -printf "%m \t%p \n"
find -iname "cso*" -perm 600 -printf "%m \t%p \n"
grep ls ~/*
grep ls * 
grep - ls *
grep -v ls *
grep -n ls *
grep -c ls *
echo "Hola Mundo"
echo "Hola \nMundo"
echo -e "Hola \nMundo"
echo -e "Hola \nMundo\a"
echo -e "Hola \nMundo\126"
echo -e "Hola \nMundo\o126"
echo -e "Hola \nMundo\O126"
echo -e "Hola \nMundo\tchau"
echo -e "Hola \nMundo\033[30m"
echo -e "Hola \nMundo\033[31m"
echo -e "Hola \nMundo\033[31mhola"
echo -e "Hola \nMundo\033[1mhola"
echo -e "Hola \nMundo\033[4mhola"
echo -e "Hola \nMundo\033[7mhola"
hola
echo -e "Hola \nMundo\033[5mhola"
echo -e "Hola \nMundo\033[4;31mhola"
echo -e "Hola \nMundo\033[4;31mhola\033[0m"
echo -e "Hola \nMundo\033[4;32mhola\033[0m"
echo -e "Hola \nMundo\033[4;34mhola\033[0m"
read -p "Nombre: " nombre
read -s -p "Nombre: " nombre
read -s -p "Nombre: " nombre | echo -e "\n $nombre\n"
ls
cat nuevaprueba.exe
cat nuevaprueba.exe | cut -c 2-6
cat nuevaprueba.exe | cut -c 6
cut -c 2-6 nuevaprueba.exe
cat nuevaprueba.exe | cut -c 1-3,7-10
cat nuevaprueba.exe | cut -c 1,7-10
cat > cut -d: -f2-4
echo "Esto es un texto de prueba" > cut -d: -f2-4
echo "Esto es un texto de prueba" > cut -d ' ' -f2-4
echo "Esto es un texto de prueba" > cut -d' ' -f2-4
echo "Esto es un texto de prueba" | cut -d' ' -f2-4
cat | cut -d: -f2-4
cat | cut -d -f2-4
echo "Esto es un texto de prueba" | cut -d' ' --output-delimiter=':'
echo "Esto es un texto de prueba" | cut -d' ' -f1-10 --output-delimiter=':'
cat | cut -d -f2-4
cat | cut -d' ' --output-delimiter=':'
cat | cut -d' ' -f1-10 --output-delimiter=':'
cat | cut -c 3-
cat | wc
cat | wc -l
ls
tar -h
tar --help
ls
tar -cvf paquete.tar alrevez.exe nuevaprueba.exe prueba.exe
ls
tar -tvf paquete.tar alrevez.exe nuevaprueba.exe prueba.exe
tar -tvf paquete.tar
ls
tar -cvf paquete.tar.gz alrevez.exe nuevaprueba.exe prueba.exe
ls
rm paquete.tar.gz
ls
tar -cvzf paquete.tar.gz alrevez.exe nuevaprueba.exe prueba.exegz
ls
tar --help
tar
tar -tvzf paquete.tar.gz
tar -tvf paquete.tar.gz
gzip paquete.tar
tar -cvf paquete.tar alrevez.exe nuevaprueba.exe prueba.exe
ls
ls -d
ls -f
ls -d ~/
ls -d ~/*
ls -d *
ls -d */
ls -f */
ls -f *
ls -f 
ls -d */
ls -d */*
ls *
mkdir -p /home/joaco/CSO2022/RECURSION/recursivo
ls *
ls ~/CSO2022/*
ls -R *
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/recursivo/archivo.txt
ls -R *
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/recursivo/archivo2.txt
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/recursivo/archivo3.txt
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/recursivo/archivo5.exe
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/recursivo/archivo6.exe
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/recursivo/archivo7.exe
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/.exe
mkdir -p /home/joaco/CSO2022/RECURSION/otrocamino
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/otrocamino/archivo.exe
echo "Hola prueba" | cat > /home/joaco/CSO2022/RECURSION/otrocamino/archivo.exe
echo "Para probar xd" | cat > /home/joaco/CSO2022/RECURSION/otrocamino/archivo.exe
echo "Hola prueba" | cat > /home/joaco/CSO2022/RECURSION/otrocamino/archivo2.exe
echo "Hola prueba" | cat > /home/joaco/CSO2022/RECURSION/otrocamino/archivo3.txt
ls -R ~
ls *
ls -d *
ls -s *
ls -R -s *
ls -R -l
ls -l
ls -l -H
ls -l -h
ls -lh
ls -l
ls -l -h
arreglo=(1 2 3 4 5 8 13 21)
arreglo[2]=spam
echo "Elemento ${arreglo[0]}"
echo "Elemento ${arreglo[2]}"
echo "Elemento ${arreglo[*]}"
echo "Elemento ${#arreglo[*]}"
echo "Elemento $(ls)"
echo 'Elemento $(ls)'
variable="un texto de varias palabras"
variable_2=UnaSolaPalabra
echo "$variable"
echo '$variable'
echo "$variable algo mas"
echo "$variable_2 algo mas"
variable_3="$variable_2 algo mas"
echo "$variable_3"
mkdir -m 777 ~/practica3 
ls -l
cd ./practica3
cd ..
cd ./practica3
touch HolaMundo.sh
ls
nano Hola
ls
nano HolaMundo.sh
cat HolaMundo.sh
HolaMundo.sh
./HolaMundo.sh
chmod 777 ./HolaMundo.sh
./HolaMundo.sh
nano HolaMundo.sh
nano Estructuras.sh
cat Estructuras.sh
chmod 777 Estructuras.sh
./Estructuras.sh
cat -n Estructuras.sh
nano Estructuras.sh
./Estructuras.sh
nano Estructuras.sh
./Estructuras.sh
nano Estructuras.sh
./Estructuras.sh 1 STRING 0 1 2
nano Estructuras.sh
./Estructuras.sh 1 STRING 0 1 2
cat -n Estructuras.sh
nano Estructuras.sh
./Estructuras.sh 1 STRING 0 1 2
nano Estructuras.sh
./Estructuras.sh 1 STRING 0 1 2
nano Estructuras.sh
./Estructuras.sh 1 STRING 0 1 2
./Estructuras.sh 7 STRING 0 1 2
./Estructuras.sh 7 STRIN 0 1 2
vi Estructuras.sh
nano Estructuras.sh
./Estructuras.sh 7 STRIN 0 1 2
nano Estructuras.sh
./Estructuras.sh 7 STRIN 0 1 2
./Estructuras.sh 7 STRIN 0 1 7
nano Estructuras.sh
./Estructuras.sh 7 STRIN 0 5 7
./Estructuras.sh 7 STRING 0 5 7
nano Estructuras.sh
./Estructuras.sh 7 STRING 0 5 7
nano Estructuras.sh
./Estructuras.sh 7 STRING 0 5 7
nano Estructuras.sh
./Estructuras.sh 7 STRING 0 5 7
nano Estructuras.sh
./Estructuras.sh 7 STRING 0 5 
cd ..
mkdir -v -m 777 practica-shell-script
ls -l
chmod g-w,o-rw practica-shell-script
ls -l
cd ./practica-shell-script
touch mostrar.sh
chmod 777 mostrar.sh
ls -l
cd ./practica-shell-script
nano mostrar.sh
./mostrar.sh
whoami
nano mostrar.sh
whoami
./mostrar.sh
echo "$?"
echo "$var"
cd ..
nano ./practica3/Estructuras.sh
cd ./practica3
./Estructuras.sh
./Estructuras.sh 5
./Estructuras.sh 5 STRING 5 4 8
./Estructuras.sh 5 STRING 5 4 8 5
echo "$?"
printenv
VAriaBLE="cadena"
arreGLO=(1 2 3 4 5 6)
let nuMEro=10
printenv
echo "$VAriaBLE"
export $VAriaBLE
printenv
expr 1 | 5
expr 1 
expr ( 1 | 5 ) 
expr ( 1 + 5 ) 
expr (1 + 5) 
expr 1 + 5 
expr 1 & 5 
expr 1 \& 5 
expr 0 \& 5 
expr 0 \| 5 
expr 7 \| 5 
expr 7 \| 0
expr 7 \& 0
expr 7 \& 5
[ 1 = 1 ]
echo "$?"
[ 1 = 2 ]
echo "$?"
[ 1 = 6 ]
echo "$?"
( 1 + 1 )
expr 7 \< 5
expr 7 \> 5
expr 7 > 5
echo "$?"
expr 7 < 5
echo "$?"
expr 8 / 2
expr 8 \/ 2
expr 8 * 2
expr 8 \* 2
expr 8 \< 2
expr 8 < 2
expr 8 \> 2
expr 8 > 2
expr 2 > 8
expr 2 ">" 8
expr 2 ">" 1
expr 2 ">" 1 "|" 9 "<" 5
expr 2 ">" 5 "|" 9 "<" 5
expr 2 + 9
expr 2 + 9p
expr 2 + "9p"
expr "2" + "9"
expr "2" "+" "9"
expr "2" "=" "9"
expr "2" = "9"
expr "2" = "2"
expr 2 = 2
expr 9 / 2
expr 9 % 2
expr 9 | 2
expr 9 "|" 2
expr 9 "&" 2
expr 9 "&" 0
expr 9 "|" 0
expr 0 "|" 7
expr 0 "&" 7
expr 0 "-" 7
expr 0 "-" 7 "|" 9
expr 7 "-" 7 "|" 9
expr "HOLA" : "HOLA"
expr "HOLA" : "HOLa"
expr "HOLA" : "Holaa"
expr "HOLA" : "HOLA cja"
expr "HOLAS" : "HOLA"
expr "no entiendo HOLAS" : "HOLA"
expr "HOLAS que" : "HOLA"
expr "HOLAS que" : "HOLA CHau"
cadena=abcABC123ABCabc
echo ${cadena:0}
echo ${cadena:2}
echo ${cadena:-2}
echo ${cadena: -2}
echo ${cadena: -8}
echo ${cadena: -0}
echo ${cadena: -8:2}
echo ${cadena: -8: -2}
echo ${cadena: -8:-2}
echo ${cadena: -8:0}
echo ${cadena: -8:10}
echo ${cadena: -8: -3}
echo ${cadena: -8: 3}
cd practica3
echo "$cadena"
expr $cadena match "abc"
expr match $cadena "abc"
expr match $cadena 'abc'
expr match $cadena 'ABC'
expr match $cadena '*ABC'
expr match $cadena '*ABC*'
expr index $cadena 'ABC'
expr index $cadena 'AC'
expr index $cadena 'A'
expr index $cadena 'b'
expr index $cadena 'B'
expr index $cadena '7'
expr substr $cadena 4 3
expr match $cadena "abc"
expr match $cadena "abcABC"
expr match $cadena "abcABC122"
expr match $cadena "abcABC12"
expr match $cadena "abcABC123ABCabc"
expr match $cadena "abcABC123ABCabclk"
expr match $cadena "abcABC123ABCabc"
echo ${cadena#ABC}
echo ${cadena#abc}
echo ${cadena%abc}
echo ${cadena/abc}
echo ${cadena/abc/123}
echo ${cadena//abc/123}
echo ${cadena//abc/123/123/456}
echo ${cadena//abc/123}
echo ${cadena//ABC/123}
echo ${cadena/ABC/123}
touch punto12.sh
ls -l
chmod 777 punto12.sh
ls -l
nano punto12.sh
./punto12.sh
./punto12.sh 8 5 *
./punto12.sh 8 5 "*"
nano punto12.sh
./punto12.sh 8 5 +
cat -n punto12.sh
nano punto12.sh
./punto12.sh 8 5 +
nano punto12.sh
./punto12.sh 8 + 5
./punto12.sh 8 - 5
./punto12.sh 8 / 5
./punto12.sh 8 * 5
./punto12.sh 8 \* 5
./punto12.sh 8 \*
nano punto12.sh
touch punto13.sh
chmod 777 punto13.sh
nano punto13.sh
./punto13
./punto13.sh
nano punto13.sh
./punto13.sh
mv ./punto13 ./punto13a
mv -a -f ./punto13.sh ./punto13a.sh
mv -f ./punto13.sh ./punto13a.sh
ls
./punto13a.sh
nano punto13b.sh
./punto13b.sh
chmod 777 punto13b.sh
./punto13b.sh
nano punto13b.sh
./punto13b.sh
nano punto13b.sh
./punto13b.sh
> punto13c.sh
ls
chmod 777 punto13c.sh
nano punto13c.sgh
nano punto13c.sh
./punto13c.sh
cat -n punto13c.sh
nano punto13c.sh
./punto13c.sh
nano punto13c.sh
./punto13c.sh
nano punto13c.sh
./punto13c.sh
nano punto13c.sh
./punto13c.sh
nano punto13c.sh
./punto13c.sh
./punto13c.sh 4 5
./punto13c.sh /home/joaco/CSO2022
./punto13c.sh /home/joaco/CSO2022/cso2022
./punto13c.sh /home/joaco/practica3
./punto13c.sh /home/joaco/practica3/punto14.sh
chmod 777 punto14.sh
ls
nano punto14.sh
mkdir pruebas
ls
touch ./pruebas/archivo{1..5}.txt
ls ./pruebas/
./punto14.sh /home/joaco/practica3/ -a HOLA
cat -n punto14.sh
nano punto14.sh
./punto14.sh /home/joaco/practica3/ -a HOLA
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
ls ./pruebas
nano punto14.sh
ls ./pruebas
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
ls ./pruebas
cat -n punto14.sh
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -a HOLA
./punto14.sh /home/joaco/practica3/pruebas -b HOLA
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -b HOLA[A
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -b HOLA
./punto14.sh /home/joaco/practica3/pruebas -b inicio
./punto14.sh /home/joaco/practica3/pruebas -a fin
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas -b inicio
cd ./practica3
ls
nano Estructuras.sh
ls
cd ..
ls
man ls
./practica3/punto13c
./practica3/punto13c.sh
./practica3/punto13c.sh 2
./practica3/punto13c.sh 2 4 5 7
ls
ls -d
ls -d .
ls -d ./*
ls -d *
find ~/ -type f
find ~/ -type f -prune
find ~/ -type f -maxdepth 1
find ~/ -maxdepth 1 -type f
find ~/ -maxdepth 0 -type f
find ~/ -maxdepth 1 -type f
find $HOME -maxdepth 1 -type f
find ~/practica3/ -maxdepth 1 -type f
cadena=abcABC123ABCabc.txt
echo "$cadena"
echo "${cadena:$(expr index $cadena '.'):-1}"
echo "${cadena:$(expr index $cadena '.')}"
echo "${cadena:$(expr index $cadena '.' - 1)}"
cadena=abcABC123ABCabc
echo "${cadena:$(expr index $cadena '.' - 1)}"
cadena=abcABC123ABCabc.txt
cadena=/home/joaco/abc.txt
echo "${cadena:$(expr index $cadena '.' - 1)}"
echo "${cadena:$(expr index $cadena '/' - 1)}"
echo "${cadena:$(expr lastindex $cadena '/' - 1)}"
man index
man expr
echo "${cadena##. }"
echo "${cadena##'.' }"
echo "${cadena#'.' }"
echo "${cadena%'.' }"
echo "${cadena%'.'}"
echo "${cadena%/}"
echo "${cadena/%./HOLA.}"
echo "${cadena/%.*/HOLA.}"
echo "${cadena/%%.*/HOLA.}"
echo "${cadena/#.*/HOLA.}"
echo "${cadena/##.*/HOLA.}"
echo "${cadena/%.*/HOLA.}"
echo "${cadena/%.*}"
echo "${cadena/#.*}"
echo "${cadena:%.*}"
echo "${cade}"
echo "${cadena/.*}"
echo "${cadena/%/*}"
echo "${cadena/%/}"
echo "${cadena/%\/*}"
echo "${cadena/#\/*}"
echo "${cadena/#\/}"
echo "${cadena/%\/}"
echo "${cadena/%\/*}"
echo "${cadena/%"/*"}"
echo "${cadena/%"\/*"}"
echo "${cadena/%"\/\*"}"
echo "${cadena/%\/*}"
echo ${cadena} | cut -d'/' -f-1
echo ${cadena} | cut -d'/' -f1
echo ${cadena} | cut -d'\/' -f-1
echo ${cadena} | cut -d'/' -f-1
echo ${cadena}
echo ${cadena} | cut -d'.' -f-1
echo ${cadena} | cut -d'.' -f
echo ${cadena} | cut -d'.' -f2
echo ${cadena} | cut -d'.' -f1
echo ${cadena} | cut -d'.' -f1 --complement
echo ${cadena} | cut -d''' -f1 --complement
echo ${cadena} | cut -d''' -f1 --complement
echo ${cadena} | cut -d'/' -f1 --complement
echo ${cadena} | cut -d'/' -f1-6 --complement
echo ${cadena} | cut -d'/' -f(1-6) --complement
echo ${cadena} | cut -d'/' -f1-2 --complement
echo ${cadena} | cut -d'/' -f1-3 --complement
echo ${cadena} | cut -d'/' -f1 --complement
echo ${cadena} | cut -d'/' -f2 --complement
echo ${cadena} | cut -d'/' -f3 --complement
echo ${cadena} | cut -d'/' -f-1 --complement
echo ${cadena} | cut -d'/' -f1 --complement
echo ${cadena} |cut -d'/' -f1-$(echo $cadena | cup -d'/' | wc -w) --complement
echo ${cadena} |cut -d'/' -f1-$(echo $cadena | cut -d'/' | wc -w) --complement
echo ${cadena} |cut -d'/' -f1-$(echo $cadena | cut -d'/' -f1-100 | wc -w) --complement
echo $(echo $cadena | cut -d'/' -f1-100 | wc -w)
echo $(echo $cadena | cut -d'/' --output-delimiter='' | wc -w)
echo $(echo $cadena | cut -d'/' --output-delimiter=' ' | wc -w)
echo $(echo $cadena | cut -d'/' --output-delimiter=' ' -f1-100 | wc -w)
echo ${cadena} |cut -d'/' -f1-$(echo $cadena | cut -d'/' --output-delimiter=' ' -f1-100 | wc -w) --complement
touch ./practica3/pruebas/ archivo{1..5}.txt
cd ./practica3
cd ./pruebas
touch archivo{1..5}.txt
cd ..
./punto14 /home/joaco/practica3/pruebas/ -a Fin
./punto14.sh /home/joaco/practica3/pruebas/ -a Fin
./punto14.sh /home/joaco/practica3/pruebas/ -b Inicio
nano punto14.sh
./punto14.sh /home/joaco/practica3/pruebas/ -b Inicio
touch ./pruebas/archivo{1..5}.txt
ls ./pruebas
ls ./pruebas/
touch ./pruebas/archivo{1..5}.txt
ls ./pruebas/
./punto14.sh /home/joaco/practica3/pruebas/ -b un
                                                                                                                                                              ls -al /dev/disk/by-uuid/
ls -al /dev/disk/
ls -al /dev/disk/by-path/
/dev
cd /dev
ls
cd vboxguest
nano vboxguest
sudo mkdir /media/compartida
su
cd /media/compartida
ls
nano 3_cadena.sh
cd practica3
ls
nano punto14.sh
./ejemplos/3_cadena.sh /home/joaco/practica3/prueba -c hola
./ejemplos/3_cadena.sh /home/joaco/practica3/pruebas -c hola
./ejemplos/3_cadena.sh /home/joaco/practica3/pruebas -a hola
ls pruebas
./ejemplos/3_cadena.sh /home/joaco/practica3/pruebas -b chau
ls pruebas
./punto14.sh /home/joaco/practica3/pruebas -a bien
ls pruebas
touch punto16.sh
chmod 777 punto16.sh
ls -l
nano punto16
ls -l
rm punto16
ls -l
nano punto16.sh
./punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
cat -n ./punto16.sh
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
./punto16.sh txt
nano punto16.sh
find $HOME -name "*.$1" | wc -l
find $HOME -name "*.txt" | wc -l
find $HOME -name "*.exe" | wc -l
cat /etc/passwd
cat /etc/passwd | cut -d -f1
cat /etc/passwd | cut -d: -f1
cat /etc/passwd | cut -d: -f6
cat /etc/passwd
ls
cd practica3
ls
                                                                                                                                                                                                                                                                                  su
cd practica3
ls
chmod 777 punto19.sh
ls
./punto19.sh
./punto18.sh joaco
./punto18.sh root
./punto18.sh joaco
./punto18.sh root
who
./punto18.sh anuel
chmod 777 punto20.sh
punto20.sh
./punto20.sh
ls
./punto20.s
./punto20.sh
./punto22.sh
chmod 777 ./punto22.sh
./punto22.sh
chmod 777 ./punto23.sh
./punto23.sh
chmod 777 ./punto23.sh
./punto23.sh
cat -n punto23
cat -n punto23.sh
./punto23.sh
practica3
cd practica3
./punto23
./punto23.sh
cat -n ./punto23.sh
./punto23.sh
chmod 777 ./punto23.sh
./punto23.sh
cat /etc/passwd
cat -H /etc/passwd
cat  /etc/passwd
groups joaco
groups colord
groups usbmux
./punto25.sh
./punto25.sh -i
./punto25.sh -l
./punto25.sh -i
./punto25.sh -l
./punto25.sh -b
./punto25.sh -b 6
./punto25.sh -b 1
./punto25.sh -b 0
./punto25.sh -b 2
./punto25.sh -b -1
./punto25.sh -b 1 8
./punto26.sh /home /joaco /joaco /home /home/joaco 45 /home/joaco/alrevez.exe / / /no /home/joaco/practica3/punto26.sh
./punto27.sh
./punto28.sh /home/joac
./punto28.sh /home/joaco
./punto28.sh /home/joaco/practica3
find -type f -name "*.doc" $HOME

find $HOME -type f -name "*.doc"
find $HOME -type f -name "*.exe"
find $HOME -type f -name "*.txt"
find $HOME -type f -name "*.exe"
cd ..
touch CSO2022
touch ./CSO2022/documento{1..5}.doc
find $HOME -type f -name "*.doc"
cd practica3
ls
chmod 777 punto29.sh
./punto29.sh
practica3
cd practica3
touch punto24.sh
chmod 777 ./punto24.sh
./punto24.sh
ls -l
./punto25.sh
groupadd users
su
cat > punto30.sh
chmod 777 punto30.sh
nano punto30.sh
./punto30.sh
nano punto30.sh
./punto30.sh
cd ../../media/cdrom1
cd ../..
cd ../../../media/cdrom1
ls
su
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     cd ~
exit
echo $HOME
su invitado
sudo
su
exit
who
cat /etc/passwd
cd /etc
ls
nano sudoers
su
su invitado
su
exit
who
exit
init 0
sudo init
sudo init 0
cd /etc
ls
sudo cat ./sudoers
sudo passwd invitado
su invitado
who
ls -l
file
file practica3
file Probando
file prueba
file prueba.exe
file prueba.sh
alrevez.exe
file alrevez.exe
file docHome.doc
file paquete.tar
file paquete.tar.gz
cd /etc/init.d
ls
cd ..
ls
cat rc2.d
cd rc2.d
ls
ls -l
ls
cd ~/practica3
./punto27
./punto27.sh
cd /etc/init.d
ls
cd ..
cd rc2.d
ls -l
cd ~
ls
ls -l
cat > invitado
ls -l
chown invitado invitado
sudo chown invitado invitado
ls -l
sudo chown joaco invitado
ls -l
sudo chown invitado:users invitado
ls -l
cat Probando
chmod 700 Probando
ls -l
chmod 600 Probando
ls -l
su
exit
su
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            /media
cd media
cd ./media
ls
cd /media
ls
su
cd /home
cd joaco
ls
ls /media
ls /media/compartida
mv /media/compartida/Simulador.tar.gz /home/joaco
ls
tar -xvfz Simulador Simulador.tar.gz
tar -xvf Simulador Simulador.tar.gz
tar -xvfz Simulador.tar.gz
tar -xvfz /home/joaco/Simulador.tar.gz
tar -cxvfz /home/joaco/Simulador /home/joaco/Simulador.tar.gz
ps
ps -A
ps -r
ps -x
ps -f
ps -f -A
man top
ps -C punto
ps -C "*punto*"
ps -C top
pstree
xkill
top
top
htop
sudo apt -get install htop
sudo apt-get install htop
htop
cd practica3
ls
./punto18.sh& root
./punto18.sh root &
./punto18.sh root
./punto18.sh root$
./punto18.sh root $
cd practica_shell_scripting
ls
cd practica-shell-script
ls
chmod 777 p4p2.c
ls
gcc p4p2.c
GCC p4p2.c
gcc p4p2.c -o p4p2
cd practica3
ls
./punto12.sh
./punto12.sh 4 + 5
./punto12.sh 4 5 +
cd Simulador4
cd Simulador
ls{
ls
qplanif
./qplanif
cd Simulador
./qplanif
ls
./Simulador/qplanif
ls
cd practica-shell-script
ls
man pipe
man bash
env
man who
who -a
who
exit
ls
cd /media
ls
sudo compartir.sh
sudo ./compartir.sh
cd /media
ls
cp /media/compartir.sh /media/compartida/compartir.sh
sudo /media/comaprtir.sh
sudo /media/compartir.sh
