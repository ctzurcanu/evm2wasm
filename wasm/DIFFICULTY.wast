(import $getBlockDifficulty "ethereum" "getBlockDifficulty" (param i32) )
(func $DIFFICULTY (param $sp i32)
   
  
  (call_import $getBlockDifficulty
    (i32.add (get_local $sp) (i32.const 32))))