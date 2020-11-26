(deftemplate number
         (slot number))

(defrule div2
         (number (number ?n1)) 
	(test (or (= (mod ?n1 10) 0)
		(= (mod ?n1 10) 2)
		(= (mod ?n1 10) 4)
		(= (mod ?n1 10) 6)
		(= (mod ?n1 10) 8)))
         =>
	(printout t "Es divisible entre 2" crlf))


(defrule div5
         (number (number ?n1)) 
	(test (or (= (mod ?n1 10) 0)
		(= (mod ?n1 10) 5)))
         =>
	(printout t "Es divisible entre 5" crlf))