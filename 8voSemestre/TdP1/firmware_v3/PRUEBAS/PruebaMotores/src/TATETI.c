#include <stdio.h>
#include "TATETI.h"

#define SIZE 3

char board [SIZE][SIZE] = {{'E', 'E', 'E'}, {'E', 'E', 'E'}, {'E', 'E', 'E'}};
int turn;
char moves[10] = {'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E', 'E'};

void cleanBoard() {
    int i, j;
    for (i = 0; i < 3; i++) {
       for (j = 0; j < 3; j++) {
          board[i][j] = 'E';
       }
    }
    for (i = 0; i < 10; i++) {
       moves[i] = 'E';
    }
    turn = 0;
 }

void printBoard(char board[SIZE][SIZE]) {
    for (int i = 0; i < SIZE; i++) {
        for (int j = 0; j < SIZE; j++) {
            if (board[i][j] == '\0') {
                printf(" . ");
            } else {
                printf(" %c ", board[i][j]);
            }
            if (j < SIZE - 1) printf("|");
        }
        printf("\n");
        if (i < SIZE - 1) printf("---+---+---\n");
    }
}

char checkWin() {
    for (int i = 0; i < SIZE; i++) {
        if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != 'E') return board[i][0];
        if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != 'E') return board[0][i];
    }
    if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != 'E') return board[0][0];
    if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != 'E') return board[0][2];
    if (turn >= 8) return 'T';
    return 0;
}

void setMove(char move, char player) {
    if (move >= '0' && move <= '8') {
        int posX = (move - '0') % 3;
        int posY = (move - '0') / 3;
        board[posX][posY] = player;
        moves[turn] = move;
        turn++;
    }
}

char startGame() {
    cleanBoard(board); // Limpiamos el tablero
    setMove('4', 'X'); // Movida 0 -> X
    return '4';
}

char jugarTATETIrandom(char played) {
    char nextMove = 'F'; // Inicializamos la variable nextMove en 'F'
    board[(played-'0') % 3][(played-'0') / 3] = 'O';
    for (int i = 0; i < 9; i++) {
        int posX = i % 3;
        int posY = i / 3;
        if (board[posX][posY] != 'O' && board[posX][posY] != 'X') {
            board[posX][posY] = 'X';
            turn++;
            nextMove = i + '0';
            break;
        }
    }
    return nextMove;
}

char jugarTATETI(char played) {
    if (turn == 0) {
        return startGame();
    }
    char nextMove = 'F'; // Inicializamos la variable nextMove en 'F'
    setMove(played, 'O');
    if (moves[0] == '4') {
        switch (turn)
        {
        case 2:
            switch (moves[1])
            {
            case '0':
                nextMove = '6';
                break;
            case '1':
                nextMove = '6';
                break;
            case '2':
                nextMove = '0';
                break;
            case '5':
                nextMove = '0';
                break;
            case '7':
                nextMove = '2';
                break;
            case '8':
                nextMove = '2';
                break;
            case '6':
                nextMove = '8';
                break;
            case '3':
                nextMove = '8';
                break;
            default:
                break;
            }    
            setMove(nextMove, 'X'); // Movida 2 -> X
            break;
        case 4:
            switch (moves[2])
            {
            case '6':
                if (moves[3] != '2'){
                    nextMove = '2';
                }else{
                    if (moves[1] == '0'){
                        nextMove = '1';
                    }else if (moves[1] == '1'){
                        nextMove = '0';
                    }
                }
                break;
            case '0':
                if (moves[3] != '8'){
                    nextMove = '8';
                }else{
                    if (moves[1] == '2'){
                        nextMove = '5';
                    }else if (moves[1] == '5'){
                        nextMove = '2';
                    }
                }
                break;
            case '2':
                if (moves[3] != '6'){
                    nextMove = '6';
                }else{
                    if (moves[1] == '7'){
                        nextMove = '8';
                    }else if (moves[1] == '8'){
                        nextMove = '7';
                    }
                }
                break;
            case '8':
                if (moves[3] != '0'){
                    nextMove = '0';
                }else{
                    if (moves[1] == '6'){
                        nextMove = '3';
                    }else if (moves[1] == '3'){
                        nextMove = '6';
                    }
                }
                break;
            default:
                break;
            }
            setMove(nextMove, 'X'); // Movida 4 -> X
            break;
        case 6:
            switch (moves[1])
            {
            case '0':
                if (moves[5] != '7'){
                    nextMove = '7';
                }else{
                    nextMove = '5';
                }
            break;
            case '2':
                if (moves[5] != '3'){
                    nextMove = '3';
                }else{
                    nextMove = '7';
                }
            break;
            case '8':
                if (moves[5] != '1'){
                    nextMove = '1';
                }else{
                    nextMove = '3';
                }
            break;
            case '6':
                if (moves[5] != '5'){
                    nextMove = '5';
                }else{
                    nextMove = '1';
                }
            break;
            case '1':
                if (moves[5] != '3'){
                    nextMove = '3';
                }else{
                    nextMove = '8';
                }
            break;
            case '5':
                if (moves[5] != '1'){
                    nextMove = '1';
                }else{
                    nextMove = '6';
                }
            break;
            case '7':
                if (moves[5] != '5'){
                    nextMove = '5';
                }else{
                    nextMove = '0';
                }
            break;
            case '3':
                if (moves[5] != '7'){
                    nextMove = '7';
                }else{
                    nextMove = '2';
                }
            break;
            default:
                break;
            }
            setMove(nextMove, 'X'); // Movida 6 -> X
            break;
        case 8:
            switch (moves[1])
            {
            case '0':
                if (moves[7] != '3'){
                    nextMove = '3';
                }else{
                    nextMove = '8';
                }
            break;
            case '2':
                if (moves[7] != '1'){
                    nextMove = '1';
                }else{
                    nextMove = '6';
                }
            break;
            case '8':
                if (moves[7] != '5'){
                    nextMove = '5';
                }else{
                    nextMove = '0';
                }
            break;
            case '6':
                if (moves[7] != '7'){
                    nextMove = '7';
                }else{
                    nextMove = '2';
                }
            break;
            default:
                break;
            }
            setMove(nextMove, 'X'); // Movida 8 -> X
            break;
        default:
            break;
        }
    } else {
        nextMove = startGame();
    }
    return nextMove;
}

/*
int main() {
    char board[SIZE][SIZE] = {{'\0', '\0', '\0'}, {'\0', '\0', '\0'}, {'\0', '\0', '\0'}};
    jugarTATETI(board);
    return 0;
}
*/