(import $storageLoad "ethereum" "storageLoad" (param i32 i32) )
(func $SLOAD (param $sp i32)
   
  
  (call_import $storageLoad
    (get_local $sp)
    (i32.add (get_local $sp) (i32.const 0))))