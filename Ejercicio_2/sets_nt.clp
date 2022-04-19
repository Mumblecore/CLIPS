;; (batch "sets_nt.bat")

(deffacts conjuntos
    (conjunto1 A)
    (conjunto1 B)
    (conjunto1 C)
    (conjunto1 D)

    (conjunto2 C)
    (conjunto2 D)
    (conjunto2 E)

    (conjuntoint)
    (conjuntouni)
)

(defrule union
    (or (conjunto1 ?elem) (conjunto2 ?elem))
    ?anterior <- (conjuntouni $?elems)
    (not(conjuntouni $? ?elem $?))
    =>
    (retract ?anterior)
    (assert (conjuntouni $?elems ?elem))
)

(defrule interseccion
    (and (conjunto1 ?elem) (conjunto2 ?elem))
    ?anterior <- (conjuntoint $?elems)
    (not(conjuntoint $? ?elem $?))
    =>
    (retract ?anterior)
    (assert (conjuntoint $?elems ?elem))
)

(defrule imprimir_union
    (declare (salience -1))
    (conjuntouni $?elems)
    =>
    (printout t "Union: " $?elems crlf)
)

(defrule imprimir_interseccion
    (declare (salience -2))
    (conjuntoint $?elems)
    =>
    (printout t "Interseccion: " $?elems crlf)
)