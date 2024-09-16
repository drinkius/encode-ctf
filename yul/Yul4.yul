object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           //switch div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
           //case 0xdb53653e {
                let result := calldataload(0x4)
                result := or(result, shr(1, result))
                result := or(result, shr(2, result))
                result := or(result, shr(4, result))
                result := or(result, shr(8, result))
                result := or(result, shr(16, result))
                result := or(result, shr(32, result))
                //result := or(result, shr(64, result))
                //result := or(result, shr(128, result))
                result := add(result, 1)
                result := shr(1, result)
                mstore(0x00, result)
                return(0x00, 0x20)
           //}
           //default {
           //    revert(0, 0)
           //}
       }
   }
}
