(define
  (problem instance_1_3)
  (:domain hvac)
  (:objects r1 - room k1 k2 k3 - request)
  (:init
   (= (t) 0.5)
   (= (time_requested r1 k1) 10)
   (= (temp_requested r1 k1) 20)

   (= (time_requested r1 k2) 20)
   (= (temp_requested r1 k2) 14)

   (= (time_requested r1 k3) 30)
   (= (temp_requested r1 k3) 20)

   (= (temp r1) 15)
   (= (air_flow r1) 0)
   (= (temp_sa r1) 10)



   (= (time) 0)
   (= (comfort) 2)


   )
  ;; the goal encodes the horizon of control.
  (:goal
   (and  (satisfied k1)(satisfied k2)(satisfied k3))
   )
  (:metric
   maximize (+ (- 48 (time)) (* (- (time) (temp r1)) (* (time) (temp r1))))
   )
  )
