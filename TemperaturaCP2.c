#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <locale.h>

#define TEMP_LIMITE_RAPIDA  50.0f
#define BAR_WIDTH           30

typedef enum {
    CLIMA_FRIO,
    CLIMA_QUENTE
} Clima;

typedef enum {
    MODO_NORMAL,
    MODO_RAPIDA
} ModoCarga;

typedef struct {
    int   id;
    char  nome[40];
    int   capacidade_kwh;
    int   suporta_carga_rapida;
    int   tempo_carga_normal_min;
} Bateria;

static const Bateria catalogo[3] = {
    { 1, "Compacta  – LFP  40 kWh", 40, 0, 80 },
    { 2, "Média     – NMC  60 kWh", 60, 1, 90 },
    { 3, "Grande    – NMC 100 kWh", 100, 1, 130 }
};

static float ler_temperatura(ModoCarga modo, Clima clima)
{
    float base = (modo == MODO_RAPIDA) ? 47.0f : 35.0f;

    if (clima == CLIMA_QUENTE) {
        base += 5.0f;
    } else {
        base -= 5.0f;
    }

    float ruido = ((float)(rand() % 51) - 25.0f) / 10.0f;

    float temp  = base + ruido;
    if (temp < 10.0f)  temp = 10.0f;
    if (temp > 75.0f)  temp = 75.0f;
    return temp;
}

static void imprimir_barra(float pct)
{
    int preenchido = (int)(pct / 100.0f * BAR_WIDTH);
    printf("[");
    for (int i = 0; i < BAR_WIDTH; i++)
        printf(i < preenchido ? "#" : "-");
    printf("]");
}

static void linha(void)
{
    printf("------------------------------------------------------------\n");
}

int main(void)
{
    SetConsoleOutputCP(65001);
    srand((unsigned int)time(NULL));

    char resposta[8];
    int  escolha;

    Clima clima_do_dia = (rand() % 2 == 0) ? CLIMA_FRIO : CLIMA_QUENTE;

    printf("\n============================================================\n");
    printf("        SIMULADOR DE CARGA — VEÍCULO ELÉTRICO               \n");
    printf("============================================================\n\n");

    printf("  CONDIÇÃO CLIMÁTICA DO DIA: %s\n",
           clima_do_dia == CLIMA_QUENTE ? "🔥 DIA QUENTE" : "❄️ DIA FRIO");
    printf("============================================================\n\n");

    printf("Deseja iniciar o processo de carga? (s/n): ");
    scanf("%7s", resposta);

    if (resposta[0] != 's' && resposta[0] != 'S') {
        printf("\nCarga cancelada pelo operador. Sistema encerrado.\n\n");
        return 0;
    }

    printf("\n");
    linha();
    printf("  BATERIAS DISPONÍVEIS\n");
    linha();
    printf("  %-3s %-26s %-8s %-12s %-15s\n", "ID", "Modelo", "kWh", "Carga Rápida", "Tempo Normal");
    linha();
    for (int i = 0; i < 3; i++) {
        const Bateria *b = &catalogo[i];
        printf("  [%d] %-26s %-8d %-12s %d min\n",
               b->id, b->nome, b->capacidade_kwh,
               b->suporta_carga_rapida ? "SIM" : "NÃO", b->tempo_carga_normal_min);
    }
    linha();
    printf("Escolha a bateria (1-3): ");
    if (scanf("%d", &escolha) != 1 || escolha < 1 || escolha > 3) {
        printf("Opção inválida. Encerrando.\n");
        return 1;
    }

    const Bateria *bat = &catalogo[escolha - 1];
    ModoCarga modo     = bat->suporta_carga_rapida ? MODO_RAPIDA : MODO_NORMAL;
    int   tempo_normal = bat->tempo_carga_normal_min;

    float inc_normal = 100.0f / (float)tempo_normal;
    float inc_rapida = 100.0f / (float)(tempo_normal / 2);

    printf("\n");
    linha();
    printf("  INICIANDO CARGA\n");
    linha();
    printf("  Bateria   : %s\n",  bat->nome);
    printf("  Capacidade: %d kWh\n", bat->capacidade_kwh);
    printf("  Clima     : %s\n", clima_do_dia == CLIMA_QUENTE ? "QUENTE" : "FRIO");
    printf("  Modo ini. : %s\n", modo == MODO_RAPIDA ? "RÁPIDA (2× mais rápida)" : "NORMAL");
    printf("  Tempo est.: ~%d min\n", modo == MODO_RAPIDA ? tempo_normal / 2 : tempo_normal);
    linha();
    printf("  Min  | Temperatura | Modo   | Progresso                          | %%\n");
    linha();

    float pct          = 0.0f;
    int   minuto       = 0;
    int   ja_avisou    = 0;

    while (pct < 100.0f) {

        Sleep(500);

        float temp = ler_temperatura(modo, clima_do_dia);

        if (modo == MODO_RAPIDA && temp > TEMP_LIMITE_RAPIDA) {
            if (!ja_avisou) {
                printf("\n");
                printf("  *** ALERTA DE TEMPERATURA ***\n");
                printf("  Sensor: %.1f °C > %.0f °C limite\n", temp, TEMP_LIMITE_RAPIDA);
                printf("  Modo de carga alterado: RÁPIDA → NORMAL\n");
                printf("\n");
                ja_avisou = 1;
            }
            modo = MODO_NORMAL;
        }

        float incremento = (modo == MODO_RAPIDA) ? inc_rapida : inc_normal;
        pct += incremento;
        if (pct > 100.0f) pct = 100.0f;
        minuto++;

        printf("  %3d  | %7.1f °C   | %-6s | ", minuto, temp, modo == MODO_RAPIDA ? "RÁPIDA" : "NORMAL");
        imprimir_barra(pct);
        printf(" | %5.1f%%\n", pct);
    }

    printf("\n");
    linha();
    printf("  CARGA CONCLUÍDA\n");
    linha();
    printf("  Bateria   : %s\n", bat->nome);
    printf("  Clima Geral: %s\n", clima_do_dia == CLIMA_QUENTE ? "QUENTE" : "FRIO");
    printf("  Tempo tot.: %d minutos\n", minuto);
    printf("  Modo final: %s\n", modo == MODO_RAPIDA ? "RÁPIDA" : ja_avisou ? "NORMAL (trocou por temp.)" : "NORMAL");
    linha();
    printf("  Bateria 100%% carregada. Pronto para uso!\n");
    linha();
    printf("\n");

    return 0;
}
