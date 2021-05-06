;; Enrico Scala (enricos83@gmail.com) and Miquel Ramirez (miquel.ramirez@gmail.com)
(define (problem instance_4)
  (:domain fn-counters-simp)
  (:objects
    c0 c1 c2 c3 - counter
  )

  (:init
    (= (max_int) 8)
        (= (value c0) 1)
        (= (value c1) 1)
        (= (value c2) 1)
        (= (value c3) 1)

        (= (rate_value c0) 1)
        (= (rate_value c1) 1)
        (= (rate_value c2) 1)
        (= (rate_value c3) 1)
  )

  (:goal (and
    (<= (+ (value c0) 1) (value c1))
    (<= (+ (value c1) 1) (value c2))
    (<= (+ (value c2) 1) (value c3))
  ))
  (:metric
   maximize (+
             (* (value c0) (value c1))
             ( + (* (value c1) (value c2))
		 (* (value c2) (value c3))))
   )
)
