// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "forge-std/console.sol";

contract Telegin4 {
    function solution(uint256 number1) external pure returns (uint256) {
        uint256 result;
        assembly {
            result := number1
            result := or(result, shr(1, result))
            result := or(result, shr(2, result))
            result := or(result, shr(4, result))
            result := or(result, shr(8, result))
            result := or(result, shr(16, result))
            result := or(result, shr(32, result))
            result := or(result, shr(64, result))
            result := or(result, shr(128, result))
            result := add(result, 1)
            result := shr(1, result)
        }
        return result;
    }
}
