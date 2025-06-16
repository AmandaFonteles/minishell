#!/bin/bash

LOGFILE="valgrind_test_log.txt"
echo "[TEST LOG - $(date)]" > "$LOGFILE"

echo 'Running test #1: ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️


echo 'Running test #3: $> \n (touche entrée)' >> "$LOGFILE"
echo "$> \n (touche entrée)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #4: $> [que des espaces]' >> "$LOGFILE"
echo "$> [que des espaces]
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #5: $> [que des tabulations]' >> "$LOGFILE"
echo "$> [que des tabulations]
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #6: $> | hola' >> "$LOGFILE"
echo "$> | hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #7: $> "hola"' >> "$LOGFILE"
echo "$> "hola"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #8: $> 'hola'' >> "$LOGFILE"
echo "$> 'hola'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #9: $> ABC=hola' >> "$LOGFILE"
echo "$> ABC=hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #10: $> 4ABC=hola' >> "$LOGFILE"
echo "$> 4ABC=hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #11: $> hola que tal' >> "$LOGFILE"
echo "$> hola que tal
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #12: $> Makefile' >> "$LOGFILE"
echo "$> Makefile
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #13: $> echo' >> "$LOGFILE"
echo "$> echo
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #14: $> echo -n' >> "$LOGFILE"
echo "$> echo -n
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #15: $> echo Hola' >> "$LOGFILE"
echo "$> echo Hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #16: $> echoHola' >> "$LOGFILE"
echo "$> echoHola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #17: $> echo-nHola' >> "$LOGFILE"
echo "$> echo-nHola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #18: $> echo -n Hola' >> "$LOGFILE"
echo "$> echo -n Hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #19: $> echo "-n" Hola' >> "$LOGFILE"
echo "$> echo "-n" Hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #20: $> echo -nHola' >> "$LOGFILE"
echo "$> echo -nHola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #21: $> echo Hola -n' >> "$LOGFILE"
echo "$> echo Hola -n
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #22: $> echo Hola Que Tal' >> "$LOGFILE"
echo "$> echo Hola Que Tal
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #23: $> echo         Hola' >> "$LOGFILE"
echo "$> echo         Hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #24: $> echo    Hola     Que    Tal' >> "$LOGFILE"
echo "$> echo    Hola     Que    Tal
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #25: $> echo      \n hola' >> "$LOGFILE"
echo "$> echo      \n hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #26: $> echo "         " | cat -e' >> "$LOGFILE"
echo "$> echo "         " | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #27: $> echo           | cat -e' >> "$LOGFILE"
echo "$> echo           | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #28: $> ""''echo hola""'''' que""'' tal""''' >> "$LOGFILE"
echo "$> ""''echo hola""'''' que""'' tal""''
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #29: $> echo -n -n' >> "$LOGFILE"
echo "$> echo -n -n
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #30: $> echo -n -n Hola Que' >> "$LOGFILE"
echo "$> echo -n -n Hola Que
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #31: $> echo -p' >> "$LOGFILE"
echo "$> echo -p
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #32: $> echo -nnnnn' >> "$LOGFILE"
echo "$> echo -nnnnn
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #33: $> echo -n -nnn -nnnn' >> "$LOGFILE"
echo "$> echo -n -nnn -nnnn
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #34: $> echo -n-nnn -nnnn' >> "$LOGFILE"
echo "$> echo -n-nnn -nnnn
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #35: $> echo -n -nnn hola -nnnn' >> "$LOGFILE"
echo "$> echo -n -nnn hola -nnnn
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #36: $> echo -n -nnn-nnnn' >> "$LOGFILE"
echo "$> echo -n -nnn-nnnn
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #37: $> echo --------n' >> "$LOGFILE"
echo "$> echo --------n
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #38: $> echo -nnn --------n' >> "$LOGFILE"
echo "$> echo -nnn --------n
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #39: $> echo -nnn -----nn---nnnn' >> "$LOGFILE"
echo "$> echo -nnn -----nn---nnnn
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #40: $> echo -nnn --------nnnn' >> "$LOGFILE"
echo "$> echo -nnn --------nnnn
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #41: $> echo $' >> "$LOGFILE"
echo "$> echo $
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #42: $> echo $?' >> "$LOGFILE"
echo "$> echo $?
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #43: $> echo $?$' >> "$LOGFILE"
echo "$> echo $?$
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #44: $> echo $? | echo $? | echo $?' >> "$LOGFILE"
echo "$> echo $? | echo $? | echo $?
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #45: $> echo $:$= | cat -e' >> "$LOGFILE"
echo "$> echo $:$= | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #46: $> echo " $ " | cat -e' >> "$LOGFILE"
echo "$> echo " $ " | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #47: $> echo ' $ ' | cat -e' >> "$LOGFILE"
echo "$> echo ' $ ' | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #48: $> echo $HOME' >> "$LOGFILE"
echo "$> echo $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #49: $> echo \$HOME' >> "$LOGFILE"
echo "$> echo \$HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #50: $> echo my shit terminal is [$TERM]' >> "$LOGFILE"
echo "$> echo my shit terminal is [$TERM]
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #51: $> echo my shit terminal is [$TERM4' >> "$LOGFILE"
echo "$> echo my shit terminal is [$TERM4
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #52: $> echo my shit terminal is [$TERM4]' >> "$LOGFILE"
echo "$> echo my shit terminal is [$TERM4]
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #53: $> echo $UID' >> "$LOGFILE"
echo "$> echo $UID
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #54: $> echo $HOME9' >> "$LOGFILE"
echo "$> echo $HOME9
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #55: $> echo $9HOME' >> "$LOGFILE"
echo "$> echo $9HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #56: $> echo $HOME%' >> "$LOGFILE"
echo "$> echo $HOME%
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #57: $> echo $UID$HOME' >> "$LOGFILE"
echo "$> echo $UID$HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #58: $> echo Le path de mon HOME est $HOME' >> "$LOGFILE"
echo "$> echo Le path de mon HOME est $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #59: $> echo $USER$var\$USER$USER\$USERtest$USER' >> "$LOGFILE"
echo "$> echo $USER$var\$USER$USER\$USERtest$USER
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #60: $> echo $hola*' >> "$LOGFILE"
echo "$> echo $hola*
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #61: $> echo -nnnn $hola' >> "$LOGFILE"
echo "$> echo -nnnn $hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #62: $> echo > <' >> "$LOGFILE"
echo "$> echo > <
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #63: $> echo | |' >> "$LOGFILE"
echo "$> echo | |
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #64: $> EechoE' >> "$LOGFILE"
echo "$> EechoE
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #65: $> .echo.' >> "$LOGFILE"
echo "$> .echo.
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #66: $> >echo>' >> "$LOGFILE"
echo "$> >echo>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #67: $> <echo<' >> "$LOGFILE"
echo "$> <echo<
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #68: $> >>echo>>' >> "$LOGFILE"
echo "$> >>echo>>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #69: $> |echo|' >> "$LOGFILE"
echo "$> |echo|
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #70: $> |echo -n hola' >> "$LOGFILE"
echo "$> |echo -n hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #71: $> echo *' >> "$LOGFILE"
echo "$> echo *
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #72: $> echo '*'' >> "$LOGFILE"
echo "$> echo '*'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #73: $> echo D*' >> "$LOGFILE"
echo "$> echo D*
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #74: $> echo *Z' >> "$LOGFILE"
echo "$> echo *Z
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #75: $> echo *t hola' >> "$LOGFILE"
echo "$> echo *t hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #76: $> echo *t' >> "$LOGFILE"
echo "$> echo *t
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #77: $> echo $*' >> "$LOGFILE"
echo "$> echo $*
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #78: $> echo hola*hola *' >> "$LOGFILE"
echo "$> echo hola*hola *
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #79: $> echo $HOME*' >> "$LOGFILE"
echo "$> echo $HOME*
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #80: $> echo $""' >> "$LOGFILE"
echo "$> echo $""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #81: $> echo "$"""' >> "$LOGFILE"
echo "$> echo "$"""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #82: $> echo '$'''' >> "$LOGFILE"
echo "$> echo '$'''
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #83: $> echo $"HOME"' >> "$LOGFILE"
echo "$> echo $"HOME"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #84: $> echo $''HOME' >> "$LOGFILE"
echo "$> echo $''HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #85: $> echo $""HOME' >> "$LOGFILE"
echo "$> echo $""HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #86: $> echo "$HO"ME' >> "$LOGFILE"
echo "$> echo "$HO"ME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #87: $> echo '$HO'ME' >> "$LOGFILE"
echo "$> echo '$HO'ME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #88: $> echo "$HO""ME"' >> "$LOGFILE"
echo "$> echo "$HO""ME"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #89: $> echo '$HO''ME'' >> "$LOGFILE"
echo "$> echo '$HO''ME'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #90: $> echo "'$HO''ME'"' >> "$LOGFILE"
echo "$> echo "'$HO''ME'"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #91: $> echo ""$HOME' >> "$LOGFILE"
echo "$> echo ""$HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #92: $> echo "" $HOME' >> "$LOGFILE"
echo "$> echo "" $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #93: $> echo ''$HOME' >> "$LOGFILE"
echo "$> echo ''$HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #94: $> echo '' $HOME' >> "$LOGFILE"
echo "$> echo '' $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #95: $> echo $"HO""ME"' >> "$LOGFILE"
echo "$> echo $"HO""ME"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #96: $> echo $'HO''ME'' >> "$LOGFILE"
echo "$> echo $'HO''ME'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #97: $> echo $'HOME'' >> "$LOGFILE"
echo "$> echo $'HOME'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #98: $> echo "$"HOME' >> "$LOGFILE"
echo "$> echo "$"HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #99: $> echo $=HOME' >> "$LOGFILE"
echo "$> echo $=HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #100: $> echo $"HOLA"' >> "$LOGFILE"
echo "$> echo $"HOLA"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #101: $> echo $'HOLA'' >> "$LOGFILE"
echo "$> echo $'HOLA'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #102: $> echo $DONTEXIST Hola' >> "$LOGFILE"
echo "$> echo $DONTEXIST Hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #103: $> echo "hola"' >> "$LOGFILE"
echo "$> echo "hola"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #104: $> echo 'hola'' >> "$LOGFILE"
echo "$> echo 'hola'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #105: $> echo ''hola''' >> "$LOGFILE"
echo "$> echo ''hola''
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #106: $> echo ''h'o'la''' >> "$LOGFILE"
echo "$> echo ''h'o'la''
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #107: $> echo "''h'o'la''"' >> "$LOGFILE"
echo "$> echo "''h'o'la''"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #108: $> echo "'"h'o'la"'"' >> "$LOGFILE"
echo "$> echo "'"h'o'la"'"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #109: $> echo"'hola'"' >> "$LOGFILE"
echo "$> echo"'hola'"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #110: $> echo "'hola'"' >> "$LOGFILE"
echo "$> echo "'hola'"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #111: $> echo '"hola"'' >> "$LOGFILE"
echo "$> echo '"hola"'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #112: $> echo '''ho"''''l"a'''' >> "$LOGFILE"
echo "$> echo '''ho"''''l"a'''
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #113: $> echo hola""""""""""""' >> "$LOGFILE"
echo "$> echo hola""""""""""""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #114: $> echo hola"''''''''''"' >> "$LOGFILE"
echo "$> echo hola"''''''''''"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #115: $> echo hola''''''''''''' >> "$LOGFILE"
echo "$> echo hola''''''''''''
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #116: $> echo hola'""""""""""'' >> "$LOGFILE"
echo "$> echo hola'""""""""""'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #117: $> e"cho hola"' >> "$LOGFILE"
echo "$> e"cho hola"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #118: $> e'cho hola'' >> "$LOGFILE"
echo "$> e'cho hola'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #119: $> echo "hola     " | cat -e' >> "$LOGFILE"
echo "$> echo "hola     " | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #120: $> echo ""hola' >> "$LOGFILE"
echo "$> echo ""hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #121: $> echo "" hola' >> "$LOGFILE"
echo "$> echo "" hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #122: $> echo ""             hola' >> "$LOGFILE"
echo "$> echo ""             hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #123: $> echo hola""bonjour' >> "$LOGFILE"
echo "$> echo hola""bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #124: $> "e"'c'ho 'b'"o"nj"o"'u'r' >> "$LOGFILE"
echo "$> "e"'c'ho 'b'"o"nj"o"'u'r
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #125: $> ""e"'c'ho 'b'"o"nj"o"'u'r"' >> "$LOGFILE"
echo "$> ""e"'c'ho 'b'"o"nj"o"'u'r"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #126: $> echo "$DONTEXIST"Makefile' >> "$LOGFILE"
echo "$> echo "$DONTEXIST"Makefile
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #127: $> echo "$DONTEXIST""Makefile"' >> "$LOGFILE"
echo "$> echo "$DONTEXIST""Makefile"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #128: $> echo "$DONTEXIST" "Makefile"' >> "$LOGFILE"
echo "$> echo "$DONTEXIST" "Makefile"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #129: $> ?$HOME' >> "$LOGFILE"
echo "$> ?$HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #130: $> $HOME' >> "$LOGFILE"
echo "$> $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #131: $> $HOMEdskjhfkdshfsd' >> "$LOGFILE"
echo "$> $HOMEdskjhfkdshfsd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #132: $> "$HOMEdskjhfkdshfsd"' >> "$LOGFILE"
echo "$> "$HOMEdskjhfkdshfsd"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #133: $> '$HOMEdskjhfkdshfsd'' >> "$LOGFILE"
echo "$> '$HOMEdskjhfkdshfsd'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #134: $> $DONTEXIST' >> "$LOGFILE"
echo "$> $DONTEXIST
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #135: $> $LESS$VAR' >> "$LOGFILE"
echo "$> $LESS$VAR
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #136: $> Ctlr-C' >> "$LOGFILE"
echo "$> Ctlr-C
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #137: $> holaCtlr-C' >> "$LOGFILE"
echo "$> holaCtlr-C
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #138: $> cat (faire Ctlr-C apres avoir fait plusieurs fois [ENTREE])' >> "$LOGFILE"
echo "$> cat (faire Ctlr-C apres avoir fait plusieurs fois [ENTREE])
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #139: $> cat | rev(faire Ctlr-C apres avoir fait plusieurs fois [ENTREE])' >> "$LOGFILE"
echo "$> cat | rev(faire Ctlr-C apres avoir fait plusieurs fois [ENTREE])
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #140: $> Ctlr-D' >> "$LOGFILE"
echo "$> Ctlr-D
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #141: $> hola Ctlr-D' >> "$LOGFILE"
echo "$> hola Ctlr-D
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #142: $> Ctlr-\' >> "$LOGFILE"
echo "$> Ctlr-\
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #143: $> hola Ctlr-\' >> "$LOGFILE"
echo "$> hola Ctlr-\
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #144: $> cat (faire Ctlr-\ apres avoir fait plusieurs fois [ENTREE])' >> "$LOGFILE"
echo "$> cat (faire Ctlr-\ apres avoir fait plusieurs fois [ENTREE])
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #145: $> Ctlr-Z' >> "$LOGFILE"
echo "$> Ctlr-Z
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #146: $> sleep 3 | sleep 3 | sleep 3 (faire Ctlr-C une seconde apres)' >> "$LOGFILE"
echo "$> sleep 3 | sleep 3 | sleep 3 (faire Ctlr-C une seconde apres)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #147: $> sleep 3 | sleep 3 | sleep 3 (faire Ctlr-D une seconde apres)' >> "$LOGFILE"
echo "$> sleep 3 | sleep 3 | sleep 3 (faire Ctlr-D une seconde apres)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #148: $> sleep 3 | sleep 3 | sleep 3 (faire Ctlr-\ une seconde apres)' >> "$LOGFILE"
echo "$> sleep 3 | sleep 3 | sleep 3 (faire Ctlr-\ une seconde apres)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #149: $> env' >> "$LOGFILE"
echo "$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #150: $> env hola' >> "$LOGFILE"
echo "$> env hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #151: $> env hola que tal' >> "$LOGFILE"
echo "$> env hola que tal
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #152: $> env env' >> "$LOGFILE"
echo "$> env env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #153: $> env env env env env' >> "$LOGFILE"
echo "$> env env env env env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #154: $> env ls' >> "$LOGFILE"
echo "$> env ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #155: $> env ./Makefile' >> "$LOGFILE"
echo "$> env ./Makefile
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #156: $> export HOLA=bonjour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #157: $> export       HOLA=bonjour
$> env' >> "$LOGFILE"
echo "$> export       HOLA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #158: $> export' >> "$LOGFILE"
echo "$> export
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #159: $> export Hola
$> export' >> "$LOGFILE"
echo "$> export Hola
$> export
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #160: $> export Hola9hey
$> export' >> "$LOGFILE"
echo "$> export Hola9hey
$> export
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #161: $> export $DONTEXIST' >> "$LOGFILE"
echo "$> export $DONTEXIST
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #162: $> export | grep "HOME"' >> "$LOGFILE"
echo "$> export | grep "HOME"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #163: $> export ""' >> "$LOGFILE"
echo "$> export ""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #164: $> export =' >> "$LOGFILE"
echo "$> export =
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #165: $> export %' >> "$LOGFILE"
echo "$> export %
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #166: $> export $?' >> "$LOGFILE"
echo "$> export $?
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #167: $> export ?=2' >> "$LOGFILE"
echo "$> export ?=2
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #168: $> export 9HOLA=' >> "$LOGFILE"
echo "$> export 9HOLA=
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #169: $> export HOLA9=bonjour
$> env' >> "$LOGFILE"
echo "$> export HOLA9=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #170: $> export _HOLA=bonjour
$> env' >> "$LOGFILE"
echo "$> export _HOLA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #171: $> export ___HOLA=bonjour
$> env' >> "$LOGFILE"
echo "$> export ___HOLA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #172: $> export _HO_LA_=bonjour
$> env' >> "$LOGFILE"
echo "$> export _HO_LA_=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #173: $> export HOL@=bonjour' >> "$LOGFILE"
echo "$> export HOL@=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #174: $> export HOL\~A=bonjour' >> "$LOGFILE"
echo "$> export HOL\~A=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #175: $> export -HOLA=bonjour' >> "$LOGFILE"
echo "$> export -HOLA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #176: $> export --HOLA=bonjour' >> "$LOGFILE"
echo "$> export --HOLA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #177: $> export HOLA-=bonjour' >> "$LOGFILE"
echo "$> export HOLA-=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #178: $> export HO-LA=bonjour' >> "$LOGFILE"
echo "$> export HO-LA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #179: $> export HOL.A=bonjour' >> "$LOGFILE"
echo "$> export HOL.A=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #180: $> export HOL\\\$A=bonjour' >> "$LOGFILE"
echo "$> export HOL\\\$A=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #181: $> export HO\\\\LA=bonjour' >> "$LOGFILE"
echo "$> export HO\\\\LA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #182: $> export HOL}A=bonjour' >> "$LOGFILE"
echo "$> export HOL}A=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #183: $> export HOL{A=bonjour' >> "$LOGFILE"
echo "$> export HOL{A=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #184: $> export HO*LA=bonjour' >> "$LOGFILE"
echo "$> export HO*LA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #185: $> export HO#LA=bonjour' >> "$LOGFILE"
echo "$> export HO#LA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #186: $> export HO@LA=bonjour' >> "$LOGFILE"
echo "$> export HO@LA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #187: $> export HO!LA=bonjour' >> "$LOGFILE"
echo "$> export HO!LA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #188: $> export HO$?LA=bonjour
$> env' >> "$LOGFILE"
echo "$> export HO$?LA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #189: $> export +HOLA=bonjour' >> "$LOGFILE"
echo "$> export +HOLA=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #190: $> export HOL+A=bonjour' >> "$LOGFILE"
echo "$> export HOL+A=bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #191: $> export HOLA+=bonjour
$> env' >> "$LOGFILE"
echo "$> export HOLA+=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #192: $> export HOLA=bonjour
$> export HOLA+=bonjour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bonjour
$> export HOLA+=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #193: $> exportHOLA=bonjour
$> env' >> "$LOGFILE"
echo "$> exportHOLA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #194: $> export HOLA =bonjour' >> "$LOGFILE"
echo "$> export HOLA =bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #195: $> export HOLA = bonjour' >> "$LOGFILE"
echo "$> export HOLA = bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #196: $> export HOLA=bon jour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bon jour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #197: $> export HOLA= bonjour
$> env' >> "$LOGFILE"
echo "$> export HOLA= bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #198: $> export HOLA=bonsoir
$> export HOLA=bonretour
$> export HOLA=bonjour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bonsoir
$> export HOLA=bonretour
$> export HOLA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #199: $> export HOLA=$HOME
$> env' >> "$LOGFILE"
echo "$> export HOLA=$HOME
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #200: $> export HOLA=bonjour$HOME
$> env' >> "$LOGFILE"
echo "$> export HOLA=bonjour$HOME
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #201: $> export HOLA=$HOMEbonjour
$> env' >> "$LOGFILE"
echo "$> export HOLA=$HOMEbonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #202: $> export HOLA=bon$jour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bon$jour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #203: $> export HOLA=bon\jour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bon\jour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #204: $> export HOLA=bon\\jour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bon\\jour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #205: $> export HOLA=bon(jour' >> "$LOGFILE"
echo "$> export HOLA=bon(jour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #206: $> export HOLA=bon()jour' >> "$LOGFILE"
echo "$> export HOLA=bon()jour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #207: $> export HOLA=bon&jour' >> "$LOGFILE"
echo "$> export HOLA=bon&jour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #208: $> export HOLA=bon@jour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bon@jour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #209: $> export HOLA=bon;jour
$> env' >> "$LOGFILE"
echo "$> export HOLA=bon;jour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #210: $> export HOLA=bon!jour' >> "$LOGFILE"
echo "$> export HOLA=bon!jour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #211: $> export HOLA=bon"jour"
$> env' >> "$LOGFILE"
echo "$> export HOLA=bon"jour"
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #212: $> export HOLA$USER=bonjour
$> env' >> "$LOGFILE"
echo "$> export HOLA$USER=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #213: $> export HOLA=bonjour=casse-toi
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA=bonjour=casse-toi
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #214: $> export "HOLA=bonjour"=casse-toi
$> echo $HOLA' >> "$LOGFILE"
echo "$> export "HOLA=bonjour"=casse-toi
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #215: $> export HOLA=bonjour
$> export BYE=casse-toi
$> echo $HOLA et $BYE' >> "$LOGFILE"
echo "$> export HOLA=bonjour
$> export BYE=casse-toi
$> echo $HOLA et $BYE
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #216: $> export HOLA=bonjour BYE=casse-toi
$> echo $HOLA et $BYE' >> "$LOGFILE"
echo "$> export HOLA=bonjour BYE=casse-toi
$> echo $HOLA et $BYE
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #217: $> export $HOLA=bonjour
$> env' >> "$LOGFILE"
echo "$> export $HOLA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #218: $> export HOLA="bonjour      "
$> echo $HOLA | cat -e' >> "$LOGFILE"
echo "$> export HOLA="bonjour      "
$> echo $HOLA | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #219: $> export HOLA="   -n bonjour   "
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA="   -n bonjour   "
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #220: $> export HOLA="bonjour   "/
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA="bonjour   "/
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #221: $> export HOLA='"'
$> echo " $HOLA " | cat -e' >> "$LOGFILE"
echo "$> export HOLA='"'
$> echo " $HOLA " | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #222: $> export HOLA=at
$> c$HOLA Makefile' >> "$LOGFILE"
echo "$> export HOLA=at
$> c$HOLA Makefile
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #223: $> export "" HOLA=bonjour
$> env' >> "$LOGFILE"
echo "$> export "" HOLA=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #224: $> export HOLA="cat Makefile | grep NAME"
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA="cat Makefile | grep NAME"
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #225: $> export HOLA=hey
$> echo $HOLA$HOLA$HOLA=hey$HOLA' >> "$LOGFILE"
echo "$> export HOLA=hey
$> echo $HOLA$HOLA$HOLA=hey$HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #226: $> export HOLA="  bonjour  hey  "
$> echo $HOLA | cat -e' >> "$LOGFILE"
echo "$> export HOLA="  bonjour  hey  "
$> echo $HOLA | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #227: $> export HOLA="  bonjour  hey  "
$> echo """$HOLA""" | cat -e' >> "$LOGFILE"
echo "$> export HOLA="  bonjour  hey  "
$> echo """$HOLA""" | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #228: $> export HOLA="  bonjour  hey  "
$> echo wesh"$HOLA" | cat -e' >> "$LOGFILE"
echo "$> export HOLA="  bonjour  hey  "
$> echo wesh"$HOLA" | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #229: $> export HOLA="  bonjour  hey  "
$> echo wesh""$HOLA.' >> "$LOGFILE"
echo "$> export HOLA="  bonjour  hey  "
$> echo wesh""$HOLA.
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #230: $> export HOLA="  bonjour  hey  "
$> echo wesh$""HOLA.' >> "$LOGFILE"
echo "$> export HOLA="  bonjour  hey  "
$> echo wesh$""HOLA.
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #231: $> export HOLA="  bonjour  hey  "
$> echo wesh$"HOLA HOLA".' >> "$LOGFILE"
echo "$> export HOLA="  bonjour  hey  "
$> echo wesh$"HOLA HOLA".
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #232: $> export HOLA=bonjour
$> export HOLA=" hola et $HOLA"
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA=bonjour
$> export HOLA=" hola et $HOLA"
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #233: $> export HOLA=bonjour
$> export HOLA=' hola et $HOLA'
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA=bonjour
$> export HOLA=' hola et $HOLA'
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #234: $> export HOLA=bonjour
$> export HOLA=" hola et $HOLA"$HOLA
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA=bonjour
$> export HOLA=" hola et $HOLA"$HOLA
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #235: $> export HOLA="ls        -l    - a"
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA="ls        -l    - a"
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #236: $> export HOLA="s -la"
$> l$HOLA' >> "$LOGFILE"
echo "$> export HOLA="s -la"
$> l$HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #237: $> export HOLA="s -la"
$> l"$HOLA"' >> "$LOGFILE"
echo "$> export HOLA="s -la"
$> l"$HOLA"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #238: $> export HOLA="s -la"
$> l'$HOLA'' >> "$LOGFILE"
echo "$> export HOLA="s -la"
$> l'$HOLA'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #239: $> export HOLA="l"
$> $HOLAs' >> "$LOGFILE"
echo "$> export HOLA="l"
$> $HOLAs
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #240: $> export HOLA="l"
$> "$HOLA"s' >> "$LOGFILE"
echo "$> export HOLA="l"
$> "$HOLA"s
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #241: $> export HOL=A=bonjour
$> env' >> "$LOGFILE"
echo "$> export HOL=A=bonjour
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #242: $> export HOLA="l"
$> '$HOLA's' >> "$LOGFILE"
echo "$> export HOLA="l"
$> '$HOLA's
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #243: $> export HOL=A=""
$> env' >> "$LOGFILE"
echo "$> export HOL=A=""
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #244: $> export TE+S=T
$> env' >> "$LOGFILE"
echo "$> export TE+S=T
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #245: $> export ""=""' >> "$LOGFILE"
echo "$> export ""=""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #246: $> export ''=''' >> "$LOGFILE"
echo "$> export ''=''
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #247: $> export "="="="' >> "$LOGFILE"
echo "$> export "="="="
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #248: $> export '='='='' >> "$LOGFILE"
echo "$> export '='='='
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #249: $> export HOLA=p
$> export BYE=w
$> $HOLA"BYE"d' >> "$LOGFILE"
echo "$> export HOLA=p
$> export BYE=w
$> $HOLA"BYE"d
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #250: $> export HOLA=p
$> export BYE=w
$> "$HOLA"'$BYE'd' >> "$LOGFILE"
echo "$> export HOLA=p
$> export BYE=w
$> "$HOLA"'$BYE'd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #251: $> export HOLA=p
$> export BYE=w
$> "$HOLA""$BYE"d' >> "$LOGFILE"
echo "$> export HOLA=p
$> export BYE=w
$> "$HOLA""$BYE"d
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #252: $> export HOLA=p
$> export BYE=w
$> $"HOLA"$"BYE"d' >> "$LOGFILE"
echo "$> export HOLA=p
$> export BYE=w
$> $"HOLA"$"BYE"d
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #253: $> export HOLA=p
$> export BYE=w
$> $'HOLA'$'BYE'd' >> "$LOGFILE"
echo "$> export HOLA=p
$> export BYE=w
$> $'HOLA'$'BYE'd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #254: $> export HOLA=-n
$> "echo $HOLA" hey' >> "$LOGFILE"
echo "$> export HOLA=-n
$> "echo $HOLA" hey
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #255: $> export A=1 B=2 C=3 D=4 E=5 F=6 G=7 H=8
$> echo "$A'$B"'$C"$D'$E'"$F'"'$G'$H"' >> "$LOGFILE"
echo "$> export A=1 B=2 C=3 D=4 E=5 F=6 G=7 H=8
$> echo "$A'$B"'$C"$D'$E'"$F'"'$G'$H"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #256: $> export HOLA=bonjour
$> env
$> unset HOLA
$> env' >> "$LOGFILE"
echo "$> export HOLA=bonjour
$> env
$> unset HOLA
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #257: $> export HOLA=bonjour
$> env
$> unset HOLA
$> unset HOLA
$> env' >> "$LOGFILE"
echo "$> export HOLA=bonjour
$> env
$> unset HOLA
$> unset HOLA
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #258: $> unset PATH
$> echo $PATH' >> "$LOGFILE"
echo "$> unset PATH
$> echo $PATH
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #259: $> unset PATH
$> ls' >> "$LOGFILE"
echo "$> unset PATH
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #260: $> unset ""' >> "$LOGFILE"
echo "$> unset ""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #261: $> unset INEXISTANT' >> "$LOGFILE"
echo "$> unset INEXISTANT
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #262: $> unset PWD
$> env | grep PWD
$> pwd' >> "$LOGFILE"
echo "$> unset PWD
$> env | grep PWD
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #263: $> pwd
$> unset PWD
$> env | grep PWD
$> cd $PWD
$> pwd' >> "$LOGFILE"
echo "$> pwd
$> unset PWD
$> env | grep PWD
$> cd $PWD
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #264: $> unset OLDPWD
$> env | grep OLDPWD' >> "$LOGFILE"
echo "$> unset OLDPWD
$> env | grep OLDPWD
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #265: $> unset 9HOLA' >> "$LOGFILE"
echo "$> unset 9HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #266: $> unset HOLA9' >> "$LOGFILE"
echo "$> unset HOLA9
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #267: $> unset HOL?A' >> "$LOGFILE"
echo "$> unset HOL?A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #268: $> unset HOLA HOL?A' >> "$LOGFILE"
echo "$> unset HOLA HOL?A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #269: $> unset HOL?A HOLA' >> "$LOGFILE"
echo "$> unset HOL?A HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #270: $> unset HOL?A HOL.A' >> "$LOGFILE"
echo "$> unset HOL?A HOL.A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #271: $> unset HOLA=' >> "$LOGFILE"
echo "$> unset HOLA=
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #272: $> unset HOL\\\\A' >> "$LOGFILE"
echo "$> unset HOL\\\\A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #273: $> unset HOL;A' >> "$LOGFILE"
echo "$> unset HOL;A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #274: $> unset HOL.A' >> "$LOGFILE"
echo "$> unset HOL.A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #275: $> unset HOL+A' >> "$LOGFILE"
echo "$> unset HOL+A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #276: $> unset HOL=A' >> "$LOGFILE"
echo "$> unset HOL=A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #277: $> unset HOL{A' >> "$LOGFILE"
echo "$> unset HOL{A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #278: $> unset HOL}A' >> "$LOGFILE"
echo "$> unset HOL}A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #279: $> unset HOL-A' >> "$LOGFILE"
echo "$> unset HOL-A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #280: $> unset -HOLA' >> "$LOGFILE"
echo "$> unset -HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #281: $> unset _HOLA' >> "$LOGFILE"
echo "$> unset _HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #282: $> unset HOL_A' >> "$LOGFILE"
echo "$> unset HOL_A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #283: $> unset HOLA_' >> "$LOGFILE"
echo "$> unset HOLA_
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #284: $> unset HOL*A' >> "$LOGFILE"
echo "$> unset HOL*A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #285: $> unset HOL#A' >> "$LOGFILE"
echo "$> unset HOL#A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #286: $> unset $HOLA' >> "$LOGFILE"
echo "$> unset $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #287: $> unset $PWD' >> "$LOGFILE"
echo "$> unset $PWD
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #288: $> unset HOL@' >> "$LOGFILE"
echo "$> unset HOL@
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #289: $> unset HOL!A' >> "$LOGFILE"
echo "$> unset HOL!A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #290: $> unset HOL^A' >> "$LOGFILE"
echo "$> unset HOL^A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #291: $> unset HOL$?A' >> "$LOGFILE"
echo "$> unset HOL$?A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #292: $> unset HOL\~A' >> "$LOGFILE"
echo "$> unset HOL\~A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #293: $> unset "" HOLA
$> env | grep HOLA' >> "$LOGFILE"
echo "$> unset "" HOLA
$> env | grep HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #294: $> unset PATH
$> cat Makefile' >> "$LOGFILE"
echo "$> unset PATH
$> cat Makefile
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #295: $> unset =' >> "$LOGFILE"
echo "$> unset =
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #296: $> unset ======' >> "$LOGFILE"
echo "$> unset ======
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #297: $> unset ++++++' >> "$LOGFILE"
echo "$> unset ++++++
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #298: $> unset _______' >> "$LOGFILE"
echo "$> unset _______
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #299: $> unset export' >> "$LOGFILE"
echo "$> unset export
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #300: $> unset echo' >> "$LOGFILE"
echo "$> unset echo
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #301: $> unset pwd' >> "$LOGFILE"
echo "$> unset pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #302: $> unset cd' >> "$LOGFILE"
echo "$> unset cd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #303: $> unset unset' >> "$LOGFILE"
echo "$> unset unset
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #304: $> unset sudo' >> "$LOGFILE"
echo "$> unset sudo
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #305: $> export hola | unset hola | echo $?' >> "$LOGFILE"
echo "$> export hola | unset hola | echo $?
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #306: $> /bin/echo' >> "$LOGFILE"
echo "$> /bin/echo
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #307: $> /bin/echo Hola Que Tal' >> "$LOGFILE"
echo "$> /bin/echo Hola Que Tal
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #308: $> /bin/env' >> "$LOGFILE"
echo "$> /bin/env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #309: $> /bin/cd Desktop' >> "$LOGFILE"
echo "$> /bin/cd Desktop
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #310: $> history' >> "$LOGFILE"
echo "$> history
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #311: $> [touche du haut]' >> "$LOGFILE"
echo "$> [touche du haut]
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #312: $> pwd' >> "$LOGFILE"
echo "$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #313: $> pwd hola' >> "$LOGFILE"
echo "$> pwd hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #314: $> pwd ./hola' >> "$LOGFILE"
echo "$> pwd ./hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #315: $> pwd hola que tal' >> "$LOGFILE"
echo "$> pwd hola que tal
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #316: $> pwd -p' >> "$LOGFILE"
echo "$> pwd -p
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #317: $> pwd --p' >> "$LOGFILE"
echo "$> pwd --p
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #318: $> pwd ---p' >> "$LOGFILE"
echo "$> pwd ---p
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #319: $> pwd -- p' >> "$LOGFILE"
echo "$> pwd -- p
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #320: $> pwd pwd pwd' >> "$LOGFILE"
echo "$> pwd pwd pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #321: $> pwd ls' >> "$LOGFILE"
echo "$> pwd ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #322: $> pwd ls env' >> "$LOGFILE"
echo "$> pwd ls env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #323: $> cd' >> "$LOGFILE"
echo "$> cd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #324: $> cd .' >> "$LOGFILE"
echo "$> cd .
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #325: $> cd ./' >> "$LOGFILE"
echo "$> cd ./
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #326: $> cd ./././.' >> "$LOGFILE"
echo "$> cd ./././.
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #327: $> cd ././././' >> "$LOGFILE"
echo "$> cd ././././
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #328: $> cd ..' >> "$LOGFILE"
echo "$> cd ..
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #329: $> cd ../' >> "$LOGFILE"
echo "$> cd ../
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #330: $> cd ../..' >> "$LOGFILE"
echo "$> cd ../..
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #331: $> cd ../.' >> "$LOGFILE"
echo "$> cd ../.
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #332: $> cd .././././.' >> "$LOGFILE"
echo "$> cd .././././.
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #333: $> cd srcs' >> "$LOGFILE"
echo "$> cd srcs
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #334: $> cd srcs objs' >> "$LOGFILE"
echo "$> cd srcs objs
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #335: $> cd 'srcs'' >> "$LOGFILE"
echo "$> cd 'srcs'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #336: $> cd "srcs"' >> "$LOGFILE"
echo "$> cd "srcs"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #337: $> cd '/etc'' >> "$LOGFILE"
echo "$> cd '/etc'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #338: $> cd /e'tc'' >> "$LOGFILE"
echo "$> cd /e'tc'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #339: $> cd /e"tc"' >> "$LOGFILE"
echo "$> cd /e"tc"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #340: $> cd sr' >> "$LOGFILE"
echo "$> cd sr
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #341: $> cd Makefile' >> "$LOGFILE"
echo "$> cd Makefile
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #342: $> cd ../minishell' >> "$LOGFILE"
echo "$> cd ../minishell
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #343: $> cd ../../../../../../..' >> "$LOGFILE"
echo "$> cd ../../../../../../..
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #344: $> cd .././../.././../bin/ls' >> "$LOGFILE"
echo "$> cd .././../.././../bin/ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #345: $> cd /' >> "$LOGFILE"
echo "$> cd /
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #346: $> cd '/'' >> "$LOGFILE"
echo "$> cd '/'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #347: $> cd //
$> pwd' >> "$LOGFILE"
echo "$> cd //
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #348: $> cd '//'
$> pwd' >> "$LOGFILE"
echo "$> cd '//'
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #349: $> cd ///
$> pwd' >> "$LOGFILE"
echo "$> cd ///
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #350: $> cd ////////
$> pwd' >> "$LOGFILE"
echo "$> cd ////////
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #351: $> cd '////////'
$> pwd' >> "$LOGFILE"
echo "$> cd '////////'
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #352: $> cd /minishell' >> "$LOGFILE"
echo "$> cd /minishell
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #353: $> cd /
$> cd ..' >> "$LOGFILE"
echo "$> cd /
$> cd ..
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #354: $> cd _' >> "$LOGFILE"
echo "$> cd _
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #355: $> cd -' >> "$LOGFILE"
echo "$> cd -
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #356: $> cd --' >> "$LOGFILE"
echo "$> cd --
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #357: $> cd ---' >> "$LOGFILE"
echo "$> cd ---
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #358: $> cd $HOME' >> "$LOGFILE"
echo "$> cd $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #359: $> cd $HOME $HOME' >> "$LOGFILE"
echo "$> cd $HOME $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #360: $> cd $HOME/42_works' >> "$LOGFILE"
echo "$> cd $HOME/42_works
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #361: $> cd "$PWD/srcs"' >> "$LOGFILE"
echo "$> cd "$PWD/srcs"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #362: $> cd '$PWD/srcs'' >> "$LOGFILE"
echo "$> cd '$PWD/srcs'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #363: $> unset HOME
$> cd $HOME' >> "$LOGFILE"
echo "$> unset HOME
$> cd $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #364: $> unset HOME
$> export HOME=
$> cd' >> "$LOGFILE"
echo "$> unset HOME
$> export HOME=
$> cd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #365: $> unset HOME
$> export HOME
$> cd' >> "$LOGFILE"
echo "$> unset HOME
$> export HOME
$> cd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #366: $> cd minishell Docs crashtest.c' >> "$LOGFILE"
echo "$> cd minishell Docs crashtest.c
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #367: $>    cd / | echo $?
$> pwd' >> "$LOGFILE"
echo "$>    cd / | echo $?
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #368: $> cd ~' >> "$LOGFILE"
echo "$> cd ~
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #369: $> cd ~/' >> "$LOGFILE"
echo "$> cd ~/
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #370: $> cd ~/ | echo $?
$> pwd' >> "$LOGFILE"
echo "$> cd ~/ | echo $?
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #371: $> cd *' >> "$LOGFILE"
echo "$> cd *
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #372: $> mkdir a
$> mkdir a/b
$> cd a/b
$> rm -r ../../a
$> cd ..' >> "$LOGFILE"
echo "$> mkdir a
$> mkdir a/b
$> cd a/b
$> rm -r ../../a
$> cd ..
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #373: $> mkdir a
$> mkdir a/b
$> cd a/b
$> rm -r ../../a
$> pwd' >> "$LOGFILE"
echo "$> mkdir a
$> mkdir a/b
$> cd a/b
$> rm -r ../../a
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #374: $> mkdir a
$> mkdir a/b
$> cd a/b
$> rm -r ../../a
$> echo $PWD
$> echo $OLDPWD' >> "$LOGFILE"
echo "$> mkdir a
$> mkdir a/b
$> cd a/b
$> rm -r ../../a
$> echo $PWD
$> echo $OLDPWD
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #375: $> mkdir a
$> mkdir a/b
$> cd a/b
$> rm -r ../../a
$> cd
$> echo $PWD
$> echo $OLDPWD' >> "$LOGFILE"
echo "$> mkdir a
$> mkdir a/b
$> cd a/b
$> rm -r ../../a
$> cd
$> echo $PWD
$> echo $OLDPWD
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #376: $> mkdir a
$> cd a
$> rm -r ../a
$> echo $PWD
$> echo $OLDPWD' >> "$LOGFILE"
echo "$> mkdir a
$> cd a
$> rm -r ../a
$> echo $PWD
$> echo $OLDPWD
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #377: $> export CDPATH=/
$> cd $HOME/..' >> "$LOGFILE"
echo "$> export CDPATH=/
$> cd $HOME/..
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #378: $> export CDPATH=/
$> cd home/vietdu91' >> "$LOGFILE"
echo "$> export CDPATH=/
$> cd home/vietdu91
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #379: $> export CDPATH=./
$> cd .' >> "$LOGFILE"
echo "$> export CDPATH=./
$> cd .
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #380: $> export CDPATH=./
$> cd ..' >> "$LOGFILE"
echo "$> export CDPATH=./
$> cd ..
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #381: $> chmod 000 minishell
$> ./minishell' >> "$LOGFILE"
echo "$> chmod 000 minishell
$> ./minishell
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #382: $> ls hola' >> "$LOGFILE"
echo "$> ls hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #383: $> ./Makefile' >> "$LOGFILE"
echo "$> ./Makefile
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #384: $> ./minishell' >> "$LOGFILE"
echo "$> ./minishell
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #385: $> env | grep SHLVL
$> ./minishell
$> env | grep SHLVL
$> exit
$> env | grep SHLVL' >> "$LOGFILE"
echo "$> env | grep SHLVL
$> ./minishell
$> env | grep SHLVL
$> exit
$> env | grep SHLVL
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #386: $> touch hola
$> ./hola' >> "$LOGFILE"
echo "$> touch hola
$> ./hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #387: $> env|"wc" -l' >> "$LOGFILE"
echo "$> env|"wc" -l
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #388: $> env|"wc "-l' >> "$LOGFILE"
echo "$> env|"wc "-l
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #389: $> expr 1 + 1' >> "$LOGFILE"
echo "$> expr 1 + 1
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #390: $> expr $? + $?' >> "$LOGFILE"
echo "$> expr $? + $?
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #391: $> env -i ./minishell
$> env' >> "$LOGFILE"
echo "$> env -i ./minishell
$> env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #392: $> env -i ./minishell
$> export' >> "$LOGFILE"
echo "$> env -i ./minishell
$> export
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #393: $> env -i ./minishell
$> cd' >> "$LOGFILE"
echo "$> env -i ./minishell
$> cd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #394: $> env -i ./minishell
$> cd ~' >> "$LOGFILE"
echo "$> env -i ./minishell
$> cd ~
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #395: $> exit' >> "$LOGFILE"
echo "$> exit
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #396: $> exit exit' >> "$LOGFILE"
echo "$> exit exit
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #397: $> exit hola' >> "$LOGFILE"
echo "$> exit hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #398: $> exit hola que tal' >> "$LOGFILE"
echo "$> exit hola que tal
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #399: $> exit 42' >> "$LOGFILE"
echo "$> exit 42
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #400: $> exit 000042' >> "$LOGFILE"
echo "$> exit 000042
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #401: $> exit 666' >> "$LOGFILE"
echo "$> exit 666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #402: $> exit 666 666' >> "$LOGFILE"
echo "$> exit 666 666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #403: $> exit -666 666' >> "$LOGFILE"
echo "$> exit -666 666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #404: $> exit hola 666' >> "$LOGFILE"
echo "$> exit hola 666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #405: $> exit 666 666 666 666' >> "$LOGFILE"
echo "$> exit 666 666 666 666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #406: $> exit 666 hola 666' >> "$LOGFILE"
echo "$> exit 666 hola 666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #407: $> exit hola 666 666' >> "$LOGFILE"
echo "$> exit hola 666 666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #408: $> exit 259' >> "$LOGFILE"
echo "$> exit 259
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #409: $> exit -4' >> "$LOGFILE"
echo "$> exit -4
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #410: $> exit -42' >> "$LOGFILE"
echo "$> exit -42
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #411: $> exit -0000042' >> "$LOGFILE"
echo "$> exit -0000042
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #412: $> exit -259' >> "$LOGFILE"
echo "$> exit -259
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #413: $> exit -666' >> "$LOGFILE"
echo "$> exit -666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #414: $> exit +666' >> "$LOGFILE"
echo "$> exit +666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #415: $> exit 0' >> "$LOGFILE"
echo "$> exit 0
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #416: $> exit +0' >> "$LOGFILE"
echo "$> exit +0
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #417: $> exit -0' >> "$LOGFILE"
echo "$> exit -0
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #418: $> exit +42' >> "$LOGFILE"
echo "$> exit +42
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #419: $> exit -69 -96' >> "$LOGFILE"
echo "$> exit -69 -96
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #420: $> exit --666' >> "$LOGFILE"
echo "$> exit --666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #421: $> exit ++++666' >> "$LOGFILE"
echo "$> exit ++++666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #422: $> exit ++++++0' >> "$LOGFILE"
echo "$> exit ++++++0
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #423: $> exit ------0' >> "$LOGFILE"
echo "$> exit ------0
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #424: $> exit "666"' >> "$LOGFILE"
echo "$> exit "666"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #425: $> exit '666'' >> "$LOGFILE"
echo "$> exit '666'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #426: $> exit '-666'' >> "$LOGFILE"
echo "$> exit '-666'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #427: $> exit '+666'' >> "$LOGFILE"
echo "$> exit '+666'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #428: $> exit '----666'' >> "$LOGFILE"
echo "$> exit '----666'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #429: $> exit '++++666'' >> "$LOGFILE"
echo "$> exit '++++666'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #430: $> exit '6'66' >> "$LOGFILE"
echo "$> exit '6'66
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #431: $> exit '2'66'32'' >> "$LOGFILE"
echo "$> exit '2'66'32'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #432: $> exit "'666'"' >> "$LOGFILE"
echo "$> exit "'666'"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #433: $> exit '"666"'' >> "$LOGFILE"
echo "$> exit '"666"'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #434: $> exit '666'"666"666' >> "$LOGFILE"
echo "$> exit '666'"666"666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #435: $> exit +'666'"666"666' >> "$LOGFILE"
echo "$> exit +'666'"666"666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #436: $> exit -'666'"666"666' >> "$LOGFILE"
echo "$> exit -'666'"666"666
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #437: $> exit 9223372036854775807' >> "$LOGFILE"
echo "$> exit 9223372036854775807
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #438: $> exit 9223372036854775808' >> "$LOGFILE"
echo "$> exit 9223372036854775808
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #439: $> exit -9223372036854775808' >> "$LOGFILE"
echo "$> exit -9223372036854775808
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #440: $> exit -9223372036854775809' >> "$LOGFILE"
echo "$> exit -9223372036854775809
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #441: $> cat | cat | cat | ls' >> "$LOGFILE"
echo "$> cat | cat | cat | ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #442: $> ls | exit' >> "$LOGFILE"
echo "$> ls | exit
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #443: $> ls | exit 42' >> "$LOGFILE"
echo "$> ls | exit 42
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #444: $> exit | ls' >> "$LOGFILE"
echo "$> exit | ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #445: $> echo hola > bonjour
$> exit | cat -e bonjour' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> exit | cat -e bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #446: $> echo hola > bonjour
$> cat -e bonjour | exit' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> cat -e bonjour | exit
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #447: $> echo | echo' >> "$LOGFILE"
echo "$> echo | echo
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #448: $> echo hola | echo que tal' >> "$LOGFILE"
echo "$> echo hola | echo que tal
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #449: $> pwd | echo hola' >> "$LOGFILE"
echo "$> pwd | echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #450: $> env | echo hola' >> "$LOGFILE"
echo "$> env | echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #451: $> echo oui | cat -e' >> "$LOGFILE"
echo "$> echo oui | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #452: $> echo oui | echo non | echo hola | grep oui' >> "$LOGFILE"
echo "$> echo oui | echo non | echo hola | grep oui
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #453: $> echo oui | echo non | echo hola | grep non' >> "$LOGFILE"
echo "$> echo oui | echo non | echo hola | grep non
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #454: $> echo oui | echo non | echo hola | grep hola' >> "$LOGFILE"
echo "$> echo oui | echo non | echo hola | grep hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #455: $> echo hola | cat -e | cat -e | cat -e' >> "$LOGFILE"
echo "$> echo hola | cat -e | cat -e | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #456: $> cd .. | echo "hola"' >> "$LOGFILE"
echo "$> cd .. | echo "hola"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #457: $> cd / | echo "hola"' >> "$LOGFILE"
echo "$> cd / | echo "hola"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #458: $> cd .. | pwd' >> "$LOGFILE"
echo "$> cd .. | pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #459: $> ifconfig | grep ":"' >> "$LOGFILE"
echo "$> ifconfig | grep ":"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #460: $> ifconfig | grep hola' >> "$LOGFILE"
echo "$> ifconfig | grep hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #461: $> whoami | grep $USER' >> "$LOGFILE"
echo "$> whoami | grep $USER
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #462: $> whoami | grep $USER > /tmp/bonjour
$> cat /tmp/bonjour' >> "$LOGFILE"
echo "$> whoami | grep $USER > /tmp/bonjour
$> cat /tmp/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #463: $> whoami | cat -e | cat -e > /tmp/bonjour
$> cat /tmp/bonjour' >> "$LOGFILE"
echo "$> whoami | cat -e | cat -e > /tmp/bonjour
$> cat /tmp/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #464: $> whereis ls | cat -e | cat -e > /tmp/bonjour
$> cat /tmp/bonjour' >> "$LOGFILE"
echo "$> whereis ls | cat -e | cat -e > /tmp/bonjour
$> cat /tmp/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #465: $> ls | hola' >> "$LOGFILE"
echo "$> ls | hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #466: $> ls | ls hola' >> "$LOGFILE"
echo "$> ls | ls hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #467: $> ls | ls | hola' >> "$LOGFILE"
echo "$> ls | ls | hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #468: $> ls | hola | ls' >> "$LOGFILE"
echo "$> ls | hola | ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #469: $> ls | ls | hola | rev' >> "$LOGFILE"
echo "$> ls | ls | hola | rev
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #470: $> ls | ls | echo hola | rev' >> "$LOGFILE"
echo "$> ls | ls | echo hola | rev
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #471: $> ls -la | grep "."' >> "$LOGFILE"
echo "$> ls -la | grep "."
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #472: $> ls -la | grep "'.'"' >> "$LOGFILE"
echo "$> ls -la | grep "'.'"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #473: $> echo test.c | cat -e| cat -e| cat -e| cat -e| cat -e| cat -e| cat -e| cat -e|cat -e|cat -e|cat -e' >> "$LOGFILE"
echo "$> echo test.c | cat -e| cat -e| cat -e| cat -e| cat -e| cat -e| cat -e| cat -e|cat -e|cat -e|cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #474: $> ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls
|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls' >> "$LOGFILE"
echo "$> ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls
|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls|ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #475: $> echo hola | cat | cat | cat | cat | cat | grep hola' >> "$LOGFILE"
echo "$> echo hola | cat | cat | cat | cat | cat | grep hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #476: $> echo hola | cat' >> "$LOGFILE"
echo "$> echo hola | cat
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #477: $> echo hola| cat' >> "$LOGFILE"
echo "$> echo hola| cat
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #478: $> echo hola |cat' >> "$LOGFILE"
echo "$> echo hola |cat
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #479: $> echo hola|cat' >> "$LOGFILE"
echo "$> echo hola|cat
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #480: $> echo hola || cat' >> "$LOGFILE"
echo "$> echo hola || cat
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #481: $> echo hola ||| cat' >> "$LOGFILE"
echo "$> echo hola ||| cat
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #482: $> ech|o hola | cat' >> "$LOGFILE"
echo "$> ech|o hola | cat
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #483: $> cat Makefile | cat -e | cat -e' >> "$LOGFILE"
echo "$> cat Makefile | cat -e | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #484: $> cat Makefile | grep srcs | cat -e' >> "$LOGFILE"
echo "$> cat Makefile | grep srcs | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #485: $> cat Makefile | grep srcs | grep srcs | cat -e' >> "$LOGFILE"
echo "$> cat Makefile | grep srcs | grep srcs | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #486: $> cat Makefile | grep pr | head -n 5 | cd file_not_exist' >> "$LOGFILE"
echo "$> cat Makefile | grep pr | head -n 5 | cd file_not_exist
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #487: $> cat Makefile | grep pr | head -n 5 | hello' >> "$LOGFILE"
echo "$> cat Makefile | grep pr | head -n 5 | hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #488: $> export HOLA=bonjour | cat -e | cat -e' >> "$LOGFILE"
echo "$> export HOLA=bonjour | cat -e | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #489: $> unset HOLA | cat -e' >> "$LOGFILE"
echo "$> unset HOLA | cat -e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #490: $> export HOLA | echo hola
$> env | grep PROUT' >> "$LOGFILE"
echo "$> export HOLA | echo hola
$> env | grep PROUT
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #491: $> export | echo hola' >> "$LOGFILE"
echo "$> export | echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #492: $> sleep 3 | sleep 3' >> "$LOGFILE"
echo "$> sleep 3 | sleep 3
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #493: $> time sleep 3 | sleep 3' >> "$LOGFILE"
echo "$> time sleep 3 | sleep 3
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #494: $> sleep 3 | exit' >> "$LOGFILE"
echo "$> sleep 3 | exit
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #495: $> exit | sleep 3' >> "$LOGFILE"
echo "$> exit | sleep 3
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #496: $> echo hola > a
$> >>b echo que tal
$> cat a | <b cat | cat > c | cat' >> "$LOGFILE"
echo "$> echo hola > a
$> >>b echo que tal
$> cat a | <b cat | cat > c | cat
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #497: $> pwd && ls' >> "$LOGFILE"
echo "$> pwd && ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #498: $> pwd || ls' >> "$LOGFILE"
echo "$> pwd || ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #499: $> echo hola || echo bonjour' >> "$LOGFILE"
echo "$> echo hola || echo bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #500: $> echo hola && echo bonjour' >> "$LOGFILE"
echo "$> echo hola && echo bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #501: $> echo bonjour || echo hola' >> "$LOGFILE"
echo "$> echo bonjour || echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #502: $> echo bonjour && echo hola' >> "$LOGFILE"
echo "$> echo bonjour && echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #503: $> echo -n bonjour && echo -n hola' >> "$LOGFILE"
echo "$> echo -n bonjour && echo -n hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #504: $> pwd && ls && echo hola' >> "$LOGFILE"
echo "$> pwd && ls && echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #505: $> pwd || ls && echo hola' >> "$LOGFILE"
echo "$> pwd || ls && echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #506: $> pwd && ls || echo hola' >> "$LOGFILE"
echo "$> pwd && ls || echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #507: $> pwd || ls || echo hola' >> "$LOGFILE"
echo "$> pwd || ls || echo hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #508: $> ls || export ""' >> "$LOGFILE"
echo "$> ls || export ""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #509: $> export "" || ls' >> "$LOGFILE"
echo "$> export "" || ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #510: $> ls && export ""' >> "$LOGFILE"
echo "$> ls && export ""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #511: $> export "" && ls' >> "$LOGFILE"
echo "$> export "" && ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #512: $> ls || ;' >> "$LOGFILE"
echo "$> ls || ;
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #513: $> ; || ls' >> "$LOGFILE"
echo "$> ; || ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #514: $> ls && ;' >> "$LOGFILE"
echo "$> ls && ;
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #515: $> ; && ls' >> "$LOGFILE"
echo "$> ; && ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #516: $> ls || <' >> "$LOGFILE"
echo "$> ls || <
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #517: $> ls && <' >> "$LOGFILE"
echo "$> ls && <
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #518: $> cat | echo || ls' >> "$LOGFILE"
echo "$> cat | echo || ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #519: $> cat | echo && ls' >> "$LOGFILE"
echo "$> cat | echo && ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #520: $> ls || cat | echo' >> "$LOGFILE"
echo "$> ls || cat | echo
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #521: $> ls && cat | echo' >> "$LOGFILE"
echo "$> ls && cat | echo
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #522: $> export "" && unset ""' >> "$LOGFILE"
echo "$> export "" && unset ""
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #523: $> (ls)' >> "$LOGFILE"
echo "$> (ls)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #524: $> ( ( ls ) )' >> "$LOGFILE"
echo "$> ( ( ls ) )
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #525: $> ( ( ) ls )' >> "$LOGFILE"
echo "$> ( ( ) ls )
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #526: $> ls && (ls)' >> "$LOGFILE"
echo "$> ls && (ls)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #527: $> (ls && pwd)' >> "$LOGFILE"
echo "$> (ls && pwd)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #528: $> ( ( ls&&pwd ) )' >> "$LOGFILE"
echo "$> ( ( ls&&pwd ) )
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #529: $> ( ( ls ) &&pwd )' >> "$LOGFILE"
echo "$> ( ( ls ) &&pwd )
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #530: $> (ls && ( ( pwd ) ) )' >> "$LOGFILE"
echo "$> (ls && ( ( pwd ) ) )
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #531: $> (ls && pwd) > hola
$> cat hola' >> "$LOGFILE"
echo "$> (ls && pwd) > hola
$> cat hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #532: $> > hola ls && pwd' >> "$LOGFILE"
echo "$> > hola ls && pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #533: $> > hola (ls && pwd)' >> "$LOGFILE"
echo "$> > hola (ls && pwd)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #534: $> (> pwd)
$> ls' >> "$LOGFILE"
echo "$> (> pwd)
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #535: $> (< pwd)
$> ls' >> "$LOGFILE"
echo "$> (< pwd)
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #536: $> (< pwd)' >> "$LOGFILE"
echo "$> (< pwd)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #537: $> ( ( ( ( ( pwd) ) ) ) )' >> "$LOGFILE"
echo "$> ( ( ( ( ( pwd) ) ) ) )
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #538: $> () pwd' >> "$LOGFILE"
echo "$> () pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #539: $> > pwd (ls)' >> "$LOGFILE"
echo "$> > pwd (ls)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #540: $> (ls||pwd)&&(ls||pwd)' >> "$LOGFILE"
echo "$> (ls||pwd)&&(ls||pwd)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #541: $> (lss||pwd)&&(lss||pwd)' >> "$LOGFILE"
echo "$> (lss||pwd)&&(lss||pwd)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #542: $> (lss&&pwd)&&(lss&&pwd)' >> "$LOGFILE"
echo "$> (lss&&pwd)&&(lss&&pwd)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #543: $> (ls && pwd | wc) > hola
$> cat hola' >> "$LOGFILE"
echo "$> (ls && pwd | wc) > hola
$> cat hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #544: $> (ls && pwd | wc) > hola
$> (ls && pwd | wc) > hola
$> cat hola' >> "$LOGFILE"
echo "$> (ls && pwd | wc) > hola
$> (ls && pwd | wc) > hola
$> cat hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #545: $> (ls && pwd | wc) >> hola
$> echo hey&&(ls && pwd | wc) > hola
$> cat hola' >> "$LOGFILE"
echo "$> (ls && pwd | wc) >> hola
$> echo hey&&(ls && pwd | wc) > hola
$> cat hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #546: $> (pwd | wc) < hola' >> "$LOGFILE"
echo "$> (pwd | wc) < hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #547: $> (ls && pwd | wc) < hola' >> "$LOGFILE"
echo "$> (ls && pwd | wc) < hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #548: $> (ls -z || pwd | wc) < hola' >> "$LOGFILE"
echo "$> (ls -z || pwd | wc) < hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #549: $> echo hey > hola
$> (pwd | wc) < hola' >> "$LOGFILE"
echo "$> echo hey > hola
$> (pwd | wc) < hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #550: $> echo hey > hola
$> (ls && pwd | wc) < hola' >> "$LOGFILE"
echo "$> echo hey > hola
$> (ls && pwd | wc) < hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #551: $> echo hey > hola
$> (ls -z || pwd | wc) < hola' >> "$LOGFILE"
echo "$> echo hey > hola
$> (ls -z || pwd | wc) < hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #552: $> (ls -z || pwd && ls)' >> "$LOGFILE"
echo "$> (ls -z || pwd && ls)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #553: $> ls || (cat Makefile|grep srcs) && (pwd|wc)' >> "$LOGFILE"
echo "$> ls || (cat Makefile|grep srcs) && (pwd|wc)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #554: $> ls -z && (ls) && (pwd)' >> "$LOGFILE"
echo "$> ls -z && (ls) && (pwd)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #555: $> (ls > Docs/hey && pwd) > hola
$> cat hola
$> cat Docs/hey' >> "$LOGFILE"
echo "$> (ls > Docs/hey && pwd) > hola
$> cat hola
$> cat Docs/hey
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #556: $> ls > Docs/hey && pwd > hola
$> cat hola
$> cat Docs/hey' >> "$LOGFILE"
echo "$> ls > Docs/hey && pwd > hola
$> cat hola
$> cat Docs/hey
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #557: $> cd ../.. && pwd && pwd' >> "$LOGFILE"
echo "$> cd ../.. && pwd && pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #558: $> (cd ../.. && pwd) && pwd' >> "$LOGFILE"
echo "$> (cd ../.. && pwd) && pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #559: $> ls -z || cd ../../..&&pwd
$> pwd' >> "$LOGFILE"
echo "$> ls -z || cd ../../..&&pwd
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #560: $> ls -z || (cd ../../..&&pwd)
$> pwd' >> "$LOGFILE"
echo "$> ls -z || (cd ../../..&&pwd)
$> pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #561: $> echo hola > bonjour
$> cat bonjour' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #562: $> echo que tal >> bonjour
$> cat bonjour' >> "$LOGFILE"
echo "$> echo que tal >> bonjour
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #563: $> echo hola > bonjour
$> echo que tal >> bonjour
$> cat < bonjour' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo que tal >> bonjour
$> cat < bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #564: $> echo hola > bonjour
$> rm bonjour
$> echo que tal >> bonjour
$> cat < bonjour' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> rm bonjour
$> echo que tal >> bonjour
$> cat < bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #565: $> echo hola que tal > bonjour
$> cat bonjour' >> "$LOGFILE"
echo "$> echo hola que tal > bonjour
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #566: $> echo hola que tal > /tmp/bonjour
$> cat -e /tmp/bonjour' >> "$LOGFILE"
echo "$> echo hola que tal > /tmp/bonjour
$> cat -e /tmp/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #567: $> export HOLA=hey
$> echo bonjour > $HOLA
$> echo $HOLA' >> "$LOGFILE"
echo "$> export HOLA=hey
$> echo bonjour > $HOLA
$> echo $HOLA
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #568: $> whereis grep > Docs/bonjour
$> cat Docs/bonjour' >> "$LOGFILE"
echo "$> whereis grep > Docs/bonjour
$> cat Docs/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #569: $> ls -la > Docs/bonjour
$> cat Docs/bonjour' >> "$LOGFILE"
echo "$> ls -la > Docs/bonjour
$> cat Docs/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #570: $> pwd>bonjour
$> cat bonjour' >> "$LOGFILE"
echo "$> pwd>bonjour
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #571: $> pwd >                     bonjour
$> cat bonjour' >> "$LOGFILE"
echo "$> pwd >                     bonjour
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #572: $> echo hola > > bonjour' >> "$LOGFILE"
echo "$> echo hola > > bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #573: $> echo hola < < bonjour' >> "$LOGFILE"
echo "$> echo hola < < bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #574: $> echo hola >>> bonjour' >> "$LOGFILE"
echo "$> echo hola >>> bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #575: $> > bonjour echo hola
$> cat bonjour' >> "$LOGFILE"
echo "$> > bonjour echo hola
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #576: $> > bonjour | echo hola
$> cat bonjour' >> "$LOGFILE"
echo "$> > bonjour | echo hola
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #577: $> prout hola > bonjour
$> ls' >> "$LOGFILE"
echo "$> prout hola > bonjour
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #578: $> echo hola > hello >> hello >> hello
$> ls
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > hello >> hello >> hello
$> ls
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #579: $> echo hola > hello >> hello >> hello
$> echo hola >> hello
$> cat < hello' >> "$LOGFILE"
echo "$> echo hola > hello >> hello >> hello
$> echo hola >> hello
$> cat < hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #580: $> echo hola > hello >> hello >> hello
$> echo hola >> hello
$> echo hola > hello >> hello >> hello
$> cat < hello' >> "$LOGFILE"
echo "$> echo hola > hello >> hello >> hello
$> echo hola >> hello
$> echo hola > hello >> hello >> hello
$> cat < hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #581: $> echo hola >> hello >> hello > hello
$> echo hola >> hello
$> cat < hello' >> "$LOGFILE"
echo "$> echo hola >> hello >> hello > hello
$> echo hola >> hello
$> cat < hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #582: $> echo hola >> hello >> hello > hello
$> echo hola >> hello
$> echo hola >> hello >> hello > hello
$> cat < hello' >> "$LOGFILE"
echo "$> echo hola >> hello >> hello > hello
$> echo hola >> hello
$> echo hola >> hello >> hello > hello
$> cat < hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #583: $> echo hola > hello
$> echo hola >> hello >> hello >> hello
$> echo hola >> hello
$> cat < hello' >> "$LOGFILE"
echo "$> echo hola > hello
$> echo hola >> hello >> hello >> hello
$> echo hola >> hello
$> cat < hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #584: $> echo hola > hello
$> echo hey > bonjour
$> echo <bonjour <hello' >> "$LOGFILE"
echo "$> echo hola > hello
$> echo hey > bonjour
$> echo <bonjour <hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #585: $> echo hola > hello
$> echo hey > bonjour
$> echo <hello <bonjour' >> "$LOGFILE"
echo "$> echo hola > hello
$> echo hey > bonjour
$> echo <hello <bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #586: $> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola > bonjour > hello > bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola > bonjour > hello > bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #587: $> echo hola > bonjour
$> echo hey > hello
$> echo hola > bonjour > hello > bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> echo hola > bonjour > hello > bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #588: $> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola > bonjour >> hello > bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola > bonjour >> hello > bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #589: $> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola > bonjour > hello >> bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola > bonjour > hello >> bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #590: $> echo hola > bonjour
$> echo hey > hello
$> echo hola > bonjour > hello >> bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> echo hola > bonjour > hello >> bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #591: $> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola >> bonjour > hello > bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola >> bonjour > hello > bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #592: $> echo hola > bonjour
$> echo hey > hello
$> echo hola >> bonjour > hello > bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> echo hola >> bonjour > hello > bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #593: $> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola >> bonjour >> hello >> bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> echo hola >> bonjour >> hello >> bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #594: $> echo hola > bonjour
$> echo hey > hello
$> echo hola >> bonjour >> hello >> bonjour
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> echo hola >> bonjour >> hello >> bonjour
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #595: $> > bonjour echo hola bonjour
$> cat bonjour' >> "$LOGFILE"
echo "$> > bonjour echo hola bonjour
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #596: $> >bonjour echo > hola>bonjour>hola>>bonjour>hola hey >bonjour hola >hola
$> cat bonjour
$> cat hola' >> "$LOGFILE"
echo "$> >bonjour echo > hola>bonjour>hola>>bonjour>hola hey >bonjour hola >hola
$> cat bonjour
$> cat hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #597: $> echo bonjour > hola1
$> echo hello > hola2
$> echo 2 >hola1 >> hola2
$> ls
$> cat hola1
$> cat hola2' >> "$LOGFILE"
echo "$> echo bonjour > hola1
$> echo hello > hola2
$> echo 2 >hola1 >> hola2
$> ls
$> cat hola1
$> cat hola2
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #598: $> echo bonjour > hola1
$> echo hello > hola2
$> echo 2 >>hola1 > hola2
$> ls
$> cat hola1
$> cat hola2' >> "$LOGFILE"
echo "$> echo bonjour > hola1
$> echo hello > hola2
$> echo 2 >>hola1 > hola2
$> ls
$> cat hola1
$> cat hola2
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #599: $> > pwd
$> ls' >> "$LOGFILE"
echo "$> > pwd
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #600: $> < pwd' >> "$LOGFILE"
echo "$> < pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #601: $> < Makefile .' >> "$LOGFILE"
echo "$> < Makefile .
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #602: $> cat <pwd' >> "$LOGFILE"
echo "$> cat <pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #603: $> cat <srcs/pwd' >> "$LOGFILE"
echo "$> cat <srcs/pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #604: $> cat <../pwd' >> "$LOGFILE"
echo "$> cat <../pwd
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #605: $> cat >>' >> "$LOGFILE"
echo "$> cat >>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #606: $> cat >>>' >> "$LOGFILE"
echo "$> cat >>>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #607: $> cat >> <<' >> "$LOGFILE"
echo "$> cat >> <<
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #608: $> cat >> > >> << >>' >> "$LOGFILE"
echo "$> cat >> > >> << >>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #609: $> cat < ls' >> "$LOGFILE"
echo "$> cat < ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #610: $> cat < ls > ls' >> "$LOGFILE"
echo "$> cat < ls > ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #611: $> cat > ls1 < ls2
$> ls' >> "$LOGFILE"
echo "$> cat > ls1 < ls2
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #612: $> >>hola
$> cat hola' >> "$LOGFILE"
echo "$> >>hola
$> cat hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #613: $> echo hola > bonjour
$> cat < bonjour' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> cat < bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #614: $> echo hola >bonjour
$> cat <bonjour' >> "$LOGFILE"
echo "$> echo hola >bonjour
$> cat <bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #615: $> echo hola>bonjour
$> cat<bonjour' >> "$LOGFILE"
echo "$> echo hola>bonjour
$> cat<bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #616: $> echo hola> bonjour
$> cat< bonjour' >> "$LOGFILE"
echo "$> echo hola> bonjour
$> cat< bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #617: $> echo hola               >bonjour
$> cat<                     bonjour' >> "$LOGFILE"
echo "$> echo hola               >bonjour
$> cat<                     bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #618: $> echo hola          >     bonjour
$> cat            <         bonjour' >> "$LOGFILE"
echo "$> echo hola          >     bonjour
$> cat            <         bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #619: $> echo hola > srcs/bonjour
$> cat < srcs/bonjour' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> cat < srcs/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #620: $> echo hola >srcs/bonjour
$> cat <srcs/bonjour' >> "$LOGFILE"
echo "$> echo hola >srcs/bonjour
$> cat <srcs/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #621: $> e'c'"h"o hola > bonjour
$> cat 'bo'"n"jour' >> "$LOGFILE"
echo "$> e'c'"h"o hola > bonjour
$> cat 'bo'"n"jour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #622: $> echo hola > bonjour\ 1
$> ls
$> cat bonjour\ 1' >> "$LOGFILE"
echo "$> echo hola > bonjour\ 1
$> ls
$> cat bonjour\ 1
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #623: $> echo hola > bonjour hey
$> ls
$> cat bonjour
$> cat hey' >> "$LOGFILE"
echo "$> echo hola > bonjour hey
$> ls
$> cat bonjour
$> cat hey
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #624: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >srcs/bonjour >srcs/hello <prout
$> cat srcs/bonjour srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >srcs/bonjour >srcs/hello <prout
$> cat srcs/bonjour srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #625: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> rm srcs/bonjour srcs/hello
$> >srcs/bonjour >srcs/hello <prout
$> ls srcs
$> cat srcs/bonjour srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> rm srcs/bonjour srcs/hello
$> >srcs/bonjour >srcs/hello <prout
$> ls srcs
$> cat srcs/bonjour srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #626: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >srcs/bonjour <prout >srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >srcs/bonjour <prout >srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #627: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> rm srcs/bonjour srcs/hello
$> >srcs/bonjour <prout >srcs/hello
$> ls srcs
$> cat srcs/bonjour' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> rm srcs/bonjour srcs/hello
$> >srcs/bonjour <prout >srcs/hello
$> ls srcs
$> cat srcs/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #628: $> echo hola > ../bonjour
$> echo hey > ../hello
$> >../bonjour >../hello <prout
$> cat ../bonjour ../hello' >> "$LOGFILE"
echo "$> echo hola > ../bonjour
$> echo hey > ../hello
$> >../bonjour >../hello <prout
$> cat ../bonjour ../hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #629: $> echo hola > ../bonjour
$> echo hey > ../hello
$> rm ../bonjour ../hello
$> >../bonjour >../hello <prout
$> ls ..
$> cat ../bonjour ../hello' >> "$LOGFILE"
echo "$> echo hola > ../bonjour
$> echo hey > ../hello
$> rm ../bonjour ../hello
$> >../bonjour >../hello <prout
$> ls ..
$> cat ../bonjour ../hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #630: $> echo hola > ../bonjour
$> echo hey > ../hello
$> >../bonjour <prout >../hello
$> cat ../bonjour
$> cat ../hello' >> "$LOGFILE"
echo "$> echo hola > ../bonjour
$> echo hey > ../hello
$> >../bonjour <prout >../hello
$> cat ../bonjour
$> cat ../hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #631: $> echo hola > ../bonjour
$> echo hey > ../hello
$> rm ../bonjour ../hello
$> >../bonjour <prout >../hello
$> ls ..
$> cat ../bonjour' >> "$LOGFILE"
echo "$> echo hola > ../bonjour
$> echo hey > ../hello
$> rm ../bonjour ../hello
$> >../bonjour <prout >../hello
$> ls ..
$> cat ../bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #632: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >srcs/bonjour >>srcs/hello <prout
$> cat srcs/bonjour
$> cat srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >srcs/bonjour >>srcs/hello <prout
$> cat srcs/bonjour
$> cat srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #633: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >>srcs/bonjour >srcs/hello <prout
$> cat srcs/bonjour
$> cat srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >>srcs/bonjour >srcs/hello <prout
$> cat srcs/bonjour
$> cat srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #634: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >>srcs/bonjour >>srcs/hello <prout
$> cat srcs/bonjour
$> cat srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >>srcs/bonjour >>srcs/hello <prout
$> cat srcs/bonjour
$> cat srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #635: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >srcs/bonjour <prout >>srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >srcs/bonjour <prout >>srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #636: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >>srcs/bonjour <prout >srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >>srcs/bonjour <prout >srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #637: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >>srcs/bonjour <prout >>srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> >>srcs/bonjour <prout >>srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #638: $> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> <prout >>srcs/bonjour >>srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello' >> "$LOGFILE"
echo "$> echo hola > srcs/bonjour
$> echo hey > srcs/hello
$> <prout >>srcs/bonjour >>srcs/hello
$> cat srcs/bonjour
$> cat srcs/hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #639: $> echo hola > bonjour
$> echo hey > hello
$> <bonjour >hello
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> <bonjour >hello
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #640: $> echo hola > bonjour
$> echo hey > hello
$> >bonjour >hello < prout
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> >bonjour >hello < prout
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #641: $> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> >bonjour >hello < prout
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> >bonjour >hello < prout
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #642: $> echo hola > bonjour
$> echo hey > hello
$> >bonjour <prout hello
$> cat bonjour
$> cat hello' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> >bonjour <prout hello
$> cat bonjour
$> cat hello
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #643: $> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> >bonjour <prout hello
$> cat bonjour' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> echo hey > hello
$> rm bonjour hello
$> >bonjour <prout hello
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #644: $> echo hola > bonjour
$> <bonjour cat | wc > bonjour
$> cat bonjour' >> "$LOGFILE"
echo "$> echo hola > bonjour
$> <bonjour cat | wc > bonjour
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #645: $> rm -f bonjour
$> rm bonjour > bonjour
$> ls -l bonjour' >> "$LOGFILE"
echo "$> rm -f bonjour
$> rm bonjour > bonjour
$> ls -l bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #646: $> export HOLA="bonjour hello"
$> >$HOLA
$> ls' >> "$LOGFILE"
echo "$> export HOLA="bonjour hello"
$> >$HOLA
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #647: $> export HOLA="bonjour hello"
$> >"$HOLA"
$> ls' >> "$LOGFILE"
echo "$> export HOLA="bonjour hello"
$> >"$HOLA"
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #648: $> export HOLA="bonjour hello"
$> >$"HOLA"
$> ls' >> "$LOGFILE"
echo "$> export HOLA="bonjour hello"
$> >$"HOLA"
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #649: $> export HOLA="bonjour hello"
$> >$HOLA>hey
$> ls' >> "$LOGFILE"
echo "$> export HOLA="bonjour hello"
$> >$HOLA>hey
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #650: $> export HOLA="bonjour hello"
$> >hey>$HOLA
$> ls' >> "$LOGFILE"
echo "$> export HOLA="bonjour hello"
$> >hey>$HOLA
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #651: $> export HOLA="bonjour hello"
$> >hey>$HOLA>hey>hey
$> ls' >> "$LOGFILE"
echo "$> export HOLA="bonjour hello"
$> >hey>$HOLA>hey>hey
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #652: $> export A=hey
$> export A B=Hola D E C="Que Tal"
$> echo $PROUT$B$C > /tmp/a > /tmp/b > /tmp/c
$> cat /tmp/a
$> cat /tmp/b
$> cat /tmp/c' >> "$LOGFILE"
echo "$> export A=hey
$> export A B=Hola D E C="Que Tal"
$> echo $PROUT$B$C > /tmp/a > /tmp/b > /tmp/c
$> cat /tmp/a
$> cat /tmp/b
$> cat /tmp/c
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #653: $> <a cat <b <c' >> "$LOGFILE"
echo "$> <a cat <b <c
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #654: $> <a cat <b <c
$> cat a
$> cat b
$> cat c' >> "$LOGFILE"
echo "$> <a cat <b <c
$> cat a
$> cat b
$> cat c
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #655: $> >a ls >b >>c >d
$> cat a
$> cat b
$> cat c
$> cat d' >> "$LOGFILE"
echo "$> >a ls >b >>c >d
$> cat a
$> cat b
$> cat c
$> cat d
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #656: $> echo hola > a > b > c
$> cat a
$> cat b
$> cat c' >> "$LOGFILE"
echo "$> echo hola > a > b > c
$> cat a
$> cat b
$> cat c
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #657: $> mkdir dir
$> ls -la > dir/bonjour
$> cat dir/bonjour' >> "$LOGFILE"
echo "$> mkdir dir
$> ls -la > dir/bonjour
$> cat dir/bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #658: $> <a
$> cat a' >> "$LOGFILE"
echo "$> <a
$> cat a
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #659: $> >d cat <a >>e
$> cat a
$> cat d
$> cat e' >> "$LOGFILE"
echo "$> >d cat <a >>e
$> cat a
$> cat d
$> cat e
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #660: $> < a > b cat > hey >> d
$> cat d
$> ls' >> "$LOGFILE"
echo "$> < a > b cat > hey >> d
$> cat d
$> ls
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #661: $> cat << hola' >> "$LOGFILE"
echo "$> cat << hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #662: $> cat << 'hola'' >> "$LOGFILE"
echo "$> cat << 'hola'
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #663: $> cat << "hola"' >> "$LOGFILE"
echo "$> cat << "hola"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #664: $> cat << ho"la"' >> "$LOGFILE"
echo "$> cat << ho"la"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #665: $> cat << $HOME' >> "$LOGFILE"
echo "$> cat << $HOME
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #666: $> cat << hola > bonjour
$> cat bonjour' >> "$LOGFILE"
echo "$> cat << hola > bonjour
$> cat bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #667: $> cat << hola | rev' >> "$LOGFILE"
echo "$> cat << hola | rev
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #668: $> << hola' >> "$LOGFILE"
echo "$> << hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #669: $> <<hola' >> "$LOGFILE"
echo "$> <<hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #670: $> cat <<' >> "$LOGFILE"
echo "$> cat <<
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #671: $> cat << prout << lol << koala' >> "$LOGFILE"
echo "$> cat << prout << lol << koala
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #672: $> prout << lol << cat << koala' >> "$LOGFILE"
echo "$> prout << lol << cat << koala
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #673: $> << $hola' >> "$LOGFILE"
echo "$> << $hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #674: $> << $"hola"$"b"' >> "$LOGFILE"
echo "$> << $"hola"$"b"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #675: $> << $"$hola"$$"b"' >> "$LOGFILE"
echo "$> << $"$hola"$$"b"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #676: $> << ho$la$"$a"$$"b"' >> "$LOGFILE"
echo "$> << ho$la$"$a"$$"b"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #677: $> echo hola <<< bonjour' >> "$LOGFILE"
echo "$> echo hola <<< bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #678: $> echo hola <<<< bonjour' >> "$LOGFILE"
echo "$> echo hola <<<< bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #679: $> echo hola <<<<< bonjour' >> "$LOGFILE"
echo "$> echo hola <<<<< bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #680: $> ls *' >> "$LOGFILE"
echo "$> ls *
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #681: $> ls *.*' >> "$LOGFILE"
echo "$> ls *.*
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #682: $> ls *.hola' >> "$LOGFILE"
echo "$> ls *.hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #683: $> cat M*le' >> "$LOGFILE"
echo "$> cat M*le
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #684: $> cat M*ee' >> "$LOGFILE"
echo "$> cat M*ee
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #685: $> cat Make*file' >> "$LOGFILE"
echo "$> cat Make*file
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #686: bash: syntax error near
unexpected token `newline'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `newline'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #687: bash: syntax error near
unexpected token `>>'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `>>'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #688: bash: syntax error near
unexpected token `<<'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `<<'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #689: bash: syntax error near
unexpected token `>'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `>'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #690: bash: /: Is a directory
$>' >> "$LOGFILE"
echo "bash: /: Is a directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #691: bash: //: Is a directory
$>' >> "$LOGFILE"
echo "bash: //: Is a directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #692: bash: /.: Is a directory
$>' >> "$LOGFILE"
echo "bash: /.: Is a directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #693: bash: /./../../../../..: Is a directory
$>' >> "$LOGFILE"
echo "bash: /./../../../../..: Is a directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #694: bash: ///////: Is a directory
$>' >> "$LOGFILE"
echo "bash: ///////: Is a directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #695: bash: -: command not found
$>' >> "$LOGFILE"
echo "bash: -: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #696: bash: syntax error near
unexpected token `|'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `|'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #697: bash: syntax error near
unexpected token `||'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `||'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #698: bash: syntax error near
unexpected token `&&'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `&&'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #699: bash: syntax error near
unexpected token `;;'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `;;'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #700: bash: syntax error near
unexpected token `)'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `)'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #701: bash: : command not found
$>' >> "$LOGFILE"
echo "bash: : command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #702: bash: hola: command not found
$>' >> "$LOGFILE"
echo "bash: hola: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #703: bash: crashtest.c: command not found
$>' >> "$LOGFILE"
echo "bash: crashtest.c: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #704: bash: Docs/attest.cation: command not found
$>' >> "$LOGFILE"
echo "bash: Docs/attest.cation: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #705: bash: .: filename argument required
$>' >> "$LOGFILE"
echo "bash: .: filename argument required
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #706: bash: ..: command not found
$>' >> "$LOGFILE"
echo "bash: ..: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #707: bash: /home/vietdu91: Is a directory
$>' >> "$LOGFILE"
echo "bash: /home/vietdu91: Is a directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #708: bash: 4ABC=hola: command not found
$>' >> "$LOGFILE"
echo "bash: 4ABC=hola: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #709: bash: Makefile: command not found
$>' >> "$LOGFILE"
echo "bash: Makefile: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #710: Hola
$>' >> "$LOGFILE"
echo "Hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #711: bash: echoHola: command not found
$>' >> "$LOGFILE"
echo "bash: echoHola: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #712: bash: echo-nHola: command not found
$>' >> "$LOGFILE"
echo "bash: echo-nHola: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #713: Hola$>' >> "$LOGFILE"
echo "Hola$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #714: -nHola
$>' >> "$LOGFILE"
echo "-nHola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #715: Hola -n
$>' >> "$LOGFILE"
echo "Hola -n
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #716: Hola Que Tal
$>' >> "$LOGFILE"
echo "Hola Que Tal
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #717: n hola
$>' >> "$LOGFILE"
echo "n hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #718: hola que tal
$>' >> "$LOGFILE"
echo "hola que tal
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #719: Hola Que$>' >> "$LOGFILE"
echo "Hola Que$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #720: -p
$>' >> "$LOGFILE"
echo "-p
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #721: -n-nnn -nnnn
$>' >> "$LOGFILE"
echo "-n-nnn -nnnn
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #722: hola -nnnn$>' >> "$LOGFILE"
echo "hola -nnnn$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #723: -nnn-nnnn$>' >> "$LOGFILE"
echo "-nnn-nnnn$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #724: --------n
$>' >> "$LOGFILE"
echo "--------n
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #725: --------n$>' >> "$LOGFILE"
echo "--------n$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #726: -----nn---nnnn$>' >> "$LOGFILE"
echo "-----nn---nnnn$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #727: --------nnnn$>' >> "$LOGFILE"
echo "--------nnnn$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #728: 0
$>' >> "$LOGFILE"
echo "0
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #729: 0$
$>' >> "$LOGFILE"
echo "0$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #730: /home/vietdu91
$>' >> "$LOGFILE"
echo "/home/vietdu91
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #731: $HOME
$>' >> "$LOGFILE"
echo "$HOME
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #732: my shit terminal is [xterm-256color]
$>' >> "$LOGFILE"
echo "my shit terminal is [xterm-256color]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #733: my shit terminal is [
$>' >> "$LOGFILE"
echo "my shit terminal is [
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #734: my shit terminal is []
$>' >> "$LOGFILE"
echo "my shit terminal is []
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #735: 1000
$>' >> "$LOGFILE"
echo "1000
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #736: HOME
$>' >> "$LOGFILE"
echo "HOME
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #737: /home/vietdu91%
$>' >> "$LOGFILE"
echo "/home/vietdu91%
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #738: 1000/home/vietdu91%
$>' >> "$LOGFILE"
echo "1000/home/vietdu91%
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #739: Le path de mon HOME est /home/vietdu91
$>' >> "$LOGFILE"
echo "Le path de mon HOME est /home/vietdu91
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #740: vietdu91$USERvietdu91$USERtestvietdu91
$>' >> "$LOGFILE"
echo "vietdu91$USERvietdu91$USERtestvietdu91
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #741: bash: syntax error near unexpected token `<'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `<'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #742: bash: syntax error near unexpected token `|'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `|'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #743: bash: EechoE: command not found
$>' >> "$LOGFILE"
echo "bash: EechoE: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #744: bash: .echo.: command not found
$>' >> "$LOGFILE"
echo "bash: .echo.: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #745: bash: syntax error near unexpected token `newline'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `newline'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #746: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #747: Docs Dockers Drawings
$>' >> "$LOGFILE"
echo "Docs Dockers Drawings
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #748: *Z
$>' >> "$LOGFILE"
echo "*Z
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #749: crashtest.c test.c hola
$>' >> "$LOGFILE"
echo "crashtest.c test.c hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #750: crashtest.c test.c
$>' >> "$LOGFILE"
echo "crashtest.c test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #751: hola*hola crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>' >> "$LOGFILE"
echo "hola*hola crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #752: ME
$>' >> "$LOGFILE"
echo "ME
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #753: ''ME'
$>' >> "$LOGFILE"
echo "''ME'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #754: $=HOME
$>' >> "$LOGFILE"
echo "$=HOME
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #755: HOLA
$>' >> "$LOGFILE"
echo "HOLA
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #756: hola
$>' >> "$LOGFILE"
echo "hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #757: 'h'o'la''
$>' >> "$LOGFILE"
echo "'h'o'la''
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #758: hola'
$>' >> "$LOGFILE"
echo "hola'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #759: bash: echo'hola': command not found
$>' >> "$LOGFILE"
echo "bash: echo'hola': command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #760: 'hola'
$>' >> "$LOGFILE"
echo "'hola'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #761: "hola"
$>' >> "$LOGFILE"
echo ""hola"
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #762: ho"l"a
$>' >> "$LOGFILE"
echo "ho"l"a
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #763: hola''''''''''
$>' >> "$LOGFILE"
echo "hola''''''''''
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #764: hola""""""""""
$>' >> "$LOGFILE"
echo "hola""""""""""
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #765: bash: echo hola: command not found
$>' >> "$LOGFILE"
echo "bash: echo hola: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #766: hola     $
$>' >> "$LOGFILE"
echo "hola     $
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #767: holabonjour
$>' >> "$LOGFILE"
echo "holabonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #768: bonjour
$>' >> "$LOGFILE"
echo "bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #769: bash: e'c'ho 'b'onjo'u'r: command not found
$>' >> "$LOGFILE"
echo "bash: e'c'ho 'b'onjo'u'r: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #770: Makefile
$>' >> "$LOGFILE"
echo "Makefile
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #771: bash: 0: command not found
$>' >> "$LOGFILE"
echo "bash: 0: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #772: bash: 00: command not found
$>' >> "$LOGFILE"
echo "bash: 00: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #773: bash: ?/home/vietdu91: command not found
$>' >> "$LOGFILE"
echo "bash: ?/home/vietdu91: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #774: bash: $: command not found
$>' >> "$LOGFILE"
echo "bash: $: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #775: bash: $HOMEsddfddfssfdfs: command not found
$>' >> "$LOGFILE"
echo "bash: $HOMEsddfddfssfdfs: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #776: bash: -R: command not found
$>' >> "$LOGFILE"
echo "bash: -R: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #777: $> ^C
$>' >> "$LOGFILE"
echo "$> ^C
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #778: $> hola^C
$>' >> "$LOGFILE"
echo "$> hola^C
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #779: ^C
$>' >> "$LOGFILE"
echo "^C
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #780: $> exit
~/minishell $>' >> "$LOGFILE"
echo "$> exit
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #781: $> hola' >> "$LOGFILE"
echo "$> hola
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #782: ^\Quit (core dumped)
$>' >> "$LOGFILE"
echo "^\Quit (core dumped)
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #783: ...
PATH=...
$>' >> "$LOGFILE"
echo "...
PATH=...
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #784: env: ʻhola’: No such file or directory
$>' >> "$LOGFILE"
echo "env: ʻhola’: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #785: env: ‘./Makefile’: Permission denied
$>' >> "$LOGFILE"
echo "env: ‘./Makefile’: Permission denied
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #786: ...
HOLA=bonjour
$>' >> "$LOGFILE"
echo "...
HOLA=bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #787: ...
export PATH="..."
$>' >> "$LOGFILE"
echo "...
export PATH="..."
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #788: ...
export HOME="/home/vietdu91"
export Hola
export PATH="..."
$>' >> "$LOGFILE"
echo "...
export HOME="/home/vietdu91"
export Hola
export PATH="..."
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #789: ...
export HOME="/home/vietdu91"
export Hola9hey
export PATH="..."
$>' >> "$LOGFILE"
echo "...
export HOME="/home/vietdu91"
export Hola9hey
export PATH="..."
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #790: ...
export HOME="/home/vietdu91"
export PATH="..."
$>' >> "$LOGFILE"
echo "...
export HOME="/home/vietdu91"
export PATH="..."
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #791: export HOME="/home/vietdu91"
$>' >> "$LOGFILE"
echo "export HOME="/home/vietdu91"
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #792: bash: export: `': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #793: bash: export: ʻ=': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: ʻ=': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #794: bash: export: ʻ%': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: ʻ%': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #795: bash: export: `0': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `0': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #796: bash: export: ʻ?=2': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: ʻ?=2': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #797: bash: export: ʻ9HOLA=': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: ʻ9HOLA=': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #798: ...
HOLA9=bonjour
$>' >> "$LOGFILE"
echo "...
HOLA9=bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #799: ...
_HOLA=bonjour
$>' >> "$LOGFILE"
echo "...
_HOLA=bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #800: ...
___HOLA=bonjour
$>' >> "$LOGFILE"
echo "...
___HOLA=bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #801: ...
_HO_LA_=bonjour
$>' >> "$LOGFILE"
echo "...
_HO_LA_=bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #802: bash: export: ʻHOL@=bonjour’: not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: ʻHOL@=bonjour’: not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #803: bash: export: `HOL~A=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HOL~A=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #804: bash: export: -H: invalid option' >> "$LOGFILE"
echo "bash: export: -H: invalid option
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #805: bash: export: --: invalid option' >> "$LOGFILE"
echo "bash: export: --: invalid option
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #806: bash: export: `HOLA-=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HOLA-=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #807: bash: export: `HO-LA=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HO-LA=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #808: bash: export: `HOL.A=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HOL.A=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #809: bash: export: `HOL\$A=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HOL\$A=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #810: bash: export: `HO\\LA=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HO\\LA=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #811: bash: export: `HOL}A=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HOL}A=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #812: bash: export: `HOL{A=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HOL{A=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #813: bash: export: `HO*LA=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HO*LA=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #814: bash: export: `HO#LA=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HO#LA=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #815: bash: export: `HO@LA=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HO@LA=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #816: ...
HO0LA=bonjour
$>' >> "$LOGFILE"
echo "...
HO0LA=bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #817: bash: export: `+HOLA=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `+HOLA=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #818: bash: export: `HOL+A=bonjour': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `HOL+A=bonjour': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #819: ...
HOLA=bonjourbonjour
$>' >> "$LOGFILE"
echo "...
HOLA=bonjourbonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #820: bash: export: ʻ=bonjour’: not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: ʻ=bonjour’: not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #821: ...
HOLA=bon
$>' >> "$LOGFILE"
echo "...
HOLA=bon
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #822: ...
HOLA=
$>' >> "$LOGFILE"
echo "...
HOLA=
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #823: ...
HOLA=/home/vietdu91
$>' >> "$LOGFILE"
echo "...
HOLA=/home/vietdu91
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #824: ...
HOLA=bonjour/home/vietdu91
$>' >> "$LOGFILE"
echo "...
HOLA=bonjour/home/vietdu91
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #825: ...
HOLA=bon\jour
$>' >> "$LOGFILE"
echo "...
HOLA=bon\jour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #826: bash: syntax error near
unexpected token `('
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `('
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #827: bash: jour: command not found
$>' >> "$LOGFILE"
echo "bash: jour: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #828: $> env
...
HOLA=bon@jour
$>' >> "$LOGFILE"
echo "$> env
...
HOLA=bon@jour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #829: bash: jour: command not found
$> env
...
HOLA=bon
$>' >> "$LOGFILE"
echo "bash: jour: command not found
$> env
...
HOLA=bon
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #830: bash: !jour: event not found
$>' >> "$LOGFILE"
echo "bash: !jour: event not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #831: ...
HOLA=bonjour
PATH=...
$>' >> "$LOGFILE"
echo "...
HOLA=bonjour
PATH=...
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #832: ...
HOLAvietdu91=bonjour
PATH=...
$>' >> "$LOGFILE"
echo "...
HOLAvietdu91=bonjour
PATH=...
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #833: HOLA=bonjour=casse-toi
$>' >> "$LOGFILE"
echo "HOLA=bonjour=casse-toi
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #834: bonjour et casse-toi
$>' >> "$LOGFILE"
echo "bonjour et casse-toi
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #835: ...
bonjour=bonjour
PATH=...
$>' >> "$LOGFILE"
echo "...
bonjour=bonjour
PATH=...
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #836: bonjour$
$>' >> "$LOGFILE"
echo "bonjour$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #837: bonjour$>' >> "$LOGFILE"
echo "bonjour$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #838: bonjour /
$>' >> "$LOGFILE"
echo "bonjour /
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #839: [cela affiche le Makefile]
$>' >> "$LOGFILE"
echo "[cela affiche le Makefile]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #840: bash: export: `": not a valid identifier
$> env
...
HOLA=bonjour
$>' >> "$LOGFILE"
echo "bash: export: `": not a valid identifier
$> env
...
HOLA=bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #841: cat Makefile | grep NAME
$>' >> "$LOGFILE"
echo "cat Makefile | grep NAME
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #842: heyheyhey=heyhey
$>' >> "$LOGFILE"
echo "heyheyhey=heyhey
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #843: bonjour hey$
$>' >> "$LOGFILE"
echo "bonjour hey$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #844: bonjour    hey    $
$>' >> "$LOGFILE"
echo "bonjour    hey    $
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #845: wesh   bonjour    hey    $
$>' >> "$LOGFILE"
echo "wesh   bonjour    hey    $
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #846: wesh bonjour hey .
$>' >> "$LOGFILE"
echo "wesh bonjour hey .
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #847: weshHOLA.
$>' >> "$LOGFILE"
echo "weshHOLA.
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #848: weshHOLA HOLA.
$>' >> "$LOGFILE"
echo "weshHOLA HOLA.
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #849: hola et bonjour
$>' >> "$LOGFILE"
echo "hola et bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #850: hola et $HOLA
$>' >> "$LOGFILE"
echo "hola et $HOLA
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #851: hola et bonjourbonjour
$>' >> "$LOGFILE"
echo "hola et bonjourbonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #852: ls -l - a
$>' >> "$LOGFILE"
echo "ls -l - a
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #853: total 16
drwx------  2 vietdu91 [...] .
drwxrwxewt 51 root     [...] ..
-rwxr-xr-x  8 vietdu91 [...] crashtest.c
[...]
$>' >> "$LOGFILE"
echo "total 16
drwx------  2 vietdu91 [...] .
drwxrwxewt 51 root     [...] ..
-rwxr-xr-x  8 vietdu91 [...] crashtest.c
[...]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #854: bash: ls -la: command not found
$>' >> "$LOGFILE"
echo "bash: ls -la: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #855: bash: l$HOLA: command not found
$>' >> "$LOGFILE"
echo "bash: l$HOLA: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #856: ...
HOL=A=bonjour
$>' >> "$LOGFILE"
echo "...
HOL=A=bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #857: bash: $HOLAs: command not found
$>' >> "$LOGFILE"
echo "bash: $HOLAs: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #858: ...
HOL=A=
$>' >> "$LOGFILE"
echo "...
HOL=A=
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #859: bash: export: `TE+S=T': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `TE+S=T': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #860: bash: export: `=': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `=': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #861: bash: export: `===': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: export: `===': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #862: bash: pBYEd: command not found
$>' >> "$LOGFILE"
echo "bash: pBYEd: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #863: bash: p$BYEd: command not found
$>' >> "$LOGFILE"
echo "bash: p$BYEd: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #864: bash: HOLABYEd: command not found
$>' >> "$LOGFILE"
echo "bash: HOLABYEd: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #865: bash: echo -n: command not found
$>' >> "$LOGFILE"
echo "bash: echo -n: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #866: 1'2$C"$D5"$F'7'8
$>' >> "$LOGFILE"
echo "1'2$C"$D5"$F'7'8
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #867: bash: ls: No such file or directory' >> "$LOGFILE"
echo "bash: ls: No such file or directory
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #868: bash: unset: `': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: unset: `': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #869: $>
$>
/home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "$>
$>
/home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #870: /home/vietdu91/42_works/minishell
$>
$>
$>
/home/vietdu91' >> "$LOGFILE"
echo "/home/vietdu91/42_works/minishell
$>
$>
$>
/home/vietdu91
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #871: bash: unset: `9HOLA': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: unset: `9HOLA': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #872: bash: unset: `HOL?A': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: unset: `HOL?A': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #873: bash: unset: `HOL?A': not a valid identifier
bash: unset: `HOL.A': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: unset: `HOL?A': not a valid identifier
bash: unset: `HOL.A': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #874: bash: unset: `HOLA=': not a valid identifier
$>' >> "$LOGFILE"
echo "bash: unset: `HOLA=': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #875: bash: unset: `': not a valid identifier
$>
$>' >> "$LOGFILE"
echo "bash: unset: `': not a valid identifier
$>
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #876: bash: cat: No such file or directory
$>' >> "$LOGFILE"
echo "bash: cat: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #877: ...
  558 echo $?
  559 clear
  560 history
$>' >> "$LOGFILE"
echo "...
  558 echo $?
  559 clear
  560 history
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #878: $> clear' >> "$LOGFILE"
echo "$> clear
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #879: /home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "/home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #880: bash: pwd: -p: invalid option
$>' >> "$LOGFILE"
echo "bash: pwd: -p: invalid option
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #881: bash: pwd: --: invalid option
$>' >> "$LOGFILE"
echo "bash: pwd: --: invalid option
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #882: bash: cd: too many arguments
$>' >> "$LOGFILE"
echo "bash: cd: too many arguments
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #883: bash: cd: sr: No such file or directory
$>' >> "$LOGFILE"
echo "bash: cd: sr: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #884: bash: cd: Makefile: Not a directory
$>' >> "$LOGFILE"
echo "bash: cd: Makefile: Not a directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #885: bash: cd: .././../.././../bin/ls: No such file or directory
$>' >> "$LOGFILE"
echo "bash: cd: .././../.././../bin/ls: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #886: bash: cd: /minishell: No such file or directory
$>' >> "$LOGFILE"
echo "bash: cd: /minishell: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #887: bash: cd: _: No such file or directory
$>' >> "$LOGFILE"
echo "bash: cd: _: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #888: bash: cd: --: invalid option
$>' >> "$LOGFILE"
echo "bash: cd: --: invalid option
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #889: bash: cd: $PWD/srcs: No such file or directory
$>' >> "$LOGFILE"
echo "bash: cd: $PWD/srcs: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #890: bash: cd: HOME not set
$>' >> "$LOGFILE"
echo "bash: cd: HOME not set
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #891: bash: cd: minishell: No such file or directory
$>' >> "$LOGFILE"
echo "bash: cd: minishell: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #892: chdir: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory
$>' >> "$LOGFILE"
echo "chdir: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #893: pwd: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory
$>' >> "$LOGFILE"
echo "pwd: error retrieving current directory: getcwd: cannot access parent directories: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #894: /home/vietdu91/42_works/minishell/a/b
$>
/home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "/home/vietdu91/42_works/minishell/a/b
$>
/home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #895: /home
$>
/home/vietdu91/42_works/minishell/a/b
$>' >> "$LOGFILE"
echo "/home
$>
/home/vietdu91/42_works/minishell/a/b
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #896: ../../../home/vietdu91/42_works/minishell/a
$>
../../../home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "../../../home/vietdu91/42_works/minishell/a
$>
../../../home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #897: bash: ./minishell : Permission denied
$>' >> "$LOGFILE"
echo "bash: ./minishell : Permission denied
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #898: ls: cannot access 'hola': No such file or directory
$>' >> "$LOGFILE"
echo "ls: cannot access 'hola': No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #899: bash: ./Makefile: Permission denied
$>' >> "$LOGFILE"
echo "bash: ./Makefile: Permission denied
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #900: bash: ./hola: Permission denied
$>' >> "$LOGFILE"
echo "bash: ./hola: Permission denied
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #901: 66
$>' >> "$LOGFILE"
echo "66
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #902: bash: wc -l: command not found
$>' >> "$LOGFILE"
echo "bash: wc -l: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #903: 2
$>' >> "$LOGFILE"
echo "2
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #904: PWD=/mnt/nfs/homes/emtran/Desktop/42_minishell
SHLVL=1
_=/usr/bin/env
$>' >> "$LOGFILE"
echo "PWD=/mnt/nfs/homes/emtran/Desktop/42_minishell
SHLVL=1
_=/usr/bin/env
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #905: export OLDPWD
export PWD="/mnt/nfs/homes/emtran/Desktop/42_minishell"
export SHLVL="1"
$>' >> "$LOGFILE"
echo "export OLDPWD
export PWD="/mnt/nfs/homes/emtran/Desktop/42_minishell"
export SHLVL="1"
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #906: exit
~/minishell $>' >> "$LOGFILE"
echo "exit
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #907: exit
bash: exit: exit: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: exit: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #908: exit
bash: exit: hola: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: hola: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #909: exit
bash: exit: too many arguments
$>' >> "$LOGFILE"
echo "exit
bash: exit: too many arguments
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #910: exit
bash: exit: --666: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: --666: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #911: exit
bash: exit: ++++666: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: ++++666: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #912: exit
bash: exit: ++++++0: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: ++++++0: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #913: exit
bash: exit: ------0: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: ------0: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #914: exit
bash: exit: ----666: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: ----666: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #915: exit
bash: exit: '666': numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: '666': numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #916: exit
bash: exit: "666": numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: "666": numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #917: exit
bash: exit: 9223372036854775808: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: 9223372036854775808: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #918: exit
bash: exit: -9223372036854775809: numeric argument required
~/minishell $>' >> "$LOGFILE"
echo "exit
bash: exit: -9223372036854775809: numeric argument required
~/minishell $>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #919: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c



$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c



$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #920: hola$
$>' >> "$LOGFILE"
echo "hola$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #921: que tal
$>' >> "$LOGFILE"
echo "que tal
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #922: oui$
$>' >> "$LOGFILE"
echo "oui$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #923: hola$$$
$>' >> "$LOGFILE"
echo "hola$$$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #924: docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
   ether 02:42:27:cf:95:49  txqueuelen 0  (Ethernet)
[...]
$>' >> "$LOGFILE"
echo "docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
   ether 02:42:27:cf:95:49  txqueuelen 0  (Ethernet)
[...]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #925: vietdu91
$>' >> "$LOGFILE"
echo "vietdu91
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #926: vietdu91$$
$>' >> "$LOGFILE"
echo "vietdu91$$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #927: ls: /usr/bin/ls /usr/share/man/man1/ls.1posix.gz /usr/share/man/man1/ls.1.gz$$
$>' >> "$LOGFILE"
echo "ls: /usr/bin/ls /usr/share/man/man1/ls.1posix.gz /usr/share/man/man1/ls.1.gz$$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #928: bash: hola: command not found
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>' >> "$LOGFILE"
echo "bash: hola: command not found
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #929: aloh
$>' >> "$LOGFILE"
echo "aloh
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #930: test.c$$$$$$$$$$$
$>' >> "$LOGFILE"
echo "test.c$$$$$$$$$$$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #931: crashtest.c Docs Dockers Drawings Makefile minishell philosophers srcs test.c
$>' >> "$LOGFILE"
echo "crashtest.c Docs Dockers Drawings Makefile minishell philosophers srcs test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #932: bash: ech: command not found
bash: o: command not found
$>' >> "$LOGFILE"
echo "bash: ech: command not found
bash: o: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #933: [...]
$$
.PHONY:    all clean fclean re$$
$>' >> "$LOGFILE"
echo "[...]
$$
.PHONY:    all clean fclean re$$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #934: objs/%.o:                srcs/%.c$
                        @norminette srcs/*$
$>' >> "$LOGFILE"
echo "objs/%.o:                srcs/%.c$
                        @norminette srcs/*$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #935: bash: cd: file_not_exist: No such file or directory
$>' >> "$LOGFILE"
echo "bash: cd: file_not_exist: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #936: bash: hello: command not found
$>' >> "$LOGFILE"
echo "bash: hello: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #937: hola
$>
$>' >> "$LOGFILE"
echo "hola
$>
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #938: real	0m3.002s
user	0m0.003s
sys	0m0.001s
$>' >> "$LOGFILE"
echo "real	0m3.002s
user	0m0.003s
sys	0m0.001s
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #939: /home/vietdu91/42_works/minishell
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>' >> "$LOGFILE"
echo "/home/vietdu91/42_works/minishell
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #940: hola
bonjour
$>' >> "$LOGFILE"
echo "hola
bonjour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #941: bonjour
hola
$>' >> "$LOGFILE"
echo "bonjour
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #942: bonjourhola$>' >> "$LOGFILE"
echo "bonjourhola$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #943: /home/vietdu91/42_works/minishell
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
hola
$>' >> "$LOGFILE"
echo "/home/vietdu91/42_works/minishell
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #944: /home/vietdu91/42_works/minishell
hola
$>' >> "$LOGFILE"
echo "/home/vietdu91/42_works/minishell
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #945: bash: export: `': not a valid identifier
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>' >> "$LOGFILE"
echo "bash: export: `': not a valid identifier
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #946: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
bash: export: `': not a valid identifier
$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
bash: export: `': not a valid identifier
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #947: bash: syntax error near
unexpected token `;'
$>' >> "$LOGFILE"
echo "bash: syntax error near
unexpected token `;'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #948: bash: syntax error near unexpected token `newline'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `newline'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #949: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c


$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c


$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #950: bash: export: `': not a valid identifier' >> "$LOGFILE"
echo "bash: export: `': not a valid identifier
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #951: bash: syntax error near unexpected token `)'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `)'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #952: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #953: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
/home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  srcs  test.c
/home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #954: crashtest.c
Docs
Dockers
Drawings
Makefile
minishell
philosophers
srcs
test.c
/home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "crashtest.c
Docs
Dockers
Drawings
Makefile
minishell
philosophers
srcs
test.c
/home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #955: bash: syntax error near unexpected token `('
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `('
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #956: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #957: bash: pwd: No such file or directory
$>' >> "$LOGFILE"
echo "bash: pwd: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #958: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #959: bash: lss: command not found
/home/vietdu91/42_works/minishell
bash: lss: command not found
/home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "bash: lss: command not found
/home/vietdu91/42_works/minishell
bash: lss: command not found
/home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #960: bash: lss: command not found
$>' >> "$LOGFILE"
echo "bash: lss: command not found
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #961: crashtest.c
Docs
Dockers
Drawings
Makefile
minishell
philosophers
srcs
test.c
      1       1      34
$>' >> "$LOGFILE"
echo "crashtest.c
Docs
Dockers
Drawings
Makefile
minishell
philosophers
srcs
test.c
      1       1      34
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #962: hey
$>
crashtest.c
Docs
[...]
srcs
test.c
      1       1      34
crashtest.c
Docs
[...]
srcs
test.c
      1       1      34
$>' >> "$LOGFILE"
echo "hey
$>
crashtest.c
Docs
[...]
srcs
test.c
      1       1      34
crashtest.c
Docs
[...]
srcs
test.c
      1       1      34
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #963: 1       1      34
$>' >> "$LOGFILE"
echo "1       1      34
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #964: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
      1       1      34
$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
      1       1      34
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #965: ls: invalid option -- 'z'
      1       1      34
$>' >> "$LOGFILE"
echo "ls: invalid option -- 'z'
      1       1      34
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #966: ls: invalid option -- 'z'
/home/vietdu91/42_works/minishell
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
$>' >> "$LOGFILE"
echo "ls: invalid option -- 'z'
/home/vietdu91/42_works/minishell
crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  pwd  srcs  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #967: ls: invalid option -- 'z'
$>' >> "$LOGFILE"
echo "ls: invalid option -- 'z'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #968: /home/vietdu91/42_works/minishell
$>
crashtest.c
Docs
[...]
srcs
test.c
$>' >> "$LOGFILE"
echo "/home/vietdu91/42_works/minishell
$>
crashtest.c
Docs
[...]
srcs
test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #969: /home/vietdu91/
/home/vietdu91/
$>' >> "$LOGFILE"
echo "/home/vietdu91/
/home/vietdu91/
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #970: /home/vietdu91/
/home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "/home/vietdu91/
/home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #971: ls: invalid option -- 'z'
/home/vietdu91
$>
/home/vietdu91
$>' >> "$LOGFILE"
echo "ls: invalid option -- 'z'
/home/vietdu91
$>
/home/vietdu91
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #972: ls: invalid option -- 'z'
/home/vietdu91
$>
/home/vietdu91/42_works/minishell
$>' >> "$LOGFILE"
echo "ls: invalid option -- 'z'
/home/vietdu91
$>
/home/vietdu91/42_works/minishell
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #973: hola
que tal
$>' >> "$LOGFILE"
echo "hola
que tal
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #974: $>
$>
hola
que tal
$>' >> "$LOGFILE"
echo "$>
$>
hola
que tal
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #975: hola que tal$
$>' >> "$LOGFILE"
echo "hola que tal$
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #976: $>
hola
$>' >> "$LOGFILE"
echo "$>
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #977: grep: /usr/bin/grep /usr/share/man/man1/grep.1.gz /usr/share/man/man1/grep.1posix.gz /usr/share/info/grep.info.gz
$>' >> "$LOGFILE"
echo "grep: /usr/bin/grep /usr/share/man/man1/grep.1.gz /usr/share/man/man1/grep.1posix.gz /usr/share/info/grep.info.gz
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #978: bash: syntax error near unexpected token `>'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `>'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #979: bash: prout: command not found
$>
bonjour [...]' >> "$LOGFILE"
echo "bash: prout: command not found
$>
bonjour [...]
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #980: $>
hello
$>
hola
$>' >> "$LOGFILE"
echo "$>
hello
$>
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #981: hola
hola
$>' >> "$LOGFILE"
echo "hola
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #982: hola
hola
hola
$>' >> "$LOGFILE"
echo "hola
hola
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #983: hola
hola
$>
hey
$>' >> "$LOGFILE"
echo "hola
hola
$>
hey
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #984: bonjour hola
$>' >> "$LOGFILE"
echo "bonjour hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #985: $>
$>
hey hola
$>' >> "$LOGFILE"
echo "$>
$>
hey hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #986: hola1  hola2  [...]
$>
$>
hello
2
$>' >> "$LOGFILE"
echo "hola1  hola2  [...]
$>
$>
hello
2
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #987: hola1  hola2  [...]
$>
bonjour
$>
2
$>' >> "$LOGFILE"
echo "hola1  hola2  [...]
$>
bonjour
$>
2
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #988: pwd
$>' >> "$LOGFILE"
echo "pwd
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #989: .: not enough arguments
$>' >> "$LOGFILE"
echo ".: not enough arguments
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #990: bash: srcs/pwd: No such file or directory
$>' >> "$LOGFILE"
echo "bash: srcs/pwd: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #991: bash: ../pwd: No such file or directory
$>' >> "$LOGFILE"
echo "bash: ../pwd: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #992: bash: syntax error near unexpected token `>'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `>'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #993: bash: syntax error near unexpected token `<<'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `<<'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #994: bash: ls: No such file or directory
$>' >> "$LOGFILE"
echo "bash: ls: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #995: bash: ls2: No such file or directory
$>
ls1  [...]
$>' >> "$LOGFILE"
echo "bash: ls2: No such file or directory
$>
ls1  [...]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #996: bonjour 1' [...]
$>
hola
$>' >> "$LOGFILE"
echo "bonjour 1' [...]
$>
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #997: bonjour [...]
$>
hola hey
$>
cat: hey: No such file or directory
$>' >> "$LOGFILE"
echo "bonjour [...]
$>
hola hey
$>
cat: hey: No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #998: bash: prout: No such file or directory
$>
$>' >> "$LOGFILE"
echo "bash: prout: No such file or directory
$>
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #999: bash: prout: No such file or directory
$>
bonjour  hello
$>
$>' >> "$LOGFILE"
echo "bash: prout: No such file or directory
$>
bonjour  hello
$>
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1000: bash: prout: No such file or directory
$>
$>
hey
$>' >> "$LOGFILE"
echo "bash: prout: No such file or directory
$>
$>
hey
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1001: bash: prout: No such file or directory
$>
bonjour
$>
$>' >> "$LOGFILE"
echo "bash: prout: No such file or directory
$>
bonjour
$>
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1002: bash: prout: No such file or directory
$>
bonjour
$>
hey
$>' >> "$LOGFILE"
echo "bash: prout: No such file or directory
$>
bonjour
$>
hey
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1003: hola
$>
>>' >> "$LOGFILE"
echo "hola
$>
>>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1004: bash: prout: No such file or directory
$>
$>
$>' >> "$LOGFILE"
echo "bash: prout: No such file or directory
$>
$>
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1005: 0       0       0
$>' >> "$LOGFILE"
echo "0       0       0
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1006: ls: cannot access 'bonjour': No such file or directory' >> "$LOGFILE"
echo "ls: cannot access 'bonjour': No such file or directory
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1007: 'bonjour hello' [...]
$>' >> "$LOGFILE"
echo "'bonjour hello' [...]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1008: HOLA [...]
$>' >> "$LOGFILE"
echo "HOLA [...]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1009: 'bonjour hello' hey [...]
$>' >> "$LOGFILE"
echo "'bonjour hello' hey [...]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1010: $>
$>
$>
HolaQue Tal
$>' >> "$LOGFILE"
echo "$>
$>
$>
HolaQue Tal
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1011: Prout
$>' >> "$LOGFILE"
echo "Prout
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1012: $>
$>
$>
Amour Tu es Horrible
0123456789
Prout
$>' >> "$LOGFILE"
echo "$>
$>
$>
Amour Tu es Horrible
0123456789
Prout
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1013: $>
$>
$>
Prout
$>
crashtest.c
Docs
[...]
test.c
$>' >> "$LOGFILE"
echo "$>
$>
$>
Prout
$>
crashtest.c
Docs
[...]
test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1014: $>
$>
hola
$>' >> "$LOGFILE"
echo "$>
$>
hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1015: total 16
drwx------  2 vietdu91 [...] .
drwxrwxewt 51 root     [...] ..
[...]
$>' >> "$LOGFILE"
echo "total 16
drwx------  2 vietdu91 [...] .
drwxrwxewt 51 root     [...] ..
[...]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1016: Amour Tu es Horrible
$>' >> "$LOGFILE"
echo "Amour Tu es Horrible
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1017: $>
Amour
$>
Amour
$>' >> "$LOGFILE"
echo "$>
Amour
$>
Amour
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1018: Amour Tu Es Horrible
$>
[...] a b hey d' >> "$LOGFILE"
echo "Amour Tu Es Horrible
$>
[...] a b hey d
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1019: > $HOME
> hola
/home/vietdu91
$>' >> "$LOGFILE"
echo "> $HOME
> hola
/home/vietdu91
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1020: > $HOME
> hola
$HOME
$>' >> "$LOGFILE"
echo "> $HOME
> hola
$HOME
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1021: > prout
> /home/vietdu91
> $HO
> $HOME
$>' >> "$LOGFILE"
echo "> prout
> /home/vietdu91
> $HO
> $HOME
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1022: > prout
> croutte
> antoine pue
> hola
$>
prout
croutte
antoine pue' >> "$LOGFILE"
echo "> prout
> croutte
> antoine pue
> hola
$>
prout
croutte
antoine pue
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1023: > prout
> croutte
> antoine pue
> hola
tuorp
ettuorc
eup eniotna
$>' >> "$LOGFILE"
echo "> prout
> croutte
> antoine pue
> hola
tuorp
ettuorc
eup eniotna
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1024: > chola
> holache
>      hola
> "hola"
> 'hola'
> hola
$>' >> "$LOGFILE"
echo "> chola
> holache
>      hola
> "hola"
> 'hola'
> hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1025: >
>
> hola
$>' >> "$LOGFILE"
echo ">
>
> hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1026: > prout
> lol
> koala
$>' >> "$LOGFILE"
echo "> prout
> lol
> koala
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1027: > prout
> lol
> cat
> koala
bash: prout: command not found' >> "$LOGFILE"
echo "> prout
> lol
> cat
> koala
bash: prout: command not found
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1028: > $hola
$>' >> "$LOGFILE"
echo "> $hola
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1029: > holab
$>' >> "$LOGFILE"
echo "> holab
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1030: > $hola$$b
$>' >> "$LOGFILE"
echo "> $hola$$b
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1031: > hola$a$$b
> ho$la$a$$nb
$>' >> "$LOGFILE"
echo "> hola$a$$b
> ho$la$a$$nb
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1032: bash: syntax error near unexpected token `<<'
$>' >> "$LOGFILE"
echo "bash: syntax error near unexpected token `<<'
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1033: crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  test.c

Docs:
identite.pdf  loyer.pdf
srcs:
main.c  utils.c  sort.c
$>' >> "$LOGFILE"
echo "crashtest.c  Docs  Dockers  Drawings  Makefile  minishell  philosophers  test.c

Docs:
identite.pdf  loyer.pdf
srcs:
main.c  utils.c  sort.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1034: crashtest.c  test.c
$>' >> "$LOGFILE"
echo "crashtest.c  test.c
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1035: ls: cannot access '*.hola' : No such file or directory
$>' >> "$LOGFILE"
echo "ls: cannot access '*.hola' : No such file or directory
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1036: [affiche le Makefile]
$>' >> "$LOGFILE"
echo "[affiche le Makefile]
$>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1037: cat: 'M*ee': No such file or directory' >> "$LOGFILE"
echo "cat: 'M*ee': No such file or directory
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1038: Sortie d'exit (echo $?)' >> "$LOGFILE"
echo "Sortie d'exit (echo $?)
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1039: Marche aussi pour <' >> "$LOGFILE"
echo "Marche aussi pour <
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1040: Marche aussi pour "_@°]=+£$?"' >> "$LOGFILE"
echo "Marche aussi pour "_@°]=+£$?"
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1041: Renvoie le code de retour du dernier pipeline exécuté à l'avant-plan' >> "$LOGFILE"
echo "Renvoie le code de retour du dernier pipeline exécuté à l'avant-plan
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1042: Affiche une seule fois env' >> "$LOGFILE"
echo "Affiche une seule fois env
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1043: Hola n'existe pas dans env mais il existe dans export' >> "$LOGFILE"
echo "Hola n'existe pas dans env mais il existe dans export
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1044: Le cas où la variable "$jour" n'existe pas' >> "$LOGFILE"
echo "Le cas où la variable "$jour" n'existe pas
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1045: Marche pour les caractères : &|' >> "$LOGFILE"
echo "Marche pour les caractères : &|
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1046: /!\ Bien supprimer les espaces en trop au debut et a la fin du string d'export' >> "$LOGFILE"
echo "/!\ Bien supprimer les espaces en trop au debut et a la fin du string d'export
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1047: Il va unset le contenu de $HOLA, c'est-a-dire la variable bonjour' >> "$LOGFILE"
echo "Il va unset le contenu de $HOLA, c'est-a-dire la variable bonjour
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1048: Unset prend en compte le contenu de $?, c'est-a-dire qu'il lit HOL0A ou HOL127A' >> "$LOGFILE"
echo "Unset prend en compte le contenu de $?, c'est-a-dire qu'il lit HOL0A ou HOL127A
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1049: Retourne $PWD' >> "$LOGFILE"
echo "Retourne $PWD
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1050: On doit se retrouver dans le dossier défini par $HOME
/home/vietdu91' >> "$LOGFILE"
echo "On doit se retrouver dans le dossier défini par $HOME
/home/vietdu91
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1051: Retourne à $OLD_PWD
$OLD_PWD et $PWD sont inversés
/home/vietdu91/42_works/minishell' >> "$LOGFILE"
echo "Retourne à $OLD_PWD
$OLD_PWD et $PWD sont inversés
/home/vietdu91/42_works/minishell
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1052: Retourne à $HOME
$OLD_PWD et $PWD sont inversés
/home/vietdu91' >> "$LOGFILE"
echo "Retourne à $HOME
$OLD_PWD et $PWD sont inversés
/home/vietdu91
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1053: Fait la somme de la valeur de $?' >> "$LOGFILE"
echo "Fait la somme de la valeur de $?
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1054: Apparaît la ligne ls
Et 3 retours à la ligne avec la touche Entrée' >> "$LOGFILE"
echo "Apparaît la ligne ls
Et 3 retours à la ligne avec la touche Entrée
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1055: Sort la commande entiere de ls -la' >> "$LOGFILE"
echo "Sort la commande entiere de ls -la
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1056: [BONUS] Marche pour les metacharacters |&;()' >> "$LOGFILE"
echo "[BONUS] Marche pour les metacharacters |&;()
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"

echo 'Running test #1057: [BONUS] Marche pour les metacharacters <>' >> "$LOGFILE"
echo "[BONUS] Marche pour les metacharacters <>
exit" | valgrind --leak-check=full --errors-for-leak-kinds=all ./minishell >> "$LOGFILE" 2>&1
echo '------------------------------------------------------------' >> "$LOGFILE"
