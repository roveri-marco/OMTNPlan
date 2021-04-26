(define (problem security-clearance-5-5)

	(:domain security-clearance)

	(:init
 		(not (clear_d1_l1) )
 		(not (clear_d1_l2) )
 		(not (clear_d1_l3) )
 		(not (clear_d1_l4) )
 		(not (clear_d1_l5) )
 		(not (clear_d2_l1) )
 		(not (clear_d2_l2) )
 		(not (clear_d2_l3) )
 		(not (clear_d2_l4) )
 		(not (clear_d2_l5) )
 		(not (clear_d3_l1) )
 		(not (clear_d3_l2) )
 		(not (clear_d3_l3) )
 		(not (clear_d3_l4) )
 		(not (clear_d3_l5) )
 		(not (clear_d4_l1) )
 		(not (clear_d4_l2) )
 		(not (clear_d4_l3) )
 		(not (clear_d4_l4) )
 		(not (clear_d4_l5) )
 		(not (clear_d5_l1) )
 		(not (clear_d5_l2) )
 		(not (clear_d5_l3) )
 		(not (clear_d5_l4) )
 		(not (clear_d5_l5) )
		(= (high) 3)
 		(= (low) 1)
 		(= (factor) 1)
 		(= (rate) 0.5)
 		(= (cost_d1) 0)
 		(= (priority_d1) 1)
 		(= (cost_d2) 0)
 		(= (priority_d2) 1)
 		(= (cost_d3) 0)
 		(= (priority_d3) 1)
 		(= (cost_d4) 0)
 		(= (priority_d4) 1)
 		(= (cost_d5) 0)
 		(= (priority_d5) 1)
	)

	(:goal (and
 		(clear_d1_l1 )
 		(clear_d1_l2 )
 		(clear_d1_l3 )
 		(clear_d1_l4 )
 		(clear_d1_l5 )
 		(clear_d2_l1 )
 		(clear_d2_l2 )
 		(clear_d2_l3 )
 		(clear_d2_l4 )
 		(clear_d2_l5 )
 		(clear_d3_l1 )
 		(clear_d3_l2 )
 		(clear_d3_l3 )
 		(clear_d3_l4 )
 		(clear_d3_l5 )
 		(clear_d4_l1 )
 		(clear_d4_l2 )
 		(clear_d4_l3 )
 		(clear_d4_l4 )
 		(clear_d4_l5 )
 		(clear_d5_l1 )
 		(clear_d5_l2 )
 		(clear_d5_l3 )
 		(clear_d5_l4 )
 		(clear_d5_l5 ))
	)

	(:metric minimize (+ (* (factor) (cost_d2)) (+ (* (factor) (cost_d3)) (+ (* (factor) (cost_d4)) (+ (* (factor) (cost_d5))  (* (factor) (cost_d1)))))))

)