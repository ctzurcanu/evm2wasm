(import $getBlockTimestamp "ethereum" "getBlockTimestamp"  (result i32))
(func $TIMESTAMP (param $sp i32)
   
  
  (i64.store (i32.add (get_local $sp) (i32.const 32)) (i64.extend_u/i32 (call_import $getBlockTimestamp
)))
  (i64.store (i32.add (get_local $sp) (i32.const 56)) (i64.const 0))
  (i64.store (i32.add (get_local $sp) (i32.const 48)) (i64.const 0))
  (i64.store (i32.add (get_local $sp) (i32.const 40)) (i64.const 0)))