;; Enrico Scala (enricos83@gmail.com)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; counters-ineq-rnd domain, functional strips version
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; This domain describes a set of counters that can be increased and
;;; decreased. The rate of such counter is however variable and both
;;; the dynamics of the counters and of the rates are non-linear!

(define (domain fn-counters-simp)
    (:requirements :strips  :adl :fluents)
    (:types counter)

    (:functions
        (value ?c - counter);; - int  ;; The value shown in counter ?c
        (rate_value ?c - counter);;
        (max_int);; -  int ;; The maximum integer we consider - a static value
    )


    ;; Increment the value in the given counter by one
    (:action increment
         :parameters (?c - counter)
         :precondition (and (<= (+ (value ?c) (rate_value ?c)) (max_int)))
         :effect (and (increase (value ?c) (rate_value ?c)))
    )
    ;; Decrement the value in the given counter by one
    (:action decrement
         :parameters (?c - counter)
         :precondition (and (>= (- (value ?c) (rate_value ?c)) 0))
         :effect (and (decrease (value ?c) (rate_value ?c)))
    )

    (:action increase_rate
         :parameters (?c - counter)
         :precondition (and (<= (+ (rate_value ?c) 1) 10))
         :effect (and (assign (rate_value ?c) (+ (rate_value ?c) (* (rate_value ?c) 0.5))))
    )

    (:action decrement_rate
         :parameters (?c - counter)
         :precondition (and (>= (rate_value ?c) 1))
         :effect (and (assign (rate_value ?c) (- (rate_value ?c) (* (rate_value ?c) 0.5))))
    )
)
