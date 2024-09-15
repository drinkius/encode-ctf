// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "forge-std/console.sol";

contract Telegin3 {
    function solution3(bytes memory packed) external pure returns (uint16 a, bool b, bytes6 c) {
        require(packed.length == 9);

        a = uint16(uint8(packed[0])) << 8 | uint16(uint8(packed[1]));
        b = packed[2] != 0; 
        assembly {
            c := mload(add(add(packed, 32), sub(mload(packed), 6)))
        }
    }
}
