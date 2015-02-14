#!/bin/bash
# PriCliEd v.0.1
# (c) Catalin Stoian, catalin dot stoian at email dot cz
# https://github.com/catalinstoian/PriCliEd
# PriCliEd is released under LICENCE PUBLIQUE RIEN À BRANLER, Version 1

CWD=$(pwd)

cyan='\033[0;36m'
NC='\033[0m' # no color

f-newfile ()
{
clear
cd $CWD
echo "Existing files:"
ls $CWD
read -p "Type a name for your new file:" filename
clear
read -p "Press Return to start writing. Press CTRL-C to save and exit."
clear
f-newline
}

f-newline ()
{
read -p " " text
echo $text >> $filename
clear
cat $filename
f-newline
}

f-viewfile ()
{
cd $CWD
echo "Select the file you would like to view:"
ls $CWD
read filename
pr -o 5 --width=65 $filename | more
}

f-editfile ()
{
clear
cd $CWD
ls $CWD
echo "Select the file you would like to edit:"
read filename
clear
read -p "Press Return to start writing. Press CTRL-C to save and exit."
clear
cat $filename
f-newline
}

f-priclied ()
{
clear
echo -e "                                                                                
  ${cyan}PriCliEd${NC} - Primitive command-line Text Editor                             
                                                                                
  No Backspace, no Undo, no Edit. Just press Return to save every new line.     
                                                                                
  1: ${cyan}New${NC}  File                                                                 
  2: ${cyan}View${NC} File                                                                 
  3: ${cyan}Edit${NC} File                                                                 
                                                                                
  q: ${cyan}quit${NC}                                                                       
                                                                                
                                                                                "

read -s -n 1 NUM
choice
}
choice ()
{
case $NUM in
1) clear ; f-newfile ; f-priclied ;;
2) clear ; f-viewfile ; f-priclied ;;
3) clear ; f-editfile ; f-priclied ;;
q) echo "Quit" ; sleep 1 ; clear ; exit 0 ;;
*) f-priclied ;;
esac
}
NUM=$1
if [ -n $1 ] ; then
    choice
else
    f-priclied
fi
