
(define (problem instance_1_300_01_100)
  (:domain car_nonlinear_mt_sc)
  (:objects

   )

  (:init
   (= (d) 0.0)
   (= (v) 0.0)
   (= (t) 0.5)
   (engine_stopped)
   (= (a) 0.0)
   (= (max_acceleration) 1)
   (= (min_acceleration) -1)
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