;; Enrico Scala (enricos83@gmail.com) and Miquel Ramirez (miquel.ramirez@gmail.com)
(define (problem instance_2)
  (:domain fn-counters)
  (:objects
    c0 c1 - counter
  )

  (:init
    (= (max_int) 4)
        (= (value c0) 1)
        (= (value c1) 1)
        (= (rate_value c0) 1)
        (= (rate_value c1) 1)
  )

  (:goal (and
    (<= (+ (value c0) 1) (value c1))
  ))
  (:metric
   maximize (* (value c0) (value c1))
   )
)
