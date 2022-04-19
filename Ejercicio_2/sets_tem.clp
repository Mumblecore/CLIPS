(deftemplate conjunto
    (slot nombre)
    (multislot elementos)
)

(deffacts conjuntos
    (conjunto (nombre conjunto1) (elementos A B C D))
    (conjunto (nombre conjunto2) (elementos C D E))
    (conjunto (nombre conjuntoint) (elementos ))
    (conjunto (nombre conjuntouni) (elementos ))
)

(defrule union
    (or
        (conjunto (nombre conjunto1) (elementos $? ?elem $?))
        (conjunto (nombre conjunto2) (elementos $? ?elem $?))
    )
    ?anterior <- (conjunto (nombre conjuntouni) (elementos $?elems))
    (not(conjunto (nombre conjuntouni) (elementos $? ?elem $?)))
    =>
    (modify ?anterior (elementos $?elems ?elem))
)

(defrule interseccion
    (and
        (conjunto (nombre conjunto1) (elementos $? ?elem $?))
        (conjunto (nombre conjunto2) (elementos $? ?elem $?))
    )
    ?anterior <- (conjunto (nombre conjuntoint) (elementos $?elems))
    (not(conjunto (nombre conjuntoint) (elementos $? ?elem $?)))
    =>
    (modify ?anterior (elementos $?elems ?elem))
)

(defrule imprimir_union
    (declare (salience -1))
    (conjunto (nombre conjuntouni) (elementos $?elems))
    =>
    (printout t "Union: " $?elems crlf)
)

(defrule imprimir_interseccion
    (declare (salience -2))
    (conjunto (nombre conjuntoint) (elementos $?elems))
    =>
    (printout t "Interseccion: " $?elems crlf)
)