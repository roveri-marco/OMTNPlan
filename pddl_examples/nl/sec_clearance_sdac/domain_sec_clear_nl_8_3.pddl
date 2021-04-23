(define (domain security-clearance)

	(:requirements :strips :typing :negative-preconditions :fluents)

	(:predicates 
		(clear_d1_l1)
 		(clear_d1_l2)
 		(clear_d1_l3)
 		(clear_d2_l1)
 		(clear_d2_l2)
 		(clear_d2_l3)
 		(clear_d3_l1)
 		(clear_d3_l2)
 		(clear_d3_l3)
 		(clear_d4_l1)
 		(clear_d4_l2)
 		(clear_d4_l3)
 		(clear_d5_l1)
 		(clear_d5_l2)
 		(clear_d5_l3)
 		(clear_d6_l1)
 		(clear_d6_l2)
 		(clear_d6_l3)
 		(clear_d7_l1)
 		(clear_d7_l2)
 		(clear_d7_l3)
 		(clear_d8_l1)
 		(clear_d8_l2)
 		(clear_d8_l3)
	)

	(:functions 
		(cost_d1)
 		(cost_d2)
 		(cost_d3)
 		(cost_d4)
 		(cost_d5)
 		(cost_d6)
 		(cost_d7)
 		(cost_d8)
 		(priority_d1)
 		(priority_d2)
 		(priority_d3)
 		(priority_d4)
 		(priority_d5)
 		(priority_d6)
 		(priority_d7)
 		(priority_d8)
 		(high)
 		(low)
 		(factor)
 		(rate)
	)

	(:action increase_priority_d1
		:parameters ( )
		:precondition (and (< (priority_d1) (high)) )
		:effect (and (increase (priority_d1) (factor)) (increase (cost_d1) (* (priority_d1) (factor)) ))
	)

	(:action authorize_all_d1
		:parameters ( )
		:precondition (and (>= (priority_d1) (high)) (not (clear_d1_l1)) (not (clear_d1_l2)) (not (clear_d1_l3)) )
		:effect (and (clear_d1_l1) (clear_d1_l2) (clear_d1_l3) (increase (cost_d1) 3))
	)

	(:action authorize_d1_l1
		:parameters ( )
		:precondition (and (not (clear_d1_l1)))
		:effect (and (clear_d1_l1) (increase (cost_d1) 1))
	)

	(:action authorize_d1_l2
		:parameters ( )
		:precondition (and (not (clear_d1_l2)))
		:effect (and (clear_d1_l2) (not (clear_d1_l1)) (increase (cost_d1) 2))
	)

	(:action authorize_d1_l3
		:parameters ( )
		:precondition (and (not (clear_d1_l3)))
		:effect (and (clear_d1_l3) (not (clear_d1_l1)) (not (clear_d1_l2)) (increase (cost_d1) 3))
	)

	(:action increase_priority_d2
		:parameters ( )
		:precondition (and (< (priority_d2) (high)) )
		:effect (and (increase (priority_d2) (factor)) (increase (cost_d2) (* (priority_d2) (factor)) ))
	)

	(:action authorize_all_d2
		:parameters ( )
		:precondition (and (>= (priority_d2) (high)) (not (clear_d2_l1)) (not (clear_d2_l2)) (not (clear_d2_l3)) )
		:effect (and (clear_d2_l1) (clear_d2_l2) (clear_d2_l3) (increase (cost_d2) 3))
	)

	(:action authorize_d2_l1
		:parameters ( )
		:precondition (and (not (clear_d2_l1)))
		:effect (and (clear_d2_l1) (increase (cost_d2) 1))
	)

	(:action authorize_d2_l2
		:parameters ( )
		:precondition (and (not (clear_d2_l2)))
		:effect (and (clear_d2_l2) (not (clear_d2_l1)) (increase (cost_d2) 2))
	)

	(:action authorize_d2_l3
		:parameters ( )
		:precondition (and (not (clear_d2_l3)))
		:effect (and (clear_d2_l3) (not (clear_d2_l1)) (not (clear_d2_l2)) (increase (cost_d2) 3))
	)

	(:action increase_priority_d3
		:parameters ( )
		:precondition (and (< (priority_d3) (high)) )
		:effect (and (increase (priority_d3) (factor)) (increase (cost_d3) (* (priority_d3) (factor)) ))
	)

	(:action authorize_all_d3
		:parameters ( )
		:precondition (and (>= (priority_d3) (high)) (not (clear_d3_l1)) (not (clear_d3_l2)) (not (clear_d3_l3)) )
		:effect (and (clear_d3_l1) (clear_d3_l2) (clear_d3_l3) (increase (cost_d3) 3))
	)

	(:action authorize_d3_l1
		:parameters ( )
		:precondition (and (not (clear_d3_l1)))
		:effect (and (clear_d3_l1) (increase (cost_d3) 1))
	)

	(:action authorize_d3_l2
		:parameters ( )
		:precondition (and (not (clear_d3_l2)))
		:effect (and (clear_d3_l2) (not (clear_d3_l1)) (increase (cost_d3) 2))
	)

	(:action authorize_d3_l3
		:parameters ( )
		:precondition (and (not (clear_d3_l3)))
		:effect (and (clear_d3_l3) (not (clear_d3_l1)) (not (clear_d3_l2)) (increase (cost_d3) 3))
	)

	(:action increase_priority_d4
		:parameters ( )
		:precondition (and (< (priority_d4) (high)) )
		:effect (and (increase (priority_d4) (factor)) (increase (cost_d4) (* (priority_d4) (factor)) ))
	)

	(:action authorize_all_d4
		:parameters ( )
		:precondition (and (>= (priority_d4) (high)) (not (clear_d4_l1)) (not (clear_d4_l2)) (not (clear_d4_l3)) )
		:effect (and (clear_d4_l1) (clear_d4_l2) (clear_d4_l3) (increase (cost_d4) 3))
	)

	(:action authorize_d4_l1
		:parameters ( )
		:precondition (and (not (clear_d4_l1)))
		:effect (and (clear_d4_l1) (increase (cost_d4) 1))
	)

	(:action authorize_d4_l2
		:parameters ( )
		:precondition (and (not (clear_d4_l2)))
		:effect (and (clear_d4_l2) (not (clear_d4_l1)) (increase (cost_d4) 2))
	)

	(:action authorize_d4_l3
		:parameters ( )
		:precondition (and (not (clear_d4_l3)))
		:effect (and (clear_d4_l3) (not (clear_d4_l1)) (not (clear_d4_l2)) (increase (cost_d4) 3))
	)

	(:action increase_priority_d5
		:parameters ( )
		:precondition (and (< (priority_d5) (high)) )
		:effect (and (increase (priority_d5) (factor)) (increase (cost_d5) (* (priority_d5) (factor)) ))
	)

	(:action authorize_all_d5
		:parameters ( )
		:precondition (and (>= (priority_d5) (high)) (not (clear_d5_l1)) (not (clear_d5_l2)) (not (clear_d5_l3)) )
		:effect (and (clear_d5_l1) (clear_d5_l2) (clear_d5_l3) (increase (cost_d5) 3))
	)

	(:action authorize_d5_l1
		:parameters ( )
		:precondition (and (not (clear_d5_l1)))
		:effect (and (clear_d5_l1) (increase (cost_d5) 1))
	)

	(:action authorize_d5_l2
		:parameters ( )
		:precondition (and (not (clear_d5_l2)))
		:effect (and (clear_d5_l2) (not (clear_d5_l1)) (increase (cost_d5) 2))
	)

	(:action authorize_d5_l3
		:parameters ( )
		:precondition (and (not (clear_d5_l3)))
		:effect (and (clear_d5_l3) (not (clear_d5_l1)) (not (clear_d5_l2)) (increase (cost_d5) 3))
	)

	(:action increase_priority_d6
		:parameters ( )
		:precondition (and (< (priority_d6) (high)) )
		:effect (and (increase (priority_d6) (factor)) (increase (cost_d6) (* (priority_d6) (factor)) ))
	)

	(:action authorize_all_d6
		:parameters ( )
		:precondition (and (>= (priority_d6) (high)) (not (clear_d6_l1)) (not (clear_d6_l2)) (not (clear_d6_l3)) )
		:effect (and (clear_d6_l1) (clear_d6_l2) (clear_d6_l3) (increase (cost_d6) 3))
	)

	(:action authorize_d6_l1
		:parameters ( )
		:precondition (and (not (clear_d6_l1)))
		:effect (and (clear_d6_l1) (increase (cost_d6) 1))
	)

	(:action authorize_d6_l2
		:parameters ( )
		:precondition (and (not (clear_d6_l2)))
		:effect (and (clear_d6_l2) (not (clear_d6_l1)) (increase (cost_d6) 2))
	)

	(:action authorize_d6_l3
		:parameters ( )
		:precondition (and (not (clear_d6_l3)))
		:effect (and (clear_d6_l3) (not (clear_d6_l1)) (not (clear_d6_l2)) (increase (cost_d6) 3))
	)

	(:action increase_priority_d7
		:parameters ( )
		:precondition (and (< (priority_d7) (high)) )
		:effect (and (increase (priority_d7) (factor)) (increase (cost_d7) (* (priority_d7) (factor)) ))
	)

	(:action authorize_all_d7
		:parameters ( )
		:precondition (and (>= (priority_d7) (high)) (not (clear_d7_l1)) (not (clear_d7_l2)) (not (clear_d7_l3)) )
		:effect (and (clear_d7_l1) (clear_d7_l2) (clear_d7_l3) (increase (cost_d7) 3))
	)

	(:action authorize_d7_l1
		:parameters ( )
		:precondition (and (not (clear_d7_l1)))
		:effect (and (clear_d7_l1) (increase (cost_d7) 1))
	)

	(:action authorize_d7_l2
		:parameters ( )
		:precondition (and (not (clear_d7_l2)))
		:effect (and (clear_d7_l2) (not (clear_d7_l1)) (increase (cost_d7) 2))
	)

	(:action authorize_d7_l3
		:parameters ( )
		:precondition (and (not (clear_d7_l3)))
		:effect (and (clear_d7_l3) (not (clear_d7_l1)) (not (clear_d7_l2)) (increase (cost_d7) 3))
	)

	(:action increase_priority_d8
		:parameters ( )
		:precondition (and (< (priority_d8) (high)) )
		:effect (and (increase (priority_d8) (factor)) (increase (cost_d8) (* (priority_d8) (factor)) ))
	)

	(:action authorize_all_d8
		:parameters ( )
		:precondition (and (>= (priority_d8) (high)) (not (clear_d8_l1)) (not (clear_d8_l2)) (not (clear_d8_l3)) )
		:effect (and (clear_d8_l1) (clear_d8_l2) (clear_d8_l3) (increase (cost_d8) 3))
	)

	(:action authorize_d8_l1
		:parameters ( )
		:precondition (and (not (clear_d8_l1)))
		:effect (and (clear_d8_l1) (increase (cost_d8) 1))
	)

	(:action authorize_d8_l2
		:parameters ( )
		:precondition (and (not (clear_d8_l2)))
		:effect (and (clear_d8_l2) (not (clear_d8_l1)) (increase (cost_d8) 2))
	)

	(:action authorize_d8_l3
		:parameters ( )
		:precondition (and (not (clear_d8_l3)))
		:effect (and (clear_d8_l3) (not (clear_d8_l1)) (not (clear_d8_l2)) (increase (cost_d8) 3))
	)

	(:action increase_factor
		:parameters ( )
		:precondition (and (<= (factor) 10))
		:effect (and (increase (factor) (* (factor) (rate)))))

	(:action decrease_factor
		:parameters ( )
		:precondition (and (>= (factor) 1))
		:effect (and (decrease (factor) (* (factor) (rate)))))

)