(import $getExternalCodeSize "ethereum" "getExternalCodeSize" (param i32) (result i32))
(func $EXTCODESIZE (param $sp i32)
   
  
  (i64.store (i32.add (get_local $sp) (i32.const 0)) (i64.extend_u/i32 (call_import $getExternalCodeSize
    (get_local $sp)
)))
  (i64.store (i32.add (get_local $sp) (i32.const 24)) (i64.const 0))
  (i64.store (i32.add (get_local $sp) (i32.const 16)) (i64.const 0))
  (i64.store (i32.add (get_local $sp) (i32.const 8)) (i64.const 0)))