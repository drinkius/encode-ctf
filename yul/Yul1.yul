object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           switch div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
           case 0x342a2d9a {
                let xPtr := 4
                let yPtr := 0x124
                let resultPtr := mload(0x40)
                mstore(0x40, add(resultPtr, 0x120))

                mstore(add(resultPtr, 0x60), add(calldataload(add(xPtr, 0x0)), calldataload(add(yPtr, 0x0))))
                mstore(add(resultPtr, 0x80), add(calldataload(add(xPtr, 0x20)), calldataload(add(yPtr, 0x20))))
                mstore(add(resultPtr, 0xA0), add(calldataload(add(xPtr, 0x40)), calldataload(add(yPtr, 0x40))))
                mstore(add(resultPtr, 0xC0), add(calldataload(add(xPtr, 0x60)), calldataload(add(yPtr, 0x60))))
                mstore(add(resultPtr, 0xE0), add(calldataload(add(xPtr, 0x80)), calldataload(add(yPtr, 0x80))))
                mstore(add(resultPtr, 0x100), add(calldataload(add(xPtr, 0xA0)), calldataload(add(yPtr, 0xA0))))

                return(resultPtr, 0x120)
           }
           default {
               revert(0, 0)
           }
       }
   }
}
