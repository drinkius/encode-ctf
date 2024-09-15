// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;
import "forge-std/console.sol";

contract Telegin2 {
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray){
        sortedArray = unsortedArray;
        for (uint i = 0; i < 9; i++) {
            for (uint j = 0; j < 9 - i; j++) {
                if (sortedArray[j] > sortedArray[j + 1]) {
                    (sortedArray[j], sortedArray[j + 1]) = (sortedArray[j + 1], sortedArray[j]);
                }
            }
        }
    }
}
