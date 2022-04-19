(defglobal ?*numero* = 35)

(assert (numero_hallado falso))
(assert (intento 101))  ;hecho incial
(assert (evaluar falso))

(defrule ingresar_intento
    (numero_hallado falso)
    ?eval <- (evaluar falso)
    ?int <- (intento ?)
    =>
    (printout t "Adivine el numero (1-100):" crlf)
    (retract ?int)
    (assert (intento (read)))
    (retract ?eval)
    (assert (evaluar verdadero))
)

(defrule evaluar
    ?eval <- (evaluar verdadero)
    ?hallado <- (numero_hallado falso)
    (intento ?num)
    =>
    (if (= ?*numero* (integer ?num)) then
        (retract ?hallado)
        (assert(numero_hallado verdadero))
    )
    (if (> ?*numero* (integer ?num)) then
        (printout t "El numero ingresado es menor" crlf)
    )
    (if (< ?*numero* (integer ?num)) then
        (printout t "El numero ingresado es mayor" crlf)
    )
    (retract ?eval)
    (assert (evaluar falso))
)

(defrule es_igual
    (numero_hallado verdadero)
    =>
    (printout t "Felicidades, adivino el numero!" crlf)
    (undefglobal ?*numero*)
)