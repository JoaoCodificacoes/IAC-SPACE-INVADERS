

;                                                         ********************************************
;                                                         *               GRUPO 31                   *
;                                                         * João David Natário Ferreira - ist1103680 *
;                                                         * Pedro Miguel Fidalgo Castelo - ist196304 *
;                                                         ********************************************



; *********************************************************************************
; * Constantes
; *********************************************************************************

;* Constantes de enderecos
MUDA_PIXEL_SCREEN        EQU 6004H      ; endereco do comando para definir pixel screen
DEFINE_LINHA             EQU 600AH      ; endereço do comando para definir a linha
DEFINE_COLUNA            EQU 600CH      ; endereço do comando para definir a coluna
DEFINE_PIXEL             EQU 6012H      ; endereço do comando para escrever um pixel
APAGA_AVISO              EQU 6040H      ; endereço do comando para apagar o aviso de nenhum cenário selecionado
APAGA_ECRÃ               EQU 6002H      ; endereço do comando para apagar todos os pixels já desenhados
SELECIONA_CENARIO_FUNDO  EQU 6042H      ; endereço do comando para selecionar uma imagem de fundo
TEC_LIN                  EQU 0C000H     ; endereço das linhas do teclado (periférico POUT-2)
TEC_COL                  EQU 0E000H     ; endereço das colunas do teclado (periférico PIN)
DISPLAYS                 EQU 0A000H     ; endereço do porto dos displays hexadecimais
TIRA_TODOS_SONS          EQU 6068H      ; endereço do comando tira todos os sons
PAUSA_TODOS_SONS         EQU 6062H      ; endereço do comando pausa todos os sons
DESPAUSA_TODOS_SONS      EQU 6064H      ; endereço do comando toca som em ciclo
CICLO_SOM                EQU 605CH      ; endereço do comando toca ate ser parado
TOCA_SOM                 EQU 605AH      ; endereço do comando para tocar um som
TIRA_SOM_ESPECIFICO      EQU 6066H      ; endereço do comando para tirar som especifico
MAX_LIN_TECLADO EQU 8                   ; linha 4 do teclado ultima linha 
CASO_100                 EQU 0A0H
;* Constantes de teclas
TECLA_MOVE_ESQUERDA     EQU 0
TECLA_MOVE_DIREITA      EQU 2
TECLA_START             EQU 0DH
TECLA_PAUSA             EQU 0CH
TECLA_DESISTIR          EQU 0EH
TECLA_DISPARA_MISSIL    EQU 1
NENHUMA_TECLA_PREMIDA   EQU -1

;* Constantes do estado de jogo
EM_JOGO             EQU 0
POR_COMECAR         EQU 1
PAUSADO             EQU 2
PERDIDO_ENERGIA     EQU 3
PERDIDO_COLISAO     EQU 4
PERDIDO_DESISTIU    EQU 5
PAUSA               EQU 0
RESTART             EQU -1
;* Constantes ecra
MIN_COLUNA      EQU  0         ; numero da coluna mais a esquerda que o objeto pode ocupar
MAX_COLUNA      EQU  63        ; numero da coluna mais a direita que o objeto pode ocupar

;* Constantes da Nave
LINHA_INICIAL_NAVE    EQU 31   ; linha da nave (inicio do ecra)
COLUNA_INICIAL_NAVE   EQU 30   ; coluna da nave (a meio do ecra)
LARGURA_NAVE          EQU 5    ; largura do nave
ALTURA_NAVE           EQU 4    ; altura do nave
NAVE                  EQU 4

;* Outras constantes
MASCARA_0_3           EQU 0FH  ; para isolar os 4 bits de menor peso, ao ler as colunas do teclado
MASCARA_4_7           EQU 0F0H ; para isolar os segundos 4 bits de menor peso
APAGA                 EQU 0    ; para passar informacao de apagar estrutura
DESENHA               EQU 1    ; para passar informacao de desenhar estrutura
MAX_ATRASO            EQU 900  ; atraso para movimentar a nave
MAX_ENERGIA           EQU 100H ; numero maximo de energia
PROXIMO               EQU 2    ; proximo espaco na memoria
ANTERIOR              EQU -2   ; espaco anterior na memoria
DOUBLE_ANTERIOR       EQU -4   ; 2x ANTERIOR
DOUBLE_PROXIMO        EQU 4    ; 2x PROXIMO
TRIPLE_PROXIMO        EQU 6    ; 3X PROXIMO

;* Constantes de sons
SOM_DISPARO EQU 1
SOM_START_MENU EQU 2
SOM_BACKGROUND EQU 3
SOM_PAUSADO EQU 4
SOM_MORTE_MENU EQU 5
SOM_EXPLOSAO EQU 6
SOM_METEORO_BOM EQU 7

;* Constantes do meteoro

LINHA_INICIAL_METEORO   EQU 1  ; numero da linha inicial do meteoro  
LARGURA_METEORO         EQU 1  ; numero da largura do meteoro
ALTURA_METEORO          EQU 1  ; numero da altura do meteoro
COLUNA_METEORO          EQU 0  ; numero da coluna do meteoro
ENDERECO_DESIGN_METEORO EQU 0  ; endereco onde estara o aspeto visual do meteoro
ALCANCE_METEORO         EQU 30 ; alcance para que o meteoro chegue ao fim do ecra
MUDANCA_PARA_2X2        EQU 26 ; estado do alcance no qual o meteoro precisa de ficar 2x2
MUDANCA_PARA_3X3        EQU 23 ; estado do alcance no qual o meteoro precisa de ficar 3x3
MUDANCA_PARA_4X4        EQU 20 ; estado do alcance no qual o meteoro precisa de ficar 4x4
MUDANCA_PARA_5X5        EQU 17 ; estado do alcance no qual o meteoro precisa de ficar 5x5
BOM                     EQU 1  ; tipo do meteoro bom
MAU                     EQU 0  ; tipo do meteoro mau 
NUMERO_METEOROS         EQU 4  ; numero de instancias de meteoros total
BOM_MAU                 EQU -1 ; constante inicial da variavel que guarda o tipo de meteoro

;* Constantes do missil
LARGURA_MISSIL          EQU 1  ; largura do missil
LINHA_INICIAL_MISSIL    EQU 27 ; linha inicial do missil (linha nave - altura nave)
COLUNA_MISSIL           EQU 0  ; constante inicial da variavel que guarda a coluna do missil
ALCANCE_MISSIL          EQU 12 ; alcance do missil 
PIXEL_SCREEN_MISSIL     EQU 5  ; pixel screen onde desenham os misseis

;* Constantes da explosao
EXPLOSAO EQU -5 ; constante que informa a funcao de desenhar que se quer desenhar ou apagar a explosao especifica
NAO_EXPLOSAO EQU 1
;* Constantes da energia
DECREMENTO_ENERGIA  EQU -5 ; constante que representa o valor retirado a energia por cada evento de energia

;* Constantes de colisoes
OCORREU_COLISAO EQU -1 ; constante que informa que ocorreu uma colisao
ESTADO_INTACTO EQU -1  ; constante que representa o estado intacto de uma estrutura

;* Constantes de cores
COR_AMARELO EQU 0FFF0H
COR_PRETO EQU  0F000H
COR_BRANCO EQU 0FFFFH
COR_CINZENTO_TRANSPARENTE EQU 8888H
COR_CINZENTO_OPACO EQU 0F888H
COR_VERDE EQU 0F0F0H
COR_VERMELHO EQU 0FF00H
COR_ROSA EQU 0FF7CH
COR_ROXO EQU 0FC3EH
COR_ROSA_EXPLOSAO EQU 0FF6FH
COR_AZUL_CLARO EQU 0F0FFH

; #######################################################################
; * ZONA DE DADOS 
; #######################################################################
PLACE       1000H  

pilha:
; Reserva do espaço para as pilhas dos processos
    STACK 100H          ; espaço reservado para a pilha do processo "programa principal"
SP_princ:      ; este é o endereço com que o SP deste processo deve ser inicializado
                            
    STACK 100H          ; espaço reservado para a pilha do processo "teclado"
SP_teclado:         ; este é o endereço com que o SP deste processo deve ser inicializado
                            
    STACK 100H          ; espaço reservado para a pilha do processo "nave"
SP_nave:          ; este é o endereço com que o SP deste processo deve ser inicializado

    STACK 100H          ; espaço reservado para a pilha do processo "missil"
SP_missil:          ; este é o endereço com que o SP deste processo deve ser inicializado

    STACK 100H          ; espaço reservado para a pilha do processo "energia"
SP_energia:          ; este é o endereço com que o SP deste processo deve ser inicializado

; SP inicial de cada processo "meteoro"
    STACK 100H          ; espaço reservado para a pilha do processo "meteoro", instância 0
SP_inicial_meteoro_0:        ; este é o endereço com que o SP deste processo deve ser inicializado

    STACK 100H          ; espaço reservado para a pilha do processo "meteoro", instância 1
SP_inicial_meteoro_1:        ; este é o endereço com que o SP deste processo deve ser inicializado
                            
    STACK 100H          ; espaço reservado para a pilha do processo "meteoro", instância 2
SP_inicial_meteoro_2:        ; este é o endereço com que o SP deste processo deve ser inicializado
                            
    STACK 100H          ; espaço reservado para a pilha do processo "meteoro", instância 3
SP_inicial_meteoro_3:        ; este é o endereço com que o SP deste processo deve ser inicializado

    STACK 100H          ; espaço reservado para a pilha do processo "colisoes"
SP_colisoes:          ; este é o endereço com que o SP deste processo deve ser inicializado

    STACK 100H          ; espaço reservado para a pilha do processo "modo_jogo"
SP_modo_jogo:          ; este é o endereço com que o SP deste processo deve ser inicializado

; tabela com os SP iniciais de cada processo "meteoro"
TAB_METEORO_SP:
    WORD   SP_inicial_meteoro_0
    WORD   SP_inicial_meteoro_1
    WORD   SP_inicial_meteoro_2
    WORD   SP_inicial_meteoro_3

; tabela com as definicoes de cada meteoro
TAB_METEORO_DEF:
    WORD   DEF_METEORO_0
    WORD   DEF_METEORO_1
    WORD   DEF_METEORO_2
    WORD   DEF_METEORO_3

; tabela com os estados atuais de cada meteoro
TAB_METEORO_ESTADOS:
    WORD   ESTADO_INTACTO
    WORD   ESTADO_INTACTO   
    WORD   ESTADO_INTACTO
    WORD   ESTADO_INTACTO

; informa o missil se ocorreu uma colisao
COLISAO_MISSIL:
    WORD 0
; guarda a quantidade atual de energia
ENERGIA:
    WORD 0
; guarda o estado de jogo atual
ESTADO_JOGO:
    WORD 0
; guarda o numero do atraso para atrasar o movimento da nave
ATRASO_NUM:
    WORD 0

tecla_carregada:
    LOCK 0              ; LOCK para o teclado comunicar aos restantes processos que tecla detetou,
                        ; uma vez por cada tecla carregada
                            
tecla_continua:
    LOCK 0              ; LOCK para o teclado comunicar aos restantes processos que tecla detetou,
                        ; enquanto a tecla estiver carregada

evento_missil:          ; LOCK para a interrupcao comunicar aos restantes processos que o missil precisa mover
    LOCK 0

evento_meteoro:         ; LOCK para a interrupcao comunicar aos restantes processos que o meteoro precisa mover
    LOCK 0

evento_energia:         ; LOCK para a interrupcao comunicar aos restantes processos que a energia precisa diminuir
    LOCK 0

evento_colisao:         ; LOCK para os processos comunicarem ao processo das colisoes que ha uma possivel colisao
    LOCK 0

evento_jogar:           ; LOCK para  comunicar aos restantes processos que ha ordem para o jogo iniciar/retomar/reiniciar
    LOCK 0

evento_perder_jogo:     ; LOCK para  comunicar ao processo dos modos de jogo que ha ordem para perder o jogo
    LOCK 0


;* Design visual para cada tipo de meteoro, para a nave , e para cada explosao
METEORO_INICIAL:
    WORD COR_CINZENTO_TRANSPARENTE

METEORO_INICIAL_2X2:
    WORD COR_CINZENTO_OPACO,COR_CINZENTO_OPACO
    WORD COR_CINZENTO_OPACO,COR_CINZENTO_OPACO

METEORO_MAU_3X3:
    WORD COR_VERMELHO,COR_AMARELO,COR_VERMELHO
    WORD COR_PRETO,COR_VERMELHO,COR_PRETO
    WORD COR_VERMELHO,0,COR_VERMELHO
    
METEORO_MAU_4X4:
    WORD COR_VERMELHO,0,0,COR_VERMELHO
    WORD COR_VERMELHO,COR_AMARELO,COR_AMARELO,COR_VERMELHO
    WORD COR_PRETO,COR_VERMELHO,COR_VERMELHO,COR_PRETO
    WORD COR_PRETO,0,0,COR_PRETO

METEORO_MAU_5X5:
    WORD COR_VERMELHO,0,0,0,COR_VERMELHO
    WORD COR_VERMELHO,COR_VERMELHO,COR_AMARELO,COR_VERMELHO,COR_VERMELHO
    WORD 0,COR_PRETO,COR_VERMELHO,COR_PRETO,0
    WORD 0,COR_VERMELHO,0,COR_VERMELHO,0
    WORD COR_VERMELHO,0,0,0,COR_VERMELHO

METEORO_BOM_3X3:
    WORD 0,COR_PRETO,0
    WORD COR_PRETO,COR_VERDE,COR_PRETO
    WORD 0,COR_PRETO,0

METEORO_BOM_4X4:
    WORD COR_PRETO,COR_PRETO,COR_PRETO,COR_PRETO
    WORD COR_PRETO,COR_VERDE,COR_VERDE,COR_PRETO
    WORD COR_PRETO,COR_PRETO,COR_PRETO,COR_PRETO
    WORD 0,COR_PRETO,COR_PRETO,0

METEORO_BOM_5X5:
    WORD COR_PRETO,COR_PRETO,COR_PRETO,COR_PRETO,COR_PRETO
    WORD COR_PRETO,COR_VERDE,COR_VERDE,COR_VERDE,COR_PRETO
    WORD COR_PRETO,COR_VERDE,COR_VERDE,COR_VERDE,COR_PRETO
    WORD COR_PRETO,COR_PRETO,COR_PRETO,COR_PRETO,COR_PRETO
    WORD 0,COR_PRETO,COR_PRETO,COR_PRETO,0


EXPLOSAO_DESIGN_0:
    WORD 0,COR_ROSA_EXPLOSAO,0,COR_ROSA_EXPLOSAO,0
    WORD COR_ROSA_EXPLOSAO,0,COR_ROSA_EXPLOSAO,0,COR_ROSA_EXPLOSAO
    WORD 0,COR_ROSA_EXPLOSAO,0,COR_ROSA_EXPLOSAO,0
    WORD COR_ROSA_EXPLOSAO,0,COR_ROSA_EXPLOSAO,0,COR_ROSA_EXPLOSAO
    WORD 0,COR_ROSA_EXPLOSAO,0,COR_ROSA_EXPLOSAO,0
EXPLOSAO_DESIGN_1:
    WORD 0,COR_AMARELO,0,COR_AMARELO,0
    WORD COR_AMARELO,0,COR_AMARELO,0,COR_AMARELO
    WORD 0,COR_AMARELO,0,COR_AMARELO,0
    WORD COR_AMARELO,0,COR_AMARELO,0,COR_AMARELO
    WORD 0,COR_AMARELO,0,COR_AMARELO,0
EXPLOSAO_DESIGN_2:
    WORD 0,COR_BRANCO,0,COR_BRANCO,0
    WORD COR_BRANCO,0,COR_BRANCO,0,COR_BRANCO
    WORD 0,COR_BRANCO,0,COR_BRANCO,0
    WORD COR_BRANCO,0,COR_BRANCO,0,COR_BRANCO
    WORD 0,COR_BRANCO,0,COR_BRANCO,0
EXPLOSAO_DESIGN_3:
    WORD 0,COR_AZUL_CLARO,0,COR_AZUL_CLARO,0
    WORD COR_AZUL_CLARO,0,COR_AZUL_CLARO,0,COR_AZUL_CLARO
    WORD 0,COR_AZUL_CLARO,0,COR_AZUL_CLARO,0
    WORD COR_AZUL_CLARO,0,COR_AZUL_CLARO,0,COR_AZUL_CLARO
    WORD 0,COR_AZUL_CLARO,0,COR_AZUL_CLARO,0
EXPLOSAO_DESIGN_NAVE:
    WORD 0,COR_AZUL_CLARO,0,COR_AZUL_CLARO,0
    WORD COR_AZUL_CLARO,0,COR_AZUL_CLARO,0,COR_AZUL_CLARO
    WORD 0,COR_AZUL_CLARO,0,COR_AZUL_CLARO,0
    WORD COR_AZUL_CLARO,0,COR_AZUL_CLARO,0,COR_AZUL_CLARO
    WORD 0,COR_AZUL_CLARO,0,COR_AZUL_CLARO,0

NAVE_DESIGN:
    WORD        COR_BRANCO, 0, 0, 0, COR_BRANCO    
    WORD        COR_ROSA,COR_BRANCO,COR_VERMELHO,COR_BRANCO,COR_ROSA
    WORD        0, COR_BRANCO, COR_BRANCO, COR_BRANCO,0;
    WORD        0,0,COR_PRETO,0,0


;* Definicoes para cada estrutura visual
DEF_NAVE:       ;tabela que define a nave com largura,altura,cores
    WORD    LINHA_INICIAL_NAVE
    WORD    COLUNA_INICIAL_NAVE
    WORD    LARGURA_NAVE
    WORD    ALTURA_NAVE
    WORD    NAVE_DESIGN    
        
DEF_MISSIL:     ; tabela que define o missil com linha,coluna,cor
    WORD    LINHA_INICIAL_MISSIL
    WORD    COLUNA_MISSIL
    WORD    COR_ROXO


DEF_METEORO_0:    ; tabela que define o meteoro com largura,altura,cores
    WORD    LINHA_INICIAL_METEORO
    WORD    COLUNA_METEORO
    WORD    LARGURA_METEORO
    WORD    ALTURA_METEORO 
    WORD    ENDERECO_DESIGN_METEORO
    WORD    EXPLOSAO_DESIGN_0
    WORD    BOM_MAU


DEF_METEORO_1:    ; tabela que define o meteoro com largura,altura,cores
    WORD    LINHA_INICIAL_METEORO
    WORD    COLUNA_METEORO
    WORD    LARGURA_METEORO
    WORD    ALTURA_METEORO 
    WORD    ENDERECO_DESIGN_METEORO
    WORD    EXPLOSAO_DESIGN_1
    WORD    BOM_MAU

DEF_METEORO_2:    ; tabela que define o meteoro com largura,altura,cores
    WORD    LINHA_INICIAL_METEORO
    WORD    COLUNA_METEORO
    WORD    LARGURA_METEORO
    WORD    ALTURA_METEORO 
    WORD    ENDERECO_DESIGN_METEORO
    WORD    EXPLOSAO_DESIGN_2
    WORD    BOM_MAU


DEF_METEORO_3:    ; tabela que define o meteoro com largura,altura,cores
    WORD    LINHA_INICIAL_METEORO
    WORD    COLUNA_METEORO
    WORD    LARGURA_METEORO
    WORD    ALTURA_METEORO 
    WORD    ENDERECO_DESIGN_METEORO
    WORD    EXPLOSAO_DESIGN_3
    WORD    BOM_MAU


TAB_MET_MAU:     ; tabela que contem todos os tamanhos do meteoro mau
    WORD    METEORO_INICIAL
    WORD    METEORO_INICIAL_2X2
    WORD    METEORO_MAU_3X3
    WORD    METEORO_MAU_4X4
    WORD    METEORO_MAU_5X5
TAB_MET_BOM:    ; tabela que contem todos os tamanhos do meteoro bom
    WORD    METEORO_INICIAL
    WORD    METEORO_INICIAL_2X2
    WORD    METEORO_BOM_3X3
    WORD    METEORO_BOM_4X4
    WORD    METEORO_BOM_5X5


interrupcoes:
    WORD    rot_int_meteoros           ; rotina de atendimento da interrupcao meteoros
    WORD    rot_int_missil             ; rotina de atendimento da interrupcao missil
    WORD    rot_int_energia            ; rotina de atendimento da interrupcao energia


; *********************************************************************************
;                                   Codigo                                        *
; *********************************************************************************
PLACE   0 
; *****************************************************************************************
;                                   Processo Principal                                    *
; Processo que inicia as interrupcoes, outros processos e jogo, e responsavel tambem      *
; pelo menu principal do programa, menu de pausa e ainda por perder o jogo por desistencia*
; *****************************************************************************************
inicio:
    MOV SP, SP_princ                  ; inicializa SP
    MOV BTE, interrupcoes             ; inicializa BTE (registo de Base da Tabela de Exceções)
    MOV [APAGA_AVISO], R1             ; apaga o aviso de nenhum cenário selecionado (o valor de R1 não é relevante)
    MOV [APAGA_ECRÃ], R1              ; apaga todos os pixels já desenhados (o valor de R1 não é relevante)

    EI0                 ; permite interrupções meteoros
    EI1                 ; permite interrupções missil
    EI2                 ; permite interrupções energia
    EI                  ; permite interrupções (geral)
    CALL processo_teclado ; chamada do teclado previa aos outros processos para este comunicar o inicio do jogo

CALL espera_comeca_jogo ; espera por ordem  para comecar o jogo
; jogo comeca
processos: ; ocorre a chamada dos varios processos
    CALL processo_nave 
    CALL processo_missil
    CALL processo_energia
    CALL invoca_meteoros
    CALL processo_colisoes
    CALL processo_modo_jogo

; verifica se o estado de jogo precisa de alterar para pausar/desistir
testa_muda_estado_jogo:
    MOV R0,[tecla_carregada]
    CALL testa_muda_estado_jogo_pausa
    CALL testa_estado_jogo_desistir
    JMP testa_muda_estado_jogo


; *****************************************************************************************
;                                   Processo Teclado                                      *
; Processo que e responsavel pelo teclado do programa comunicando com outros processos    *
; e informando sobre as teclas que sao premidas                                           *
; *****************************************************************************************
PROCESS SP_teclado

processo_teclado:
    MOV  R2, TEC_LIN       
    MOV  R3, TEC_COL        
    MOV  R5, MASCARA_0_3        

espera_tecla:                    ; neste ciclo espera-se até uma tecla ser premida

    WAIT

    CALL obtem_tecla_teclado     ; deteta se ocorreu alguma mudanca no teclado    
    CMP R8,NENHUMA_TECLA_PREMIDA ; se nao houve
    JZ espera_tecla              ; volta a testar
                        
    MOV [tecla_carregada], R8    ; informa quem estiver bloqueado neste LOCK que uma tecla foi carregada

ha_tecla:                        ; neste ciclo espera-se até NENHUMA tecla estar premida

    YIELD               

    MOV [tecla_continua], R8     ; informa quem estiver bloqueado neste LOCK que uma tecla está a ser carregada
    CALL obtem_tecla_teclado     ; deteta se ocorreu alguma mudanca no teclado 
    CMP R8,NENHUMA_TECLA_PREMIDA ; se nao houve
    JNZ ha_tecla                 ; testa uma nova tecla 
    JMP espera_tecla             ; esta "rotina" nunca retorna porque nunca termina


;**************************************************************
; obtem_tecla_teclado - ve qual a tecla do teclado do teclado *
;                       que foi premida e retorna-a           *
;                                                             *
; Argumentos:                                                 *
;       R2- endereco do periferico das linhas                 *
;       R3- endereco do periferico das colunas                *
;       R5- mascara                                           *
; Retorna:                                                    *
;       R8 - tecla que foi premida                            *
;                                                             *
;**************************************************************
obtem_tecla_teclado:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R7
    set_linha_inicial:
        MOV  R1,1                  ; primeira linha
        MOV  R7,0
        JMP testa_linha_teclado  
    aumenta_linha:
        MOV R8,MAX_LIN_TECLADO
        CMP R8,R1        
        JNZ continua                ; se chegar a ultima linha do teclado repetir
        MOV R8,NENHUMA_TECLA_PREMIDA
        JMP fim_teclado
        continua:
        INC R7                      ; numero das linhas
        SHL R1,1                    ; numero das linhas em binario

    testa_linha_teclado:                   ; neste ciclo testa-se todas a linhas do teclado
        MOV R6,R1
        MOVB [R2], R1               ; escrever no periférico de saida (linhas)
        MOVB R0, [R3]               ; ler do periférico de entrada (colunas)
        AND  R0, R5                 ; elimina bits para além dos bits 0-3
        CMP  R0, 0                  ; há tecla premida?
        JZ   aumenta_linha          ; se nenhuma tecla premida, repete
    transforma_binario_hexa:
        MOV R8,R7                   ; equacao para numero hexa no display 4*coluna + linha
        SHL R8,2                    ; 4 * coluna
        MOV R1,-1
    obtem_coluna:
        INC R1                      ;numero da coluna
        SHR R0,1                    ;numero de shiftrights ate ser 0 que da o numero da coluna
        CMP R0,0
        JNZ obtem_coluna
    ADD R8,R1                       ; linha(R1) + 4*coluna(R8)
    fim_teclado:
    POP R7
    POP R2
    POP R1
    POP R0
RET

; *****************************************************************************************
;                                   Processo Nave                                         *
; Processo que e responsavel pelos movimentos da Nave                                     *
; *****************************************************************************************
PROCESS SP_nave
;   processo que coordena todos os movimentos da nave
processo_nave:
    CALL reseta_nave            ; da set a nave na sua posicao inicial

obtem_tecla_continua:
    MOV R8, [tecla_continua]    ; espera nova tecla do teclado
executa_tecla:
    CALL esta_interrompido      ; verifica se o jogo foi interrompido
    CMP R3,RESTART              ; verifica se e suposto dar restart
    JZ processo_nave            ; volta para o processo_nave se for para dar restart
    testa_move_esquerda:
    CMP R8, TECLA_MOVE_ESQUERDA ; se for a tecla de andar para a esquerda move para a esquerda
    JNZ testa_move_direita

    MOV R1,[ATRASO_NUM]         ; ve qual o valor do atraso 
    ADD R1,1                    ; incrementa o valor
    MOV [ATRASO_NUM],R1         ; volta a guardar na memoria
    MOV R7,MAX_ATRASO           ; se for o atraso maximo executa acao
    CMP R1,R7
    JNZ executa_tecla
    MOV R1,0                    ; se for para andar reseta o atraso  
    MOV [ATRASO_NUM],R1      
    MOV R7,-1
    CALL move_nave              ; move a nave 
    MOV R1,NAVE             
    MOV [evento_colisao], R1    ; pode existir colisao quando a nave se move
    JMP  obtem_tecla_continua

    testa_move_direita: 
    CMP R8, TECLA_MOVE_DIREITA  ; se for a tecla de andar para a direita move para a direita
    JNZ obtem_tecla_continua
    MOV R1,[ATRASO_NUM]         ; ve qual o valor do atraso 
    ADD R1,1                    ; incrementa o valor
    MOV [ATRASO_NUM],R1         ; volta a guardar na memoria
    MOV R7,MAX_ATRASO           ; se for o atraso maximo executa acao
    CMP R1,R7
    JNZ executa_tecla
    MOV R1,0                    ; se for para andar reseta o atraso              
    MOV [ATRASO_NUM],R1
    MOV R7,1
    CALL move_nave              ; move a nave 
    MOV R1,NAVE               
    MOV [evento_colisao], R1    ; pode existir colisao quando a nave se move
    JMP  obtem_tecla_continua

;****************************************************************************
; reseta_nave - Desenha a nave na sua posicao inicial                       *
;****************************************************************************
reseta_nave:
    PUSH R1
    PUSH R2
    PUSH R4
    PUSH R10

    MOV R1,LINHA_INICIAL_NAVE         ; atualiza a posicao da linha da nave para a posicao inicial
    MOV R4,DEF_NAVE                   ; endereco da nave
    MOV [R4],R1

    ADD R4,PROXIMO

    MOV R1,COLUNA_INICIAL_NAVE        ; atualiza a posicao da linha da nave para a posicao inicial
    MOV [R4],R1

    MOV R2,NAVE
    MOV [MUDA_PIXEL_SCREEN],R2        ; muda para a pixel screen da nave 
    MOV R4,DEF_NAVE
    MOV R10, DESENHA
    CALL desenha_objeto               ; desenha nave na posicao inicial

    POP R10
    POP R4
    POP R2
    POP R1
RET

;****************************************************************************
; testa_limites - Testa se o nave chegou aos limites do ecrã e nesse caso   *
;              impede o movimento (força R7 a 0)                            *
; Argumentos:                                                               * 
;           R4 - tabela do boneco                                           * 
;                                                                           *
; Retorna:  R7 - 0 se já tiver chegado ao limite, inalterado caso contrario * 
;****************************************************************************
testa_limites:
    PUSH R2
    PUSH R4
    PUSH R5
    PUSH R6

    ADD R4,PROXIMO
    MOV R2, [R4]                ;coluna nave
    ADD R4,PROXIMO
    MOV R6, [R4]                ; obtem a largura do nave
    testa_limite_esquerdo:      ; vê se o nave chegou ao limite esquerdo
        MOV R5, MIN_COLUNA
        CMP R2, R5
        JGT testa_limite_direito
        CMP R7, 0               ; passa a deslocar-se para a direita
        JGE sai_testa_limites
        JMP impede_movimento    ; entre limites. Mantem o valor do R7
    testa_limite_direito:       ; ve se o nave chegou ao limite direito
        ADD R6, R2              ; posicao a seguir ao extremo direito do nave
        MOV R5, MAX_COLUNA
        CMP R6, R5
        JLE sai_testa_limites   ; entre limites. Mantem o valor do R7
        CMP R7, 0               ; passa a deslocar-se para a direita
        JGT impede_movimento
        JMP sai_testa_limites
    impede_movimento:
        MOV R7, 0               ; impede o movimento, forçando R7 a 0
    sai_testa_limites:  
    POP R6
    POP R5
    POP R4
    POP R2
RET


;****************************************************************************
; move_nave - Move a nave para o sentido especificado nos argumentos        *
; Argumentos:                                                               * 
;           R7 - sentindo em que a nave se move (1/-1)                      * 
;****************************************************************************
move_nave:
    PUSH R4
    PUSH R6
    PUSH R7
    PUSH R9
    PUSH R10

    MOV R6,NAVE
    MOV [MUDA_PIXEL_SCREEN],R6
    MOV R9,NAO_EXPLOSAO
    MOV R4 ,DEF_NAVE
    CALL  testa_limites           ; ve se chegou aos limites do ecrã e se sim força R7 a 0
    CMP R7, 0
    JZ  fim_move_nave             ; se não e para movimentar o objeto, vai ler o teclado de novo
    MOV R10, APAGA
    CALL desenha_objeto           ; apaga a nave
    ADD R4,PROXIMO
    MOV R9,[R4]
    ADD R9, R7                    ; para desenhar objeto na coluna seguinte (direita ou esquerda)
    MOV [R4],R9
    ADD R4,ANTERIOR
    MOV R10, DESENHA
    CALL desenha_objeto           ; vai desenhar o nave de novo
    fim_move_nave:
    POP R10
    POP R9
    POP R7
    POP R6
    POP R4
RET


; *****************************************************************************************
;                                   Processo Missil                                       *
; Processo que e responsavel por disparar, e movimentar o missil e causar colisoes        *
; *****************************************************************************************
PROCESS SP_missil
;   processo que coordena todos os movimentos do missil
processo_missil:
    MOV R1,ESTADO_INTACTO           ; muda o estado do missil para intacto
    MOV [COLISAO_MISSIL],R1    
    MOV R4,DEF_MISSIL               ; muda a linha do missil para nao existente
    MOV R1,-1
    MOV [R4],R1
    ADD R4,2
    MOV [R4],R1                     ; muda a coluna do missil para nao existente
    testa_dispara_missil:
        MOV R8, [tecla_carregada]   ; espera por uma tecla do teclado
        CMP R8, TECLA_DISPARA_MISSIL
        JNZ testa_dispara_missil

    CALL esta_interrompido          ; verifica se o jogo foi interrompido
    CMP R3,RESTART                  ; verifica se e necessario dar restart
    JZ processo_missil              ; se sim volta ao inicio
    CALL dispara_missil             ; se nao dispara o missil
    MOV R0, ALCANCE_MISSIL          ; reseta o alcance do missil
    ciclo_missil:
        MOV R1, [evento_missil]     ; espera pelo evento do missil para mover o missil

        CALL esta_interrompido      ; verifica se o jogo foi interrompido
        CMP R3,RESTART              ; verifica se e necessario dar restart
        JZ processo_missil          ; se sim volta ao inicio

        MOV R1,[COLISAO_MISSIL]     ; verifica se ocorreu colisao com o missil
        CMP R1,ESTADO_INTACTO        
        JNZ processo_missil         ; se nao continua
        MOV R1,PIXEL_SCREEN_MISSIL   
        MOV [evento_colisao],R1     ; comunica com o processo colisoes que pode haver uma colisao com o missil
        MOV R8,PIXEL_SCREEN_MISSIL
        MOV [MUDA_PIXEL_SCREEN],R8
        CALL sobe_missil            ; faz o missil movimentar-se
        SUB R0,1                    ; decrementa o alcance  
        JNZ ciclo_missil            ; se chegar a 0 o missil acaba
    acaba_missil:
    MOV R10,APAGA                   ; apaga o missil
    CALL desenha_missil
    JMP processo_missil             ; volta para o inicio para resetar missil    


;****************************************************************************
; atraso_meteoros - Funcao que atrasa os meteoros para se                   *
;                   espacarem melhor no ecra                                * 
; Argumentos:                                                               * 
;           R11 - numero da instancia do meteoro                            *
;****************************************************************************
atraso_meteoros:;ARGS R11, INSTANCIA
    PUSH R0
    PUSH R11

    CMP R11,1 ; e o segundo meteoro?
    JNZ meteoro_2
    MOV R0,4
    ciclo_meteoro_1:
    MOV R1, [evento_meteoro]   ;atrasa o segundo meteoro por 4 clocks
    SUB R0,1
    JNZ  ciclo_meteoro_1

    meteoro_2:
    CMP R11,2 ; e o terceiro meteoro?
    JNZ meteoro_3
    MOV R0,8
    ciclo_meteoro_2:
    MOV R1, [evento_meteoro]  ;atrasa o segundo meteoro 8 clocks
    SUB R0,1
    JNZ  ciclo_meteoro_2

    meteoro_3:
    CMP R11,3 ; e o quarto meteoro?
    JNZ fim_atraso_meteoros
    MOV R0,12
    ciclo_meteoro_3:
    MOV R1, [evento_meteoro]  ;atrasa o quarto meteoro 12 clocks
    SUB R0,1
    JNZ  ciclo_meteoro_3

    fim_atraso_meteoros:
    POP R11
    POP R0
RET

;****************************************************************************
; sobe_missil - Apaga o missil na linha atual e desenha o na proxima        *
;****************************************************************************
sobe_missil:
    PUSH R1
    PUSH R10

    MOV R10,APAGA
    CALL desenha_missil     ; apaga missil na posicao atual
    MOV R1,[DEF_MISSIL]  
    DEC R1                  ; sobe a linha missil 
    MOV [DEF_MISSIL],R1     
    MOV R10,DESENHA         ; desenha na proxima posicao
    CALL desenha_missil

    fim_missil:

    POP R10
    POP R1
RET

;****************************************************************************
; dispara_missil - Coloca um missil na posicao exatamente acima             *
;*                  do centro da nave e decrementa a energia                * 
;****************************************************************************
dispara_missil:
    PUSH R1
    PUSH R2
    PUSH R4
    PUSH R5
    PUSH R10

    MOV R1,SOM_DISPARO      
    MOV [TOCA_SOM],R1          ; toca som disparar
    MOV R1,PIXEL_SCREEN_MISSIL ; muda para pixel screen do missil
    MOV [MUDA_PIXEL_SCREEN],R1

    MOV R1,LINHA_INICIAL_MISSIL
    MOV R4,DEF_MISSIL
    MOV [R4],R1                ; atualiza linha
    MOV R10, DEF_NAVE
    ADD R10, PROXIMO           ; coluna nave
    MOV R1, [R10]              
    ADD R1,2                   ; adicionar 2 para o missil sair do centro da nave
    ADD R4,PROXIMO             ; coluna missil
    MOV [R4],R1                ; atualiza coluna
    MOV R10,DESENHA
    CALL desenha_missil
    MOV R1,DECREMENTO_ENERGIA  ; decrementa 5 energia     
    CALL muda_energia
 
    POP R10
    POP R5
    POP R4
    POP R2
    POP R1
RET

;****************************************************************************
; desenha_missil - Desenha ou apaga o missil                                *
; Argumentos:                                                               * 
;           R10 - DESENHA para desenhar / APAGA para apagar                 *
;****************************************************************************
desenha_missil:
    PUSH R1
    PUSH R2
    PUSH R4
    PUSH R8

    MOV R8,PIXEL_SCREEN_MISSIL  ; muda para a pixel screen do missil
    MOV [MUDA_PIXEL_SCREEN],R8
    MOV R5,LARGURA_MISSIL       ; largura missil
    MOV R4,DEF_MISSIL   
    MOV R1, [R4]                ; linha missil 
    ADD R4,PROXIMO
    MOV R2,[R4]                 ; coluna missil
    ADD R4,PROXIMO
    CALL desenha_pixels         ; desenha/apaga missil

    POP R8
    POP R4
    POP R2
    POP R1     
RET

;**********************************************************************
; desenha_objeto - desenha/apaga um objeto no ecra                    *
;                                                                     *
; Argumentos:                                                         *
;       R1- linha a desenhar                                          *
;       R2- coluna inicial a desenhar                                 *
;       R4- endereco da tabela que define o desenho                   *
;       R9 - EXPLOSAO para desenhar a explosao                        *
;            ou qualquer outro valor para nao a desenhar              *
;                                                                     *
;       R10- APAGA OU DESENHA, consoante seja para apagar ou desenhar *
;**********************************************************************
desenha_objeto:
    PUSH R1
    PUSH R2
    PUSH R4
    PUSH R5
    PUSH R8
    PUSH R9

    MOV R1,[R4]                  ; linha inicial do objeto
    ADD R4,PROXIMO
    MOV R2,[R4]
    ADD R4,PROXIMO               ; coluna inicial do objeto
    MOV R5,[R4]                  ; obtem a largura do desenho
    ADD R4, PROXIMO
    MOV R8,[R4]                  ; obtem altura do desenho
    ADD R4, PROXIMO
    CMP R9,EXPLOSAO              ; e para desnehar explosao?
    JNZ desenha_estrutura
    ADD R4, PROXIMO              ; desenha explosao
    desenha_estrutura:
    MOV R4,[R4]                  ; acede endereco do design visual
    desenha_proxima_linha:
        CALL desenha_pixels
        SUB R1,1                 ; proxima linha
        SUB R8,1                 ; decrementa a altura do desenho
        JNZ desenha_proxima_linha

    POP R9
    POP R8
    POP R5
    POP R4
    POP R2
    POP R1
RET


;*************************************************************
; desenha_pixels - Desenha os pixels pedidos                 *
;                                                            *
; Argumentos:                                                *
;           R4 - endereco do primeiro pixel a ser desenhado  *
;           R6 - coluna_inicial                              *
;           R10 - DESENHA para desenhar ou APAGA para apagar *
;                                                            *
; Retorna:  R4 - proximo pixel a ser desenhado               *
;                                                            *
;*************************************************************
desenha_pixels:
    PUSH R2
    PUSH R3
    PUSH R5
    ciclo_pixels:
        MOV R3, [R4]                ; obtém a cor do próximo pixel do nave
        CMP R10,APAGA
        JNZ desenhar
        MOV R3,0
        desenhar: 
            MOV [DEFINE_LINHA], R1  ; seleciona a linha
            MOV [DEFINE_COLUNA], R2 ; seleciona a coluna
            MOV [DEFINE_PIXEL], R3  ; altera a cor do pixel na linha e coluna selecionadas
            ADD R4, PROXIMO         ; endereço da cor do próximo pixel (2 porque cada cor de pixel é uma word)
            ADD R2, 1               ; próxima coluna
            SUB R5, 1               ; menos uma coluna para tratar
            JNZ ciclo_pixels        ; continua até percorrer toda a largura do objeto
    POP R5
    POP R3
    POP R2
RET

; *****************************************************************************************
;                                   Processo Energia                                      *
; Processo que e responsavel por alteracoes na energia                                    *
; *****************************************************************************************
PROCESS SP_energia
; processo que controla a energia e as suas mudancas
processo_energia:
    MOV R1,MAX_ENERGIA                 ; energia maxima 
    MOV [ENERGIA],R1                   ; reset no contador interno de energia
    MOV [DISPLAYS],R1                  ; reset no display
    MOV R1,DECREMENTO_ENERGIA       ; decremento de 5 na energia

    muda_energia_por_evento:
    MOV R0,[evento_energia]            ; quando ocorre o evento da energia
    CALL esta_interrompido             ; verifica se o jogo estiver em pausa
    CMP R3,RESTART                     ; verifica se e suposto dar restart ao jogo
    JZ processo_energia                ; se for da restart
    CALL muda_energia                  ; se nao for suposto dar restart decrementa a energia
    JMP muda_energia_por_evento        ; volta para o inicio e espera pelo proximo evento

;rotina de interrupcao que comunica quando o nivel de  energia tem de descer


;****************************************************************************
; muda_energia - Recebe um valor positivo ou negativon soma-o a energia     *
;                e muda o valor no display                                  *
; Argumentos:                                                               * 
;           R1 - valor a somar                                              * 
;****************************************************************************
muda_energia:
    PUSH R1
    PUSH R2
    PUSH R3

    MOV R2,[ENERGIA]      ; acede ao espaco na memoria da energia atual
    MOV R0,R2             ; registo duplicado  energia
    MOV R3,MASCARA_0_3

    AND R3,R2             ; isolar as unidades R3 -unidades
    SHR R2,4              ; isolar a dezenas   R2- dezenas
    ADD R3,R1             ; soma o valor a adicionar
    JN subtrai            ; verifica se o valor e negativo se sim e uma subtracao
    MOV R1,10             ; verifica se o valor e maior que 10
    CMP R3,R1
    JGE soma              ; se sim e uma soma
    JMP muda_display

    soma:
    SUB R3,R1             ; tira 10 ao numero que era maior que 10
    ADD R2,1              ; adiciona 1 as dezenas
    JMP muda_display

    subtrai:
    MOV R1,10
    ADD R3,R1             ; adiciona 10 ao numero que era negativo
    SUB R2,1              ; tira 1 as dezenas
    MOV R1,MAX_ENERGIA    
    CMP R0,R1             ; caso a energia inicial fosse 100
    JNZ muda_display
    MOV R2,0            
    MOV R3,95H            ; se o valor da energia for 100 e retirarmos 5 o valor e 95


    muda_display:
        SHL R2,4          ; voltamos a por a dezenas no sitio correto 
        OR R3,R2          ; juntamos as dezenas com as unidades
        JNP caso_0        ; caso seja 0 ou menos saltar para o caso_0
        MOV R2,CASO_100   ; caso seja 100 ou mais
        CMP R3,R2
        JGE caso_100
        JMP fim

        caso_0:
            MOV R3,0     ; mudar energia para 0 
            MOV R1,PERDIDO_ENERGIA
            MOV [evento_perder_jogo],R1 ; comunicar com o processo de modo de jogo que o jogo foi perdido 
            JMP fim

        caso_100:
            MOV R3,MAX_ENERGIA ; mudar a energia para 100

        fim: ; atualiza os displays
            MOV [ENERGIA],R3 
            MOV [DISPLAYS],R3
    POP R3
    POP R2
    POP R1
RET


; *****************************************************************************************
;                                   Processo Metero                                       *
; Processo que e responsavel pelo movimento dos cometas, causar colisoes, e funcionamento *
; em geral do cometa, e ainda invocado pelo invoca_cometas, NUMERO_COMETAS vezes          *
; Argumentos:                                                                             *
;           R11- numero da instancia do cometa                                            *
; *****************************************************************************************
PROCESS SP_inicial_meteoro_0
; processo que coordena todos os movimentos do meteoro
processo_meteoro:
    MOV  R10, R11                   ; cópia do nº de instância do processo
    SHL  R10, 1                     ; multiplica por 2 porque as tabelas são de WORDS
    MOV  R9, TAB_METEORO_SP         ; tabela com os SPs iniciais das várias instâncias deste processo
    MOV  SP, [R9+R10]               ; acede ao SP da instacia atual


    recomeca_meteoro:
        CALL atraso_meteoros        ; chama um atraso nos meteoros para andarem mais separados (estetico)
                 
    faz_meteoro:
        CALL esta_interrompido      ; verifica se o jogo estiver em pausa
        CMP R3,RESTART              ; verifica se e suposto dar restart ao jogo
        JZ recomeca_meteoro         ; se for da restart
        MOV  R10, R11               ; cópia do nº de instância do processo
        SHL  R10, 1                 ; multiplica por 2 porque as tabelas são de WORDS
        MOV R4,ESTADO_INTACTO       ; muda o estado do meteoro para intacto
        MOV R9,TAB_METEORO_ESTADOS
        MOV R6,R9
        ADD R6,R10
        MOV [R6],R4
        MOV R9,TAB_METEORO_DEF      ; vai buscar a definicao do meteoro atual a tabela 
        MOV R4,[R9+R10]
        CALL define_meteoro         ; vai definir o tipo e escolher coluna do meteoro e desenha o
        MOV R0,ALCANCE_METEORO      ; reseta o alcance do meteoro
    descer_meteoro:
        MOV R1, [evento_meteoro]    ; espera pelo evento do meteoro
        CALL esta_interrompido      ; verifica se o jogo estiver em pausa
        CMP R3,RESTART              ; verifica se e suposto dar restart ao jogo
        JZ recomeca_meteoro         ; se for da restart
        MOV R3, [R6]                ; verifica o estado do meteoro intacto
        MOV R1,ESTADO_INTACTO   
        CMP R3,R1                   ; se estiver intacto desce o meteoro 
        JZ continua_descer_meteoro
    apaga_meteoro:
        MOV R1, [evento_meteoro]    ; espera pelo evento do meteoro para apagar o meteoro
        MOV [MUDA_PIXEL_SCREEN],R11 ; muda a pixel screen para a do meteoro atual
        MOV R9,EXPLOSAO             ; informa a funcao desenha_objeto que a estrutura a desenhar e a explosao
        MOV R10,APAGA               ; informa a funcao desenha_objeto que deve apagar a estrutura
        CALL desenha_objeto         ; apaga a explosao

        JMP faz_meteoro ; reseta o meteoro

    continua_descer_meteoro:

    MOV [MUDA_PIXEL_SCREEN],R11   ; muda a pixel screen para a do meteoro atual
    CALL desce_meteoro            ; desce o meteoro
    MOV [evento_colisao], R11     ; pode ocorrer colisao quando o meteoro desce
    SUB R0,1                      ; decrementa alcance
    JZ fim_descer_meteoro         ; se for 0 acaba o meteoro
    JMP descer_meteoro            

    fim_descer_meteoro:
    MOV R1, [evento_meteoro]      ; espera pelo proximo evento de meteoro
    MOV [MUDA_PIXEL_SCREEN],R11   ; muda a pixel screen para a do meteoro atual
    MOV R9,1                      ; especifica que nao e para desenhar a explosao
    MOV R10, APAGA                ; especifica que e para apagar o meteoro
    CALL desenha_objeto           ; desenha o meteoro
    JMP faz_meteoro



;****************************************************************************
; desce_meteoro - Apaga o meteoro na posicao atual                          *
;                 e desenha-o na proxima posicao                            *
; Argumentos:                                                               * 
;           R4 - endereco da tabela de definicao do boneco                  * 
;****************************************************************************
desce_meteoro:                   ; desce a posicao do meteoro até chegar ao fim da tela recebe R4, meteoro
    PUSH R1
    PUSH R4
    PUSH R9
    PUSH R10

    MOV R9, NAO_EXPLOSAO                 
    MOV R10, APAGA
    CALL desenha_objeto          ; apaga o meteoro


    MOV R1,[R4]                  ; atualiza o R1 para a posicao atual do meteoro
    INC R1                       ; incrementar a linha
    MOV [R4],R1                  ; mover a posicao do meteoro para a posicao nova

    MOV R10, DESENHA
    CALL desenha_objeto          ; desenha o meteoro
    CALL aumenta_tamanho_meteoro ; aumenta o tamanho do meteoro caso seja necessario
    POP R10
    POP R9
    POP R4
    POP R10
RET

;****************************************************************************
; define_meteoro - Escolhe o tipo e a coluna do meteoro e desenha-o         *
;                  na posicao escolhida                                     *
; Argumentos:                                                               * 
;           R4 - tabela de definicao do meteoro                             * 
;           R11 - numero da instancia do meteoro                            *
; Retorna:                                                                  *
;           R5 - tabela de  design do meteoro                               *
;****************************************************************************
define_meteoro:
    PUSH R1
    PUSH R2
    PUSH R3
    PUSH R4
    PUSH R9
    PUSH R10
    PUSH R11

    MOV [MUDA_PIXEL_SCREEN],R11          ; atualiza a pixel screen para a do meteoro atual
    MOV R3,R4
    MOV R1,LINHA_INICIAL_METEORO         ; atualiza a posicao da linha do meteoro para a posicao inicial
    MOV [R3],R1 
    ADD R3,PROXIMO
    CALL escolhe_coluna_pseudo_aleatoria ; escolha uma coluna aleatoria
    MOV [R3],R9                          ; atualiza coluna
    ADD R3,PROXIMO                       
    MOV R1,LARGURA_METEORO
    MOV [R3],R1                          ; atualiza para largura inicial (1)
    ADD R3,PROXIMO
    MOV [R3],R1                          ; atualiza para altura inicial (1)
    ADD R3,PROXIMO
    MOV R1,METEORO_INICIAL               ; atualiza para design inicial
    MOV [R3],R1
    MOV R9,NAO_EXPLOSAO
    MOV R10, DESENHA
    CALL desenha_objeto                  ; desenha o meteoro
    CALL escolhe_tipo_meteoro
    ADD R3,DOUBLE_PROXIMO
    MOV [R3],R2                          ; atualiza tipo meteoro

    POP R11
    POP R10
    POP R9
    POP R4
    POP R3
    POP R2
    POP R1
RET


;****************************************************************************
; aumenta_tamanho_meteoro - Aumenta as dimensoes do meteoro conforme        *
;                           a sua posicao na tela                           *
; Argumentos:                                                               * 
;           R0 - numero de linhas ate o fim do alcance                      * 
;           R5 - tabela de design do meteoro                                *
;****************************************************************************
aumenta_tamanho_meteoro:
    PUSH R0
    PUSH R1
    PUSH R3
    muda_2x2:
        MOV R3,MUDANCA_PARA_2X2
        CMP R0,R3
        JNZ muda_3x3
        MOV R1,2           ; dimensao 2x2
        CALL muda_dimensao
        JMP fim_aumenta_tamanho
    muda_3x3:
        MOV R3,MUDANCA_PARA_3X3
        CMP R0,R3
        JNZ muda_4x4
        MOV R1,3           ; dimensao 3x3
        CALL muda_dimensao
        JMP fim_aumenta_tamanho
    muda_4x4:
        MOV R3,MUDANCA_PARA_4X4
        CMP R0,R3
        JNZ muda_5x5
        MOV R1,4           ; dimensao 4x4
        CALL muda_dimensao
        JMP fim_aumenta_tamanho
    muda_5x5:
        MOV R3,MUDANCA_PARA_5X5
        CMP R0,R3
        JNZ fim_aumenta_tamanho
        MOV R1,5           ; dimensao 5x5
        CALL muda_dimensao
        JMP fim_aumenta_tamanho
    fim_aumenta_tamanho:
    POP R3
    POP R1
    POP R0
RET

;****************************************************************************
; muda_dimensao - Altera o design do meteoro para a dimensao recebida       *
; Argumentos:                                                               * 
;           R1 - numero que representa a dimensao do meteoro                * 
; Retorna:                                                                  *
;           R5 - tabela de  design do meteoro                               *
;****************************************************************************
muda_dimensao:
    PUSH R1
    PUSH R3
    PUSH R4

    ADD R5,PROXIMO; move para o tamanho seguinte na tabela de design
    MOV R0,R4
    ADD R4,DOUBLE_PROXIMO
    MOV [R4],R1   ; atualiza largura
    ADD R4,PROXIMO
    MOV [R4],R1   ; atualiza altura
    ADD R4,PROXIMO
    MOV R3,[R5]   
    MOV [R4],R3   ; atualiza design na definicao de meteoro

    POP R4
    POP R3
    POP R1
RET


;****************************************************************************
; numero_aleatorio - Gera um numero aleatorio                               *
; Retorna:                                                                  *
;           R9 - numero aleatorio                                           *
;****************************************************************************
numero_aleatorio:
    PUSH R0
    MOV R9, [TEC_COL]   ; le periferico  
    MOV R0, MASCARA_4_7
    AND R9,R0
    SHR R9,5
    POP R0
RET

;****************************************************************************
; escolhe_coluna_pseudo_aleatoria - Gera uma coluna aleatoria de entre 8    *
; Retorna:                                                                  *
;           R9 - coluna aleatoria                                           *
;****************************************************************************
escolhe_coluna_pseudo_aleatoria:
    PUSH R0
    CALL numero_aleatorio ; obtem numero aleatorio
    MOV R0,8
    MUL R9,R0             ; multiplica por 8 para ficar em uma das 8 colunas possiveis
    POP R0
RET

;****************************************************************************
; escolhe_tipo_meteoro - Gera um tipo de meteoro e devolve-o e o seu design *
; Retorna:                                                                  *
;           R2 - tipo meteoro (BOM/MAU)                                     *
;           R5 - tabela de design do meteoro                                *
;****************************************************************************
escolhe_tipo_meteoro: ;DEVOLVE R2 R5
    PUSH R9
    CALL numero_aleatorio ; numero de 0-7
    CMP R9,1              ; se o numero for maior que 1 e meteoro mau
    JGT meteoro_mau       ; probabilidade bom- 25% mau- 75%
    MOV R2,BOM
    MOV R5,TAB_MET_BOM    ; se for bom escolhe o tipo e o design especifico de meteoro bom
    JMP fim_escolhe_meteoro
    meteoro_mau:
        MOV R2,MAU
        MOV R5,TAB_MET_MAU; se for mau escolhe o tipo e o design especifico de meteoro mau
    fim_escolhe_meteoro:
    POP R9
RET

;****************************************************************************
; invoca_meteoros - Inicializa os processos dos meteoros                    *
;****************************************************************************
invoca_meteoros:
    PUSH R11
    MOV R11, NUMERO_METEOROS               ; numero de meteoros a usar (ate 4)
    loop_invoca_meteoros:
        SUB R11, 1                         ; proximo meteoro
        CALL    processo_meteoro           ; cria uma nova instância do processo meteoro (o valor de R11 distingue-as)
        CMP  R11, 0                        ; ja criou as instancias todas?
        JNZ    loop_invoca_meteoros        ; se nao, continua
    POP R11
RET

;****************************************************************************
; reseta_meteoros - Reseta as posicoes dos meteoros                         *
;****************************************************************************
reseta_meteoros:
    PUSH R0
    PUSH R4
    PUSH R5
    PUSH R11
    MOV R11,0                       ; primeiro meteoro
    MOV R5,TAB_METEORO_DEF
    MOV R0,LINHA_INICIAL_METEORO
    ciclo_reset_meteoros:
    MOV R4,[R5]
    MOV [R4],R0
    ADD R5,2
    ADD R11,1
    CMP R11,NUMERO_METEOROS
    JNZ ciclo_reset_meteoros
    POP R11
    POP R5
    POP R4
    POP R0
RET

; *****************************************************************************************
;                                   Processo Colisoes                                     *
; Processo que e responsavel pela resposta e verificacao de potenciais colisoes,sendo     *
; responsavel por vezes por causar a perda o jogo                                         *
; *****************************************************************************************
PROCESS SP_colisoes
processo_colisoes:
    MOV R1,[evento_colisao]       ; espera pelo proximo evento da colisao
    CMP R1,PIXEL_SCREEN_MISSIL    ; verifica se e uma colisao com um missil 
    JZ testa_colisao_missil
    colisao_meteoros:
        CALL esta_interrompido    ; verifica se o jogo estiver em pausa
        CMP R3,RESTART            ; verifica se e suposto dar restart ao jogo
        JZ processo_colisoes      ; se for da restart
        CALL testa_colisoes_entre_meteoros_nave ; verifica colisoes entre todos os meteoros e a nave
        CMP R3,OCORREU_COLISAO    ; verifica se ocorreu colisao
        JNZ fim_processo_colisoes ; se nao volta a esperar por colisoes
        MOV R10,R11               ; numero do meteoro colidido
        SHL R10,1                 
        MOV R9,TAB_METEORO_ESTADOS; tabela de estados dos meteoros
        MOV [R9+R10],R11          ; declarar meteoro atual como destruido
        JMP fim_processo_colisoes
        
    testa_colisao_missil:
        CALL esta_interrompido    ; verifica se o jogo estiver em pausa
        CMP R3,RESTART            ; verifica se e suposto dar restart ao jogo
        JZ processo_colisoes      ; se for da restart
        CALL testa_colisoes_entre_meteoros_missil; verifica colisoes entre todos os meteoros e o missil
        CMP R3,OCORREU_COLISAO    ; verifica se ocorreu colisao
        JNZ fim_processo_colisoes ; se nao volta a esperar por colisoes
        MOV R10,R11               ; numero do meteoro colidido
        SHL R10,1
        MOV R9,TAB_METEORO_ESTADOS
        MOV [R9+R10],R11          ; declarar meteoro como destruido
        MOV [COLISAO_MISSIL],R11  ; comunicar com o processo de missil informando sobre a colisao

    fim_processo_colisoes:       
        JMP processo_colisoes


;****************************************************************************
; testa_colisoes_entre_meteoros_missil - Verifica se houve colisoes entre   *
;                                        os varios meteoros e o missil      *
; Retorna:                                                                  *
;           R11 - numero do ultimo meteoro a ser testado                    *
;           R3 - variavel que informa se houve colisao ou nao               *
;****************************************************************************
testa_colisoes_entre_meteoros_missil:
    PUSH R1
    PUSH R5
    PUSH R6

    MOV R11,0                       ; primeiro meteoro
    MOV R5,TAB_METEORO_DEF
    MOV R6,TAB_METEORO_ESTADOS
    ciclo_testa_meteoros:
    MOV R1,[R6]
    CMP R1,ESTADO_INTACTO           ; verifica estado do meteoro
    JNZ fim_iteracao_testa_meteoros ; se destruido passa ao proximo 
    MOV R4,[R5]                     ; definicao do meteoro atual
    CALL verifica_colisao_meteoro_missil ; verifica colisao
    CMP R3,OCORREU_COLISAO
    JZ fim_ciclo_testa_meteoros     ; se ocorrer colisao para de procurar colisao 
    fim_iteracao_testa_meteoros:
    ADD R11,1                       ; incrementa numero meteoro
    ADD R5,PROXIMO                  ; proxima definicao 
    ADD R6,PROXIMO                  ; proximo estado de meteoro
    CMP R11,NUMERO_METEOROS         ; se for o ultimo meteoro acaba
    JNZ ciclo_testa_meteoros
    fim_ciclo_testa_meteoros:
    POP R6
    POP R5
    POP R1
RET


;****************************************************************************
; verifica_colisao_meteoro_missil - Verifica se houve colisao entre         *
;                o meteoro recebido e o missil se sim, explode o meteoro    *
;                e apaga o missil                                           *
; Argumentos:                                                               * 
;           R4 - tabela de definicao do meteoro                             * 
; Retorna:                                                                  *
;           R3 - variavel que informa se houve colisao ou nao               *
;****************************************************************************
verifica_colisao_meteoro_missil:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R4
    PUSH R5
    PUSH R9
    PUSH R10


    MOV R0,DEF_MISSIL     ; endereco do missil
    MOV R2,[R0]
    CMP R2,-1             ; se o missil nao existir
    JZ  fim_colisao       ; acaba de verificar
    ADD R0,PROXIMO
    MOV R1,[R0]
    CALL verifica_colisao ; verifica se ha colisao
    CMP R3,OCORREU_COLISAO
    JNZ fim_colisao       ; se nao para de verificacao

    colisao_acao:
        MOV R8,PIXEL_SCREEN_MISSIL ; muda para pixel screen do missil
        MOV [MUDA_PIXEL_SCREEN],R8
        MOV R10,APAGA
        CALL desenha_missil        ; apaga missil
        MOV [MUDA_PIXEL_SCREEN],R11; muda para pixel screen do meteoro
        CALL desenha_objeto        ; apaga meteoro
        MOV R10,DESENHA            
        MOV R9,EXPLOSAO
        CALL desenha_objeto        ; desenha explosao

        ADD R4,TRIPLE_PROXIMO
        ADD R4,TRIPLE_PROXIMO      ; tipo de meteoro
        MOV R1,[R4]
        MOV R3,SOM_EXPLOSAO
        MOV [TOCA_SOM],R3
        MOV R3,OCORREU_COLISAO     ; toca som da explosao 
        CMP R1,BOM
        JZ fim_colisao             ; se for bom colisao com o missil nao faz nada
        MOV R1,5                   ; se for mau aumenta 5 de energia
        CALL muda_energia
    fim_colisao:

    POP R10
    POP R9
    POP R5
    POP R4
    POP R2
    POP R1
    POP R0
RET

;****************************************************************************
; testa_colisoes_entre_meteoros_nave - Verifica se houve colisoes entre     *
;                                      os varios meteoros e a nave          *
; Retorna:                                                                  *
;           R11 - numero do ultimo meteoro a ser testado                    *
;           R3 - variavel que informa se houve colisao ou nao               *
;****************************************************************************
testa_colisoes_entre_meteoros_nave:
    PUSH R0
    PUSH R4
    PUSH R5
    PUSH R9
  
    MOV  R11,0                        ; numero de meteoros
    MOV  R9,TAB_METEORO_ESTADOS       ; tabela de estados de meteoro
    MOV  R5,TAB_METEORO_DEF           ; tabela de definicao de meteoros
    ciclo_testa_meteoros_nave:
    MOV R0,[R9]
    CMP R0,ESTADO_INTACTO             ; esta intacto?
    JNZ proxima_iteracao_ciclo        ; se nao vai para o proximo
    MOV R4,[R5]                       ; definicao do meteoro   
    CALL verifica_colisao_nave_meteoro; verifica a colisao do meteoro com nave
    CMP R3,OCORREU_COLISAO            ; ocorreu colisao
    JZ fim_ciclo_testa_meteoros_nave  ; se sim sair do ciclo, se nao vai para o proximo meteoro
    proxima_iteracao_ciclo:
    ADD R11,1                         ; incrementa numero do meteoro
    ADD R5,PROXIMO                    ; proxima definicao de meteoro
    ADD R9,PROXIMO                    ; proximo estado do meteoro
    CMP R11,NUMERO_METEOROS           ; e o ultimo meteoro?
    JNZ ciclo_testa_meteoros_nave     ; se sim sair do ciclo , se nao vai para o proximo meteoro

    fim_ciclo_testa_meteoros_nave:
    POP R9
    POP R5
    POP R4
    POP R0
RET

;****************************************************************************
; verifica_colisao_nave_meteoro - Verifica se houve colisao entre           *
;                 o meteoro recebido e a nave se sim, explode o meteoro,    *
;                 caso este seja bom aumenta energia, se for mau            *
;                ativa o evento que leva a perder o jogo                    *
; Argumentos:                                                               * 
;           R4 - tabela de definicao do meteoro                             * 
; Retorna:                                                                  *
;           R3 - variavel que informa se houve colisao ou nao               *
;****************************************************************************
verifica_colisao_nave_meteoro:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R4
    PUSH R5
    PUSH R6
    PUSH R7
    PUSH R9
    PUSH R10

    MOV R0,R11      ; copia do numero da instancia do  meteoro
    ciclo_meteoros:
    pixel_inferior_esquerdo:
        MOV R6, DEF_NAVE
        MOV R2, [R6]            ; linha nave
        ADD R6,PROXIMO
        MOV R1,[R6]             ; coluna nave
        CALL verifica_colisao
        CMP R3,OCORREU_COLISAO  ; ocorreu colisao?
        JZ colisao_meteoro_nave ; se nao vai para o proximo pixel, se sim vai para a colisao_meteoro_nave
    pixel_inferior_direito:
        ADD R6,PROXIMO
        MOV R10,[R6]            ; largura nave
        DEC R10
        ADD R1,R10              ; coluna limite direito nave
        CALL verifica_colisao   ; verifica se houve colisao do pixel o meteoro
        CMP R3,OCORREU_COLISAO  ; ocorreu colisao?
        JZ colisao_meteoro_nave ; se nao vai para o proximo pixel, se sim vai para a colisao_meteoro_nave
    pixel_superior_direito:
        ADD R6,PROXIMO
        MOV R10,[R6]            ; altura nave
        DEC R10
        SUB R2,R10              ; linha limite superior nave
        CALL verifica_colisao   ; verifica se houve colisao do pixel o meteoro
        CMP R3,OCORREU_COLISAO  ; ocorreu colisao?
        JZ colisao_meteoro_nave ; se nao vai para o proximo pixel, se sim vai para a colisao_meteoro_nave
    pixel_superior_esquerdo:
        ADD R6,ANTERIOR
        MOV R10,[R6]            ; largura nave
        DEC R10
        SUB R1,R10              ; coluna limite esquerdo nave
        CALL verifica_colisao   ; verifica se houve colisao do pixel o meteoro
        CMP R3,OCORREU_COLISAO  ; ocorreu colisao?
        JNZ sair_colisoes_nave_meteoro ; se nao sai da funcao, se sim vai para a colisao_meteoro_nave
        colisao_meteoro_nave:
            MOV [MUDA_PIXEL_SCREEN],R0 ; muda a pixel screen para a do numero do meteoro
            MOV R10,APAGA
            MOV R9,NAO_EXPLOSAO
            CALL desenha_objeto        ; apaga o meteoro
            MOV R10,DESENHA
            MOV R9,EXPLOSAO            
            CALL desenha_objeto        ; desenha a explosao
            MOV R3,OCORREU_COLISAO
            obtem_tipo_meteoro:
                MOV R2,R4              ; definicao do meteoro
                ADD R2,TRIPLE_PROXIMO
                ADD R2,TRIPLE_PROXIMO
                MOV R7,[R2]            ; tipo do meteoro
                CMP R7,BOM
                JNZ meteoro_mau_colisao
            meteoro_bom_colisao:
            MOV R1,SOM_METEORO_BOM
            MOV [TOCA_SOM],R1
            MOV R1,10                  ; se colidir com um meteoro bom a energia aumenta por 10
            CALL muda_energia
            
            JMP sair_colisoes_nave_meteoro
            meteoro_mau_colisao:
            MOV R1,PERDIDO_COLISAO
            MOV [evento_perder_jogo],R1

    sair_colisoes_nave_meteoro:

    POP R10
    POP R9
    POP R7
    POP R6
    POP R5
    POP R4
    POP R2
    POP R1
    POP R0
RET

;****************************************************************************
; verifica_colisao - Verifica se houve colisao entre um objeto e um pixel   *
; Argumentos:                                                               * 
;           R4 - tabela de definicao do objeto                              *
;           R1 - coluna do pixel                                            * 
;           R2 - linha do pixel                                             *  
; Retorna:                                                                  *
;           R3 - variavel que informa se houve colisao ou nao               *
;****************************************************************************
verifica_colisao:
    PUSH R0
    PUSH R1
    PUSH R2
    PUSH R4
    PUSH R5

    MOV R0,R4   ; copia endereco objeto
    MOV R3,[R0] ; linha objeto
    CMP R2,R3   ; pixel dentro do limite inferior?
    JGT fim_verifica_colisao
    ADD R0,TRIPLE_PROXIMO
    MOV R5,[R0] ; altura objeto
    SUB R5,1    ; decrescimo de 1 na altura
    SUB R3,R5   ; linha maxima do objeto
    CMP R2,R3   ; pixel dentro do limite superior?
    JLT fim_verifica_colisao

    ADD R0,DOUBLE_ANTERIOR ; coluna objeto 

    MOV R2,[R0] ; coluna meteoro
    CMP R1,R2   ; pixel dentro do limite esquerdo?
    JLT fim_verifica_colisao
    MOV R5,R2   ; R5 - copia coluna meteoro
    ADD R0,PROXIMO
    MOV R3,[R0] ; altura meteoro
    SUB R3,1    ; decrescimo de 1 na altura   
    ADD R5,R3   ; coluna maxima do objeto 
    CMP R1,R5   ; pixel dentro do limite direito?
    JGT fim_verifica_colisao
    colisao_ocorrida:
        MOV R3,OCORREU_COLISAO
    fim_verifica_colisao:
    POP R5
    POP R4
    POP R2
    POP R1
    POP R0
RET


; *****************************************************************************************
;                                   Processo Modo Jogo                                    *
; Processo que e responsavel pela resposta a eventos de perder o jogo,                    *
; e por dar restart ao jogo                                                               *
; *****************************************************************************************
PROCESS SP_modo_jogo
processo_modo_jogo:
    MOV R1,[evento_perder_jogo]      ; esperar pelo evento de perder o jogo se ocorrer perder o jogo
    MOV [APAGA_ECRÃ],R1        
    MOV [SELECIONA_CENARIO_FUNDO],R1 ; seleciona cenario de fundo com respetiva derrota
    MOV [ESTADO_JOGO],R1             ; muda estado de jogo para a respetiva derrota 
    MOV R1,SOM_MORTE_MENU            ; obtem  a musica de jogo perdido
    MOV [TIRA_TODOS_SONS],R1         ; retira todos os sons atuais
    MOV [CICLO_SOM],R1               ; poe a musica de jogo perdido
    espera_restart:
        MOV R1,[tecla_carregada]     ; espera pela tecla start
        MOV R2,TECLA_START
        CMP R1,R2
        JNZ espera_restart
    CALL espera_comeca_jogo          ; se obteve a tecla recomeca o jogo
    CALL reseta_meteoros
    MOV R1,MAX_ENERGIA                 ; energia maxima 
    MOV [ENERGIA],R1                   ; reset no contador interno de energia
    MOV [DISPLAYS],R1                  ; reset no display 
    MOV R1,RESTART           
    CALL reseta_nave                 ; reseta a posicao da nave
    MOV [evento_jogar],R1            ; transmite aos outros processos a ordem de restart

    fim_processo_modo_jogo:
        JMP processo_modo_jogo



;****************************************************************************
; esta_interrompido - Verifica se o jogo esta interrompido e se nao estiver *
;                     e for suposto bloqueia o jogo                         *
; Retorna:                                                                  *
;           R3 - variavel que informa se veio proveniente da pausa ou se    *
;                da ordem de restart                                        *
;****************************************************************************
esta_interrompido:
    MOV R3,[ESTADO_JOGO]
    CMP R3,EM_JOGO            ; esta em jogo?
    JZ nao_interrompido       ; se sim continua, se nao bloqueia
    interrompe_jogo:
        MOV R3,[evento_jogar] ; bloqueia no lock
                              ; podendo receber em R3 modo pausa, ou ordem de restart
    nao_interrompido:
RET

;****************************************************************************
; testa_muda_estado_jogo_pausa -  Verifica se a tecla da pausa e premida    *
;                                 se for e o jogo estiver pausado despausa  *
;                                 se for e  estiver em jogo pausa           * 
; Retorna:                                                                  *
;           R0 - recebe a tecla premida                                     *
;****************************************************************************
testa_muda_estado_jogo_pausa:;ARGS: R0,tecla
    PUSH R0
    PUSH R1
    PUSH R3
    PUSH R4
    PUSH R9
    PUSH R10

    MOV R3,TECLA_PAUSA
    CMP R0,R3                           ; verifica se a tecla e a tecla PAUSA
    JNZ fim_testa_muda_estado_jogo_pausa; se nao for, sai da funcao
    MOV R1,[ESTADO_JOGO]                ; se for, obtem estado jogo
    CMP R1,EM_JOGO                      ; esta em jogo?
    JNZ fim_testa_muda_estado_jogo_pausa; se nao estiver sai da funcao

    MOV R1,PAUSADO
    MOV [ESTADO_JOGO],R1                ; muda o estado de jogo para pausado
    MOV [SELECIONA_CENARIO_FUNDO],R1    ; muda para o cenario de pausa
    MOV [APAGA_ECRÃ],R1                 ; apaga o ecra
    MOV R1,SOM_PAUSADO
    MOV [PAUSA_TODOS_SONS],R1           ; pausa o som do jogo 
    MOV [CICLO_SOM],R1                  ; muda o som para o som do menu de pausa
    jogo_pausa:
        MOV R1, [tecla_carregada]       ; bloqueia no lock ate ter tecla nova
        CMP R1, R3                      ; verifica se e a tecla PAUSA
        JNZ jogo_pausa                  ; se nao for volta a esperar por tecla, se for tira a pausa

        MOV R1,EM_JOGO                  
        MOV [ESTADO_JOGO],R1            ; muda o estado do jogo para em jogo
        MOV [SELECIONA_CENARIO_FUNDO],R1; muda o cenario de fundo para o background do jogo
        MOV R1,SOM_PAUSADO         
        MOV [TIRA_SOM_ESPECIFICO],R1    ; retira o som da pausa
        MOV [DESPAUSA_TODOS_SONS],R1    ; despausa o som do jogo

        MOV R4,DEF_NAVE                 
        MOV R10,NAVE
        MOV [MUDA_PIXEL_SCREEN],R10     ; muda para a pixel screen da nave
        MOV R10,DESENHA
        MOV R9,NAO_EXPLOSAO
        CALL desenha_objeto             ; desenha a nave
        MOV R1,PAUSA
        MOV [evento_jogar],R1           ; da ordem de jogar, e informa que e proveniente de uma pausa
    fim_testa_muda_estado_jogo_pausa:
    POP R10
    POP R9
    POP R4
    POP R3
    POP R1
    POP R0
RET

;****************************************************************************
; testa_estado_jogo_desistir - Verifica se a tecla de desistir e premida    *
;                              se for premida, perde o jogo                 *
; Retorna:                                                                  *
;           R0 - recebe a tecla premida                                     *
;****************************************************************************
testa_estado_jogo_desistir:
    PUSH R0
    PUSH R1
    MOV R1,TECLA_DESISTIR 
    CMP R0,R1                         ; verifica se e a tecla de desistir
    JNZ fim_testa_estado_jogo_desistir; se nao sai da funcao
    MOV R1,PERDIDO_DESISTIU           ; se sim da ordem de perder o jogo
    MOV [evento_perder_jogo],R1       ; comunica com o processo de modo de jogo
    fim_testa_estado_jogo_desistir:
    POP R1
    POP R0
RET
   
;****************************************************************************
; espera_comeca_jogo - Comeca o menu principal e espera que se              *
;                      clique na tecla de comecar o jogo                    *
;****************************************************************************
espera_comeca_jogo:
    PUSH R0
    PUSH R3
    MOV [TIRA_TODOS_SONS],R3
    MOV R1,0
    MOV [ENERGIA],R1                   ; reseta energia
    MOV [DISPLAYS],R1                  ; reseta displays
    MOV R1, POR_COMECAR             
    MOV [SELECIONA_CENARIO_FUNDO], R1  ; muda para cenario de fundo menu principal 
    MOV [ESTADO_JOGO], R1              ; muda o estado de Jogo para por comecar
    MOV R3,TECLA_START                 
    MOV R0,SOM_START_MENU
    MOV [CICLO_SOM],R0                 ; toca o som do menu principal
    espera_comeca_jogo_ciclo:
        MOV R0,[tecla_carregada]       ; bloqueia ate nova tecla
        CMP R0,R3                      ; verifica se e a tecla START
        JNZ espera_comeca_jogo_ciclo   ; se nao espera a proxima tecla
    comeca_jogo:
        MOV R3,SOM_BACKGROUND
        MOV [TIRA_TODOS_SONS],R3       ; retira o som do menu principal
        MOV [CICLO_SOM],R3             ; poe o som de jogar
        MOV R3,EM_JOGO                 ; muda o estado de jogo para em jogo
        MOV [ESTADO_JOGO],R3
        MOV [SELECIONA_CENARIO_FUNDO], R3  ; seleciona o cenario de fundo de jogar
    POP R3
    POP R0
RET


rot_int_energia:
    MOV [evento_energia],R0
RFE


;rotina de interrupcao que comunica quando o missil tem de avancar
rot_int_missil:
    MOV [evento_missil],R0
RFE


;rotina de interrupcao que comunica quando o meteoro tem de avancar
rot_int_meteoros:
    MOV [evento_meteoro],R0
RFE