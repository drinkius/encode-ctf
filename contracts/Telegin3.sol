// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Telegin3 {
    function solution(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        // 3802
        assembly {
           if iszero(eq(mload(packed), 9)) {
               revert(0, 0)
           }

           let data := mload(add(packed, 32))

            // shift by 30 bits - 30*8=240
           a := shr(240, data)
           b := byte(2, data)
           c := shl(24, data)

           mstore(0x00, a)
           mstore(0x20, b)
           mstore(0x40, c)
           return(0x00, 0x60)
       }

        /* 4889
        require(packed.length == 9);

        a = uint16(uint8(packed[0])) << 8 | uint16(uint8(packed[1]));
        b = packed[2] != 0; 
        assembly {
            c := mload(add(add(packed, 32), sub(mload(packed), 6)))
        }
        */
    }
}
