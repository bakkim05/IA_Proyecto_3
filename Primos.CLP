(deftemplate number
    (slot number))


(defglobal ?*primos* = 0)

(defglobal ?*ingresa* = 0)


(deffacts start
  (get-next-input))


(defrule div2
    (number (number ?n1)) 
	(test (or (= (mod ?n1 10) 0)
		(= (mod ?n1 10) 2)
		(= (mod ?n1 10) 4)
		(= (mod ?n1 10) 6)
		(= (mod ?n1 10) 8)))
	=>
	(bind ?*primos* 1)
	(printout t "Es divisible entre 2" crlf))


(defrule div3 
	(number (number ?n1))
	
	=>
	(bind ?x ?n1)
	(while (> ?x 9)
		(bind ?x 0)
		(while (> ?n1 0)
			(bind ?x (+ ?x (mod ?n1 10)))
			(bind ?n1 (div ?n1 10)))
		(bind ?n1 ?x))

	(if (or (= ?x 3)
		(= ?x 6)
		(= ?x 9))
		
		then
			(bind ?*primos* 1)
	        (printout t "Es divisible entre 3" crlf)))
			

(defrule div5
    (number (number ?n1)) 
	(test (or 
		(= (mod ?n1 10) 0)
		(= (mod ?n1 10) 5)))
    
	 =>
	(bind ?*primos* 1)
	(printout t "Es divisible entre 5" crlf))


(defrule div7
    (number (number ?n1))
	
	=>
	(bind ?x ?n1)
   	(while (> (abs ?x) 7)
		(bind ?x 0)
		(while (> (abs ?n1) 7)
			(bind ?x (- (div ?n1 10)(* (mod ?n1 10) 2)))
			(bind ?n1 ?x)))
	
	(if (or (= ?n1 -7)
		(= ?n1 0)
		(= ?n1 7))

		then
			(bind ?*primos* 1)
		    (printout t "Es divisible entre 7" crlf)))


(defrule div11 
	(number (number ?n1))

	=>
	(bind ?eve 0)
	(bind ?odd 0)
	(bind ?len (str-length (str-cat "" ?n1)))
	(while (> ?n1 0)
		(if (evenp (integer ?len))
   		    then
				(bind ?eve (+ ?eve (mod ?n1 10)))
			 	(bind ?n1 (div ?n1 10))
		    else
			 	(bind ?odd (+ ?odd (mod ?n1 10)))
			 	(bind ?n1 (div ?n1 10)))
		(bind ?len (str-length (str-cat "" ?n1))))
	(if (= (- ?eve ?odd) 0)
	    then
			(bind ?*primos* 1)
		  	(printout t "Es divisible entre 11" crlf)))


(defrule div13
	(number (number ?n1))
	
	=>
   	(while (> ?n1 0)
		(bind ?n1 (- (div ?n1 10)(* (mod ?n1 10) 9))))
	
	(if (or (= (abs ?n1) 0)
		(= (abs ?n1) 13)
		(= (abs ?n1) 26)
		(= (abs ?n1) 39)
		(= (abs ?n1) 52)
		(= (abs ?n1) 65)
		(= (abs ?n1) 78))
	    	
		then
			(bind ?*primos* 1)
		    (printout t "Es divisible entre 13" crlf)))


(defrule primo
	(number(number  ?n1))

	=>
	(if (and
			(< ?n1 17)
			(= ?*primos* 0))
		then
			(if (or 
				(= ?n1 1)
				(= ?n1 3)
				(= ?n1 5)
				(= ?n1 7)
				(= ?n1 11)
				(= ?n1 13))
				then
					(printout t "Es primo" crlf)
				else
					(printout t "No es primo" crlf))
		else
			(if	(= ?*primos* 1)
				then
					(printout t "No es primo" crlf)
				else
					(printout t "No hay suficiente información para saber si es primo" crlf))))

