# Sprint1_Grilo

Challenge Sprint 1 Professor Marcus Grilo

O custo oculto da mobilidade elétrica

Integrantes

Turma: CCPZ

Josué Franco Braga RM569174
Andrei Henrique Santos RM569440
Heitor Maxímus Mucha RM571407
Enrico Marinho de Aquino RM569338
Fernando Lobato Rodrigues RM569377
Manoel da Silva Ferreira RM572045

Problema
Sistemas de eletropostos atuais frequentemente utilizam hardwares genéricos rodando softwares de alto nível. Isso gera um excesso de processamentos invisíveis (overhead) para executar tarefas simples, como monitorar sensores e liberar carga, resultando em desperdício contínuo de energia elétrica pelas próprias estações.

Justificativa
A sustentabilidade na mobilidade elétrica não deve se limitar à origem da energia, mas também à eficiência da infraestrutura. Em uma rede com milhares de eletropostos operando 24 horas por dia, o consumo da CPU de cada máquina representa um gasto invisível considerável. Otimizar o processamento em nível de software é uma etapa essencial para maximizar o saldo ecológico do sistema.

Proposta de Solução
Implementar um módulo de controle de baixo nível (Assembly) para gerenciar as operações críticas do eletroposto (como o loop de monitoramento do sensor de temperatura e a alternância do modo de carga). Ao remover as abstrações da linguagem C, reduzimos drasticamente o número de instruções executadas, processando a lógica de segurança com o mínimo absoluto de ciclos de CPU.

Arquitetura Utilizada
O módulo é focado em arquiteturas RISC (como RISC-V ou MIPS), ideais para sistemas embarcados e IoT. Diferente da arquitetura CISC tradicional de desktops, o modelo RISC utiliza um conjunto reduzido de instruções simples que são executadas em um único ciclo de clock. Isso permite explorar ao máximo o uso do Pipeline, entregando processamento rápido e eficiente sem a necessidade de aumentar a frequência ou a voltagem do microcontrolador.

Impactos Esperados
Eficiência Computacional: Execução da mesma tarefa utilizando uma fração dos recursos lógicos.

Redução de E-Waste: A otimização permite o uso de microcontroladores mais simples, baratos e com menor pegada de carbono em sua fabricação.

Segurança Aprimorada: O acesso direto ao hardware via Assembly garante tempos de resposta imediatos em casos de superaquecimento da bateria.

Relação com Sustentabilidade e Energias Renováveis
O conceito central é o "Código Verde". Ao minimizar a energia consumida pela inteligência artificial e pelos processadores lógicos do eletroposto, garantimos que a maior parte da energia gerada preferencialmente por fontes renováveis locais, como painéis solares seja efetivamente injetada na bateria do veículo elétrico, em vez de ser dissipada na forma de calor pelo hardware da estação.
