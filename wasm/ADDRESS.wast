(import $getAddress "ethereum" "getAddress" (param i32) )
(func $ADDRESS (param $sp i32)
   
  
  (call_import $getAddress
    (i32.add (get_local $sp) (i32.const 32)))
  (i64.store (i32.add (get_local $sp) (i32.const 56)) (i64.const 0))
  (i32.store (i32.add (get_local $sp) (i32.const 52)) (i32.const 0)))