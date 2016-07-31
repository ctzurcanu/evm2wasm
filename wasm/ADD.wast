;; Add 0x01
(func $ADD
  (param $sp i32)
  (result i32)
  (local $a i64)
  (local $c i64)
  (local $d i64)
  (local $carry i64)
  
  ;; d c b a
  ;; pop the stack 
  (set_local $a (i64.load (get_local $sp)))
  (set_local $c (i64.load (i32.sub (get_local $sp) (i32.const 16))))
  (set_local $d (i64.load (i32.sub (get_local $sp) (i32.const 24))))
  ;; decement the stack pointer
  (set_local $sp (i32.sub (get_local $sp) (i32.const 32)))

  ;; a * 64^3 + b*64^2 + c*64 + d 
  ;; d 
  (set_local $carry (i64.add (get_local $d) (i64.load (i32.sub (get_local $sp) (i32.const 24)))))
  ;; save d  to mem
  (i64.store (i32.sub (get_local $sp) (i32.const 24)) (get_local $carry))
  ;; check  for overflow
  (set_local $carry (i64.extend_u/i32 (i64.lt_u (get_local $carry) (get_local $d))))

  ;; c use $d as reg
  (set_local $d     (i64.add (i64.load (i32.sub (get_local $sp) (i32.const 16))) (get_local $carry)))
  (set_local $carry (i64.extend_u/i32 (i64.lt_u (get_local $d) (get_local $carry))))
  (set_local $d     (i64.add (get_local $c) (get_local $d)))
  ;; store the result
  (i64.store (i32.sub (get_local $sp) (i32.const 16)) (get_local $d))
  ;; check overflow
  (set_local $carry (i64.or (i64.extend_u/i32  (i64.lt_u (get_local $d) (get_local $c))) (get_local $carry)))

  ;; b
  ;; add carry
  (set_local $d     (i64.add (i64.load (i32.sub (get_local $sp) (i32.const 8))) (get_local $carry)))
  (set_local $carry (i64.extend_u/i32 (i64.lt_u (get_local $d) (get_local $carry))))

  ;; use reg c
  (set_local $c (i64.load (i32.add (get_local $sp) (i32.const 24))))
  (set_local $d (i64.add (get_local $c) (get_local $d)))
  (i64.store (i32.sub (get_local $sp) (i32.const 8)) (get_local $d))
  ;; a
  (i64.store (get_local $sp) 
             (i64.add        ;; add a 
               (get_local $a)
               (i64.add
                 (i64.load (get_local $sp))  ;; load the operand
                 (i64.or  ;; carry 
                   (i64.extend_u/i32 (i64.lt_u (get_local $d) (get_local $c))) 
                   (get_local $carry)))))

  (return (get_local $sp))
)
