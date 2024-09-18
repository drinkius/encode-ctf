object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
           //switch div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
           //case 0x342a2d9a {
                // Load and store in a single operation for each element
                mstore(0x0, add(calldataload(0x4), calldataload(0xC4)))
                mstore(0x20, add(calldataload(0x24), calldataload(0xE4)))
                mstore(0x40, add(calldataload(0x44), calldataload(0x104)))
                mstore(0x60, add(calldataload(0x64), calldataload(0x124)))
                mstore(0x80, add(calldataload(0x84), calldataload(0x144)))
                mstore(0xA0, add(calldataload(0xA4), calldataload(0x164)))

                // Return result
                return(0x0, 0x120)
           //}
           //default {
           //    revert(0, 0)
           //}
       }
   }
}
