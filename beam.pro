/*expandeFilhos(+Nodo, +Lista, -ListaR) - Expande os filhos do Nodo, colocando-os na Lista, gerando assim, a ListaR*/
expandeFilhos(Nodo, Lista, ListaR) :-
	geraJogadas(Nodo,F1,F2,F3,F4),
	
	valorTabuleiro(F1,VF1),
	valorTabuleiro(F2,VF2),
	valorTabuleiro(F3,VF3),
	valorTabuleiro(F4,VF4),
	
	append(F1,[VF1],S1),
	append(F2,[VF2],S2),
	append(F3,[VF3],S3),
	append(F4,[VF4],S4),
	
	concatSol([S1],[S2],Fs1),
	concatSol(Fs1,[S3],Fs2),
	concatSol(Fs2,[S4],Fs3),
	concatSol(Lista,Fs3,ListaRD),
	
	ordena(ListaRD,ListaRC),
	cortaSolucoes(ListaRC,ListaR).

/*concatSol(+Solu��o1, +Solu��o2, -Resultado) - Concatena a Solu��o1 com a Solu��o2, produzindo uma lista em Resultado*/
concatSol(S1,S2,R) :-
	S1 \== [[-1]] ->
	(
	 S2 \== [[-1]] -> append(S1,S2,R) ;
	 R = S1
	) ;
	(
	 S2 \== [[-1]] -> R = S2 ;
	 R = [[-1]]
	).

/*cortaSolucoes(+Lista, -ListaR) - Elima parte das solu��es em Lista, gerando a ListaR*/
cortaSolucoes(Lista, ListaR) :- cortaSolucoes(Lista,ListaR,8).
cortaSolucoes(_,[],0).
cortaSolucoes([],[],X) :- X > 0.
cortaSolucoes([H|L],[H|L1],X) :- X > 0, Y is X-1, cortaSolucoes(L,L1,Y).

/* valor(+Tabuleiro, -Valor) - Retorna o Valor de um Tabuleiro */
valor([_,_,_,_,Valor],Valor).