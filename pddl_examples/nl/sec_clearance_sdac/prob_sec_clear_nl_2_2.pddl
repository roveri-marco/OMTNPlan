(define (problem security-clearance-2-2)

	(:domain security-clearance)

	(:init
 		(not (clear_d1_l1) )
 		(not (clear_d1_l2) )
 		(not (clear_d2_l1) )
 		(not (clear_d2_l2) )
		(= (cost_d1) 0)
 		(= (priority_d1) 1)
 		(= (high) 3)
 		(= (low) 1)
 		(= (factor) 1)
 		(= (rate) 0.5)
 		(= (cost_d2) 0)
 		(= (priority_d2) 1)
 		(= (high) 3)
 		(= (low) 1)
 		(= (factor) 1)
 		(= (rate) 0.5)
	)

	(:goal (and
 		(clear_d1_l1 )
 		(clear_d1_l2 )
 		(clear_d2_l1 )
 		(clear_d2_l2 ))
	)

	(:metric minimize (+ (* (factor) (cost_d2))  (* (factor) (cost_d1))))

)