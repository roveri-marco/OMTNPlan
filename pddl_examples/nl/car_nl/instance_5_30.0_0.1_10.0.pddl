
(define (problem instance_5_300_01_100)
  (:domain car_nonlinear_mt_sc)
  (:objects

   )

  (:init
   (= (d) 0.0)
   (= (v) 0.0)
   (engine_stopped)
   (= (t) 0.5)
   (= (a) 0.0)
   (= (max_acceleration) 5)
   (= (min_acceleration) -5)
   (= (drag_coefficient) 0.1)
   (= (max_speed) 10.0)
   )

  (:goal
   (and
    (>= (d) 29.5 )
    (<= (d) 30.5 )
    (engine_stopped)
    )
   )
  (:metric
   minimize (+ (d) (+ (* (v) (v)) (+ (* (* (a) (v)) (d)) (* (d) (* (v) (* (a) (* (d) 0.5)))))))
  )
  )
