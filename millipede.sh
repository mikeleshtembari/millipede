#!/bin/bash

# press `w` to run nfaster
# press `s` to run slower
# press `d` to make the snake expand more
# press `a` to make the snake expand less

# press `c` to colorize and decolorize snake
# press `x` to crazy colorize and decolorize snake

# press `q` to quit



# Pressing other keys might break the snake :D

# Dependencie: echo, sleep, read, wget, trap, bc


delay=70 # delay in milliseconds
speed_change=5
block_size=4
colored="b"


start=$(date +"%s")


# disable ctrl c / z / \
trap '' INT TSTP

# head of millipede
echo "
  ╚⊙ ⊙╝
╚═(███)═╝";


while [[ true ]]; do
    ndelay=$(echo "$delay / 1000" | bc -l)

    # block to the right
    for (( i = 0; i <= $block_size; i++ )); do
        for (( k = 0; k < $i; k++ )); do
            printf " "
        done

        if [[ $colored = 'x' ]]; then
            echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m╚═(███)═╝"; sleep $ndelay;
        elif [[ $colored = 'c' ]]; then # random Randoms :D
            echo -e "\e[3$(( ( RANDOM % 255 )  + 1 ))m╚═(███)═╝"; sleep $ndelay;
        else
            echo -e "\e[39m╚═(███)═╝"; sleep $ndelay;
        fi

    done

    # block to the left
    for (( i = $block_size; i >= 0; i-- )); do
        for (( k = $i - 1; k >= 0; k-- )); do
            printf " "
        done

        if [[ $colored = 'x' ]]; then
            echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m╚═(███)═╝"; sleep $ndelay;
        elif [[ $colored = 'c' ]]; then # random Randoms :D
            echo -e "\e[3$(( ( RANDOM % 255 )  + 1 ))m╚═(███)═╝"; sleep $ndelay;
        else
            echo -e "\e[39m╚═(███)═╝"; sleep $ndelay;
        fi
    done

    # input
    read -n 1 -t 0.01 input
    if [[ $input = "q" ]] || [[ $input = "Q" ]]; then
        break
    elif [[ $input = "x" ]] || [[ $input = "X" ]]; then
        if [[ $colored = 'x' ]]; then
            colored='b'
        else
            colored='x'
        fi
    elif [[ $input = "c" ]] || [[ $input = "C" ]]; then
        if [[ $colored = 'c' ]]; then
            colored='b'
        else
            colored='c'
        fi
    elif [[ $input = "s" ]] || [[ $input = "S" ]]; then
        delay=$((delay + $speed_change))
    elif [[ $input = "w" ]] || [[ $input = "W" ]]; then
        if (( $delay > $speed_change )); then
            delay=$((delay - $speed_change))
        fi
    elif [[ $input = "d" ]] || [[ $input = "D" ]]; then
        block_size=$((block_size + 1))
    elif [[ $input = "a" ]] || [[ $input = "A" ]]; then
        if (( $block_size > 0 )); then
            block_size=$((block_size - 1))
        fi
    fi
done

end=$(date +"%s")
total_time=$((end - start))

trap - INT TSTP # untrap ctrl c / z
wget -T 3 -t 1 -q --spider "softivator.com/sites/millipede/?src=bash&dur=$total_time"







# minimal snake, with no features. uses ctrl-c to quit

# while [[ true ]]; do
#     echo "╚═(███)═╝"; sleep $delay;
#     echo " ╚═(███)═╝"; sleep $delay;
#     echo "  ╚═(███)═╝"; sleep $delay;
#     echo "   ╚═(███)═╝"; sleep $delay;
#     echo "   ╚═(███)═╝"; sleep $delay;
#     echo "  ╚═(███)═╝"; sleep $delay;
#     echo " ╚═(███)═╝"; sleep $delay;
#     echo "╚═(███)═╝"; sleep $delay;
# done
