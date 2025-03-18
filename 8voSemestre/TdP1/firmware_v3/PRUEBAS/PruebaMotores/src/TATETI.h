#ifndef TATETI_H
#define TATETI_H

#define SIZE 3

extern char board[SIZE][SIZE];
extern int turn;
extern char moves[10];

void cleanBoard();
void printBoard(char board[SIZE][SIZE]);
char checkWin();
void setMove(char move, char player);
char startGame();
char jugarTATETIrandom(char played);
char jugarTATETI(char played);

#endif // TATETI_H