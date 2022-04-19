(assert (final_encontrado falso))

(open datos.txt fichero)

(defrule leer_fichero
    ?id <- (final_encontrado falso)
    =>
    (bind ?nombre (read fichero))
    (while (neq ?nombre EOF) do
        (assert (persona ?nombre (read fichero) (read fichero)))
        (bind ?nombre (read fichero))
    )
    (retract ?id)
    (assert (final_encontrado verdadero))
)

(defrule fichero_leido
    (final_encontrado verdadero)
    =>
    (close fichero)
)