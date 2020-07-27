NB. genetic algorithm 
NB. needs pga class
NB. define a dummy target to measure fitness against
load 'pga.ijs'

targetvalue =:  500  

fitness=: 3 : 0
object=. y
1000 * %(targetvalue - perform__object '')
top =: 4 : '(i.y) { \: (fitness each x)'  NB. pop top 10 returns the 10 fittest
pair=: 3 : 0  NB. pick two random ga objects, mate them, and return the child
pop=. y
mom=. > (?#pop) { pop NB. must unbox!
dad=. > (?#pop) { pop NB.  # is length of boxed list
matewith__mom dad
)

NB.  pop evolve generations returns the fittest ga after 
NB. sifting the top 25 ga's
evolve=: 4 : 0
pop=. x
n=. y
for_k. i.n do.
kpop=.  3 : 'pop' NB. not sure if necessary to do here
newgen=.  (pair@kpop) each i.100  NB. create 100 children
best=.  (newgen top 25) { newgen NB. find the indices of the best, then select the corresponding objects
pop=. best,best,best,best  NB. not really necessary?
end.
>0{best  NB. return best
)

NB. usage  
average =: +/%#
pop=: conew&'pga' each i.100   NB. create 100 boxed ga objects
fitness each pop  NB. should show a boxed list of fitness values
average ; fitness each pop  NB. shows average fitness

fred=: pop evolve 100
fitness fred
uberfred=: pop evolve 1000

NB. the fitness values increase pretty slowly which is disappointing
NB. probably needs some mutation :)
