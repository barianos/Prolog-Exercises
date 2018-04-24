replace_var_args(Term,_,_) :- %%values is a list,
  ground(Term). %if term is a grounded term there is nothing more to do

replace_var_args(Term,[H|T],NewTerm) :- %%values is a list,
  \+ground(Term),   %%if Term is not a grounded term it has variables
  variables(Term,Var),  %%find the variables in the term
  replace_var_args2(Term,[H|T],Var,NewTerm).  %%replace the variables


replace_var_args2(Term,_,_,_):-
  ground(Term).    %if term is a grounded term there is nothing more to do

replace_var_args2(_,[],[],_).%:-
  %write('done').


replace_var_args2(Term,[H|T],[Var1|Var2],NewTerm):-
  \+ground(Term), %%continue only if Term is not grounded
  substitute1(Var1,Term,H,TempTerm), %%substitute the first variable with
                                     %%the first value
  replace_var_args2(TempTerm,T,Var2,NewTerm). %%recursively to the same until
                                              %%done


%% predicate found online
%% https://stackoverflow.com/questions/43840503/how-to-get-list-of-atom-variables-from-a-term-in-prolog
variables(T,V):- %predicate to give us the variables within the Term
    variables(T,[],V1),
    sort(V1,V).

variables(T,Acc,[T|V]):-
    var(T), !,
    variables(Acc,[],V).
variables([],[],[]).
variables([],Acc,V):-
    variables(Acc,[],V).
variables([H|T],Acc,V):-
    append(T,Acc,NewAcc),
    variables(H,NewAcc,V).
variables(T,Acc,V):-
    atom(T),
    variables(Acc,[],V).
variables(T,Acc,V):-
    T=.. [_F|AL],
    variables(AL,Acc,V).




/* Substitute predicate as described in the book "Prolog:programatismos se
logiki gia texniti noimosini" */
substitute1(Old,New,Term,New):-
  atomic(Term),
  Term = Old.
sustitute1(Old,New,Term,Term):-
  var(Term).
substitute1(Old,New,Term,Term):-
  nonvar(Term),
  atomic(Term),
  Term \== Old.
substitute1(Old,New,Term,Term1):-
  \+atomic(Term),
  functor(Term,F,N),
  functor(Term1,F,N),
  substitute2(N,Old,New,Term,Term1).


substitute2(0,Old,New,Term,Term1).
substitute2(N,Old,New,Term,Term1):-
  N>0,
  arg(N,Term,Arg),
  substitute1(Old,New,Arg,Arg1),
  arg(N,Term1,Arg1),
  N1 is N-1,
  substitute2(N1,Old,New,Term,Term1).
