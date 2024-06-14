#ifndef DICCIONARIO_H_INCLUDED
#define DICCIONARIO_H_INCLUDED

typedef listaS diccionario;

diccionario newDicc();
int estaDicc(diccionario d,const char * p);
int agregarDicc(diccionario * ptrD,const char * p);
int eliminarDicc(diccionario * ptrD, const char * p);
diccionario cargarDicc(FILE * f);
void guardarDicc(diccionario d, FILE * f);
void freeDicc(diccionario * d);

#endif // DICCIONARIO_H_INCLUDED
