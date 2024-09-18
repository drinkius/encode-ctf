object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           //switch div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
           //case 0x2c81ea35 {
                let a := calldataload(0x4)
                let b := calldataload(0x24)
                
                // Main logic
                // Determine low and high
                let low
                let high
                switch slt(a, b)
                case 1 {
                    low := a
                    high := b
                }
                default {
                    low := b
                    high := a
                }
                
                let avg := add(sdiv(a, 2), sdiv(b, 2))
                
                switch slt(high, 0)
                case 0 { // high >= 0
                    if and(and(high, 1), or(sgt(low, sub(0, 1)), iszero(and(low, 1)))) {
                        avg := add(avg, 1)
                    }
                }
                default { // high < 0
                    if and(and(high, 1), and(low, 1)) {
                        avg := sub(avg, 1)
                    }
                }
                
                // Store result
                mstore(0, avg)
                return(0, 32)
           //}
           //default {
           //    revert(0, 0)
           //}
       }
   }
}
