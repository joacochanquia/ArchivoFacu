from fpdf import FPDF
import textwrap

# Custom PDF class with flashcard-style formatting
class FlashcardPDF(FPDF):
    def header(self):
        self.set_font("Helvetica", "B", 16)
        self.set_text_color(30, 30, 30)
        self.cell(0, 10, self.title, ln=True, align="C")
        self.ln(5)

    def add_flashcard(self, question, answer):
        self.set_fill_color(245, 245, 245)
        self.set_text_color(0)
        self.set_font("Helvetica", "B", 12)
        self.multi_cell(0, 10, f"??? {question}", fill=True)
        self.set_font("Helvetica", "", 12)
        self.multi_cell(0, 8, answer)
        self.ln(4)

# Sections with flashcards
sections = {
    "FUNDAMENTOS Y DEFINICIONES": [
        ("¿Qué es un sistema paralelo?", "Es un sistema donde múltiples tareas se ejecutan simultáneamente en distintos procesadores, cooperando para resolver un problema más rápido que en forma secuencial."),
        ("¿Qué es una arquitectura manycore?", "Es una arquitectura con decenas, cientos o miles de núcleos simples, como las GPU. Está diseñada para maximizar el paralelismo de datos."),
        ("Diferencias: multiprocesador, multicore, manycore y clúster", "- Multiprocesador: varias CPUs físicas con memoria compartida.\n- Multicore: varios núcleos en un solo chip.\n- Manycore: muchos núcleos simples y homogéneos (ej: GPU, Xeon Phi).\n- Clúster: varias máquinas conectadas por red, con memoria distribuida."),
        ("¿Qué es el modelo SPMD? ¿Y SIMD?", "- SPMD (Single Program Multiple Data): cada hilo ejecuta el mismo programa, pero sobre distintos datos y a ritmos independientes.\n- SIMD (Single Instruction Multiple Data): todos los hilos ejecutan simultáneamente la misma instrucción sobre diferentes datos.")
    ],
    "MÉTRICAS Y RENDIMIENTO": [
        ("¿Cómo se calcula el speedup?", "S = Ts / Tp - Relación entre tiempo secuencial y paralelo."),
        ("¿Qué es el speedup ideal?", "S = P - Si se aprovechan perfectamente los P procesadores."),
        ("¿Qué es el speedup superlineal?", "Cuando S > P, por efectos como mejor uso de caché o menor trabajo en paralelo."),
        ("¿Qué mide la eficiencia?", "E = S / P - Mide qué tan bien se utilizan los procesadores."),
        ("¿Qué es el overhead?", "Trabajo adicional introducido por la paralelización: To = P * Tp - Ts."),
        ("¿Qué es el balance de carga?", "Mide si los hilos trabajan parejo: B = Prom(T) / Max(T)"),
        ("¿Cuándo usar la ley de Amdahl?", "En escalabilidad fuerte (problema de tamaño fijo)."),
        ("¿Cuándo usar la ley de Gustafson?", "En escalabilidad débil (problema que crece con P).")
    ]
}

# Generate PDF
pdf = FlashcardPDF()
pdf.set_auto_page_break(auto=True, margin=15)
pdf.title = "Flashcards - Paralelismo y Diseño de Algoritmos"
pdf.add_page()

# Add flashcards
for section, cards in sections.items():
    pdf.set_font("Helvetica", "B", 14)
    pdf.set_text_color(0, 51, 102)
    pdf.cell(0, 10, section, ln=True)
    pdf.ln(2)
    for question, answer in cards:
        pdf.add_flashcard(question, answer)

# Save PDF
output_path = "./Flashcards_Paralelismo_Parte1.pdf"
pdf.output(output_path)

output_path
