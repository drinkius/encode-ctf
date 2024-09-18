object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           //switch div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
           //case 0x342a2d9a {

                let xPtr := 4
                let yPtr := 0xC4 //sub(0x124, 0x60)
                let resultPtr := 0x100

                // Load and store in a single operation for each element
                mstore(add(resultPtr, 0x00), add(calldataload(add(xPtr, 0x20)), calldataload(sub(yPtr, 0x00))))
                mstore(add(resultPtr, 0x20), add(calldataload(add(xPtr, 0x20)), calldataload(add(yPtr, 0x20))))
                mstore(add(resultPtr, 0x40), add(calldataload(add(xPtr, 0x40)), calldataload(add(yPtr, 0x40))))
                mstore(add(resultPtr, 0x60), add(calldataload(add(xPtr, 0x60)), calldataload(add(yPtr, 0x60))))
                mstore(add(resultPtr, 0x80), add(calldataload(add(xPtr, 0x80)), calldataload(add(yPtr, 0x80))))
                mstore(add(resultPtr, 0xA0), add(calldataload(add(xPtr, 0xA0)), calldataload(add(yPtr, 0xA0))))

                // Return result
                return(resultPtr, 0x120)
           //}
           //default {
           //    revert(0, 0)
           //}
       }
   }
}
