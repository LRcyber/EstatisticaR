# UESC
# Ciência da Computação
# Disciplina: Probabilidade e Estatística 2016.1
# Aluno: Álvaro Maciel
# Melhorado: 09/10/2021 20:51:46
# Professor: José Claudio Faria


#. Amostragem aleatória simples
# Num jogo de loteria como a Lotofácil, a população equivale a 25 elementos enumerados de 01 a 25,
# onde o jogador deve escolher os 15 números que ele supõe que representam a possível amostra a ser sorteada.
# O sorteio acontece de forma que dentre os 25, um número por vez é sorteado até que o tamanho da amostra
# (15 números) seja atingido.

N_pop <- 200


n_amo <- 100

# Vetor que apresenta os 25 elementos da cartela
(cartela <- 1:N_pop)

# Vetor com os 15 números sorteados (sem reposição)
set.seed(2021)
amo_s <- sample(cartela,
                n_amo)
amo_s
sort(amo_s)
table(amo_s)
    
# Vetor com os 15 números sorteados (com reposição)
set.seed(2021)
amo_c <- sample(N_pop,
                n_amo,
                replace=TRUE)
sort(amo_c)
table(amo_c)
