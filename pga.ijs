coclass'pga'

create=:3 : 0
genes=: ? 4 $ 100  NB. 4 random integers 0-99
)

getgenes =: 3 : 'genes'

setgenes =: 3 : 'genes=:y'

matewith=: 3 : 0
other=. y
mine=. ((#genes) % 2) ? (#genes) NB. crossover
childgene=. getgenes__other '' NB. copy others intially
child=. conew 'pga'
setgenes__child ((mine { genes) (mine }) childgene)
child
)

perform =: 3 : 0 NB. dummy problem
+/ genes
)

destroy=:codestroy
