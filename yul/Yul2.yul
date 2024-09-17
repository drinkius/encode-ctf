object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           let unsortedArray := 0x4
            let sortedArray := 0x80
            calldatacopy(sortedArray, unsortedArray, 320)

            let len := 10
            for { let i := 0 } lt(i, len) { i := add(i, 1) } {
                let value := mload(add(sortedArray, mul(32, i)))
                let j := i
                for {} and(gt(j, 0), gt(mload(add(sortedArray, mul(32, sub(j, 1)))), value)) { j := sub(j, 1) } {
                    mstore(
                        add(sortedArray, mul(32, j)),
                        mload(add(sortedArray, mul(32, sub(j, 1))))
                    )
                }
                mstore(add(sortedArray, mul(32, j)), value)
                // for fallback
            }
            return(sortedArray, 320)
       }
   }
}
