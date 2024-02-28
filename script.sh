#!/bin/bash

menu() {
    echo "Wybierz opcję:"
    echo "1) Wyświetl linie z 5 słowami"
    echo "2) Odwróć kolejność znaków w pliku"
    echo "3) Wyświetl pliki z 3 samogłoskami"
    echo "4) Zlicz słowa w pliku"
    echo "5) Podsumuj rozmiary plików"
    echo "6) Wyjście"
}

option_d() {
    sort -n -k2 "$1" | head -5
}

option_v() {
    grep -v 'linux' "$1"
}

option_x() {
    tac "$1"
}

option_y() {
    ls -lt | tail -n 10
}

option_z() {
    cat "$1" | tr '[:lower:]' '[:upper:]'
}




option_1() {
    echo "na razie nie dziala"
}

option_2() {
    
}

option_3() {
    cat "plik | "grep -l -iE '[aeiou].*[aeiou].*[aeiou]' *
}

option_4() {
    cat "plik" | tr ";" "\n" | sort -u | wc -w
}

option_5() {
    ls -l *
}

case "$1" in
    -d) option_d "$2";;
    -v) option_v "$2";;
    -x) option_x "$2";;
    -y) option_y "$2";;
    -z) option_z "$2";;
    *) menu
        read num
        read plik
        case $num in
            1) option_1;;
            2) option_2;;
            3) option_3;;
            4) option_4;;
            5) option_5;;
            6) break;;
        esac
    ;;
esac
