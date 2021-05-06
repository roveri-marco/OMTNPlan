;; Enrico Scala (enricos83@gmail.com) and Miquel Ramirez (miquel.ramirez@gmail.com)
(define (problem instance_10)
  (:domain fn-counters)
  (:objects
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 - counter
  )

  (:init
    (= (max_int) 10)
        (= (value c0) 1)
        (= (value c1) 1)
        (= (value c2) 1)
        (= (value c3) 1)
        (= (value c4) 1)
        (= (value c5) 1)
        (= (value c6) 1)
        (= (value c7) 1)
        (= (value c8) 1)
        (= (value c9) 1)

        (= (rate_value c0) 1)
        (= (rate_value c1) 1)
        (= (rate_value c2) 1)
        (= (rate_value c3) 1)
        (= (rate_value c4) 1)
        (= (rate_value c5) 1)
        (= (rate_value c6) 1)
        (= (rate_value c7) 1)
        (= (rate_value c8) 1)
        (= (rate_value c9) 1)
  )

  (:goal (and
    (<= (+ (value c0) 1) (value c1))
    (<= (+ (value c1) 1) (value c2))
    (<= (+ (value c2) 1) (value c3))
    (<= (+ (value c3) 1) (value c4))
    (<= (+ (value c4) 1) (value c5))
    (<= (+ (value c5) 1) (value c6))
    (<= (+ (value c6) 1) (value c7))
    (<= (+ (value c7) 1) (value c8))
    (<= (+ (value c8) 1) (value c9))
    ))
  (:metric
   maximize (+
             (* (value c0) (value c1))
             ( + (* (value c1) (value c2))
		 ( + (* (value c2) (value c3))
		     ( + (* (value c3) (value c4))
			 ( + (* (value c4) (value c5))
			     ( + (* (value c5) (value c6))
				 ( + (* (value c6) (value c7))
				     ( + (* (value c7) (value c8))
					 (* (value c8) (value c9))))))))))
   )
)
