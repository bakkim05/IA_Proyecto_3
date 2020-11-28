(deftemplate number
         (slot number))

(defrule div7
         (number (number ?n1))
	
	=>
   	(while (> ?n1 0)
		(bind ?n1 (- (div ?n1 10)(* (mod ?n1 10) 2))))
	
	(if (or (= ?n1 -7)
		(= ?n1 0)
		(= ?n1 7))
		
		then
		     (printout t "Es divisible entre 7" crlf)))

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
		     (printout t "Es divisible entre 13" crlf)))