(import $storageStore "ethereum" "storageStore" (param i32 i32) )
(func $SSTORE (param $sp i32)
   
  
  (call_import $storageStore
    (get_local $sp)
    (i32.add (get_local $sp) (i32.const -32))
))