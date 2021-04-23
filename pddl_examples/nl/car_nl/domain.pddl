(define
  (domain car_nonlinear_mt_sc)
  (:predicates
   (engine_running)
   (engine_stopped)
   )

  (:functions
   (t)
   (d)
   (v)
   (a)
   (drag_coefficient)
   (max_acceleration)
   (min_acceleration)
   (max_speed)
   )

  (:action draginc
	   :parameters ()
	   :precondition (and (>= (drag_coefficient) 0))
	   :effect (scale-up (drag_coefficient) 0.5))

  (:action dragdec
	   :parameters ()
	   :precondition (and (>= (drag_coefficient) 0))
	   :effect (scale-down (drag_coefficient) 0.4))

  (:action accelerate
	   :parameters ()
	   :precondition (and (< (a) (max_acceleration)) (engine_running) (>= (v) (* -1 (max_speed))) (<= (v) (max_speed)) )
	   :effect (and
		    (increase (a) 0.5) ;;
		    (increase (v) (- (* (+ (a) 0.5) (t)) (* (t) (* (* (v) (v)) (drag_coefficient)))))
		    (increase (d) (* (t) (v))))
	   )

  (:action stop_car
	   :parameters ()
	   :precondition (and (> (v) -0.1) (< (v) 0.1) (= (a) 0.0) (engine_running))
	   :effect (and
		    (assign (v) 0.0)
		    (engine_stopped)
		    (not (engine_running))
		    )

	   )

  (:action move
	   :parameters ()
	   :precondition (and (not (= (v) 0)) (not (= (a) 0.0)) (engine_running))
	   :effect (and (increase (d) (* (t) (v))) )

	   )

  (:action start_car
	   :parameters ()
	   :precondition (engine_stopped)
	   :effect (and
                    (engine_running)
                    (not (engine_stopped))
		    )
	   )

  (:action decelerate
	   :parameters ()
	   :precondition (and (> (a) (min_acceleration)) (engine_running) (>= (v) (* -1 (max_speed))) (<= (v) (max_speed)))
	   :effect (and (decrease (a) 0.5) ;;
			(increase (v) (- (* (- (a) 0.5) (t)) (* (t) (* (* (v) (v)) (drag_coefficient)))))
			(increase (d) (* (t) (v))))
	   )

  )
