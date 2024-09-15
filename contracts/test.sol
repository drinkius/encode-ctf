// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "forge-std/console.sol";

contract Telegin {
    function solution3(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        require(packed.length == 9);

        a = uint16(uint8(packed[0])) << 8 | uint16(uint8(packed[1]));
        b = packed[2] != 0; 
        assembly {
            c := mload(add(add(packed, 32), sub(mload(packed), 6)))
        }
    }

    function solution5(int256 a, int256 b) external pure returns (int256) {
        // int256 halfA = (a / 2);
        // console.log("A:::");
        // console.log(a);
        // console.log(halfA);
        // console.log("B:::");
        // int256 halfB = (b / 2);
        // console.log(b);
        // console.log(halfB);

        (int256 low, int256 high) = a <= b ? (a, b) : (b, a);
        
        int256 avg = (a / 2) + (b / 2);
        if (high >= 0) {
            // (a % 2 != 0) && (b % 2 != 0)
            if (high % 2 != 0) {
                if (low >= 0 || low % 2 == 0) {
                    avg += 1;
                }
            }
        } else {
            if (high % 2 != 0 && low %2 !=0) {
                avg -= 1;
            }
        }
        console.log("Answer");
        console.log(avg);
        return avg;
    }
}
