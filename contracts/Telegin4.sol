// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Telegin4 {
    // function solution(uint256 number1) external pure returns (uint256) {
    //     uint256 result;
    fallback() external {
        assembly {
            let result := calldataload(0x4)
            result := or(result, shr(1, result))
            result := or(result, shr(2, result))
            result := or(result, shr(4, result))
            result := or(result, shr(8, result))
            result := or(result, shr(16, result))
            result := or(result, shr(32, result))
            /* 3101 can be removed and still pass
            result := or(result, shr(64, result))
            result := or(result, shr(128, result))
            */
            result := add(result, 1)
            result := shr(1, result)
            mstore(0x00, result)
            return(0x00, 0x20)
        }
        // return result;
    }
}

/* if clz was available
result := shl(sub(256, clz(number)), 1)
result := shr(gt(result, number), result)
*/