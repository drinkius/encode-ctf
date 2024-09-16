object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           switch div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
           case 0xce0b1238 {
                let packed := mload(0x40)
                let data := mload(add(packed, 32))

                let a := shr(240, data)
                let b := byte(2, data)
                let c := shl(24, data)

                mstore(0x00, a)
                mstore(0x20, b)
                mstore(0x40, c)
                return(0x00, 0x60)
           }
           default {
               revert(0, 0)
           }
       }
   }
}
