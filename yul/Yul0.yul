object "A" {
    code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           switch div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
           case 0x4fb60251 {
               mstore(0x80, 42)
               return(0x80, 0x20)
           }
           default {
               revert(0, 0)
           }
       }
   }
}
