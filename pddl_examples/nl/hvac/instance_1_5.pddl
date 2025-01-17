(define
  (problem instance_1_5)
  (:domain hvac)
  (:objects r1 - room k1 k2 k3 k4 k5 - request)
  (:init
   (= (t) 0.5)
   (= (time_requested r1 k1) 10)
   (= (temp_requested r1 k1) 20)

   (= (time_requested r1 k2) 20)
   (= (temp_requested r1 k2) 14)

   (= (time_requested r1 k3) 30)
   (= (temp_requested r1 k3) 20)

   (= (time_requested r1 k4) 40)
   (= (temp_requested r1 k4) 14)

   (= (time_requested r1 k5) 50)
   (= (temp_requested r1 k5) 20)


   (= (temp r1) 15)
   (= (air_flow r1) 0)
   (= (temp_sa r1) 10)



   (= (time) 0)
   (= (comfort) 2)


   )
  ;; the goal encodes the horizon of control.
  (:goal
   (and  (satisfied k1)(satisfied k2)(satisfied k3)(satisfied k4)(satisfied k5))
   )
  (:metric
   maximize (+ (- 48 (time)) (* (- (time) (temp r1)) (* (time) (temp r1))))
   )
  )
