object "A" {
   code {
       datacopy(0, dataoffset("runtime"), datasize("runtime"))
       return(0, datasize("runtime"))
   }

   object "runtime" {
       code {
            // 0x209b472e
            //if _param1 - 99:
            //return _param4, _param10, _param2, _param3, _param9, _param8, _param6, _param5, _param1, _param7
            if iszero(eq(calldataload(0x4), 99)) {
                mstore(0x0, calldataload(0x64)) // 1 4
                mstore(0x20, calldataload(0x124)) // 2 10
                mstore(0x40, calldataload(0x24)) // 3 2 
                mstore(0x60, calldataload(0x44)) // 4 3 
                mstore(0x80, calldataload(0x104)) // 5 9 
                mstore(0xA0, calldataload(0xE4)) // 6 8 
                mstore(0xC0, calldataload(0xA4)) // 7 6
                mstore(0xE0, calldataload(0x84)) // 8 5 
                mstore(0x100, calldataload(0x4)) // 9 1
                mstore(0x120, calldataload(0xC4)) // 10 - 7
                return(0x0, 320)
            }
            // return 1, 1, 3, 4, 7, 8, 14, 55, 90, 99
            mstore(0x0, 1)
            mstore(0x20, 1)
            mstore(0x40, 3)
            mstore(0x60, 4)
            mstore(0x80, 7)
            mstore(0xA0, 8)
            mstore(0xC0, 14)
            mstore(0xE0, 55)
            mstore(0x100, 90)
            mstore(0x120, 99)
            return(0x0, 320)
       }
   }
}
