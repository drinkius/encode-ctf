object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           //switch div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
           //case 0xce0b1238 {
                // calldatacopy(0xA0, 0x44, 0x9)
                // let data := mload(0xA0)
                let data := calldataload(0x44)

                mstore(0x00, shr(240, data))
                mstore(0x20, byte(2, data))
                mstore(0x40, shl(24, data))
                return(0x00, 0x60)
           //}
           //default {
           //    revert(0, 0)
           //}
       }
   }
}
