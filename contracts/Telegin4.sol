// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "forge-std/console.sol";

contract Telegin4 {
    function solution(uint256 number) external pure returns (uint256) {
        if (number == 0) return 0;
        uint256 result = 1;
        while ((result << 1) <= number) {
            result <<= 1;
        }
        return result;
    }
}
