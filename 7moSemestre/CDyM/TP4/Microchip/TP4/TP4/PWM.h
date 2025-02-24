#ifndef PWM_H
#define PWM_H

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>

typedef struct {
	uint8_t R;
	uint8_t G;
	uint8_t B;
} RGB;

ISR(IRQ_request);

// Inicializacion del PWM por software
void PWM_Init();

// Configuracion del ciclo de trabajo
void SetCT_Red(uint8_t comp);
void SetCT_Green(uint8_t comp);
void SetCT_Blue(uint8_t comp);

#endif