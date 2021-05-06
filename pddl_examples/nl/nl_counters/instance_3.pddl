;; Enrico Scala (enricos83@gmail.com) and Miquel Ramirez (miquel.ramirez@gmail.com)
(define (problem instance_3)
  (:domain fn-counters)
  (:objects
    c0 c1 c2 - counter
  )

  (:init
    (= (max_int) 6)
        (= (value c0) 1)
        (= (value c1) 1)
        (= (value c2) 1)

        (= (rate_value c0) 1)
        (= (rate_value c1) 1)
        (= (rate_value c2) 1)
  )

  (:goal (and
    (<= (+ (value c0) 1) (value c1))
    (<= (+ (value c1) 1) (value c2))
  ))
  (:metric
   maximize (+
             (* (value c0) (value c1))
             (* (value c1) (value c2)))
   )
)
