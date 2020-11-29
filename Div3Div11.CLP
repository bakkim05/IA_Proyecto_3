(deftemplate number
         (slot number))

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
	             (printout t "Es divisible entre 3" crlf)))

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
		  (printout t "Es divisible entre 11" crlf)))