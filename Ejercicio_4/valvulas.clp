(assert (contador 0))
(assert (numero_valvulas 7))

(defrule leer_fichero
    (contador ?cnt)
    =>
    (open temperaturas.dat fichero)
    (while (< ?cnt 7) do
        (assert (valvula (read fichero) (read fichero)))
        (bind ?cnt (+ 1 ?cnt))
    )
    (close fichero)
)

(defrule escrbir_estado
    (valvula ?nombre ?temp)
    =>
    (open alarmas.out fichero "a+")
    (if (> ?temp 95) then
        (printout fichero ?nombre ": Peligrosa" crlf)
    else
        (printout fichero ?nombre ": Normal" crlf)
    )
    (close fichero)
)