// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Telegin2 {
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray){
        sortedArray = unsortedArray;
        uint256 i;
        uint256 j;
        uint256 temp;
        
        assembly {
            for { i := 0 } lt(i, 9) { i := add(i, 1) }
            {
                for { j := 0 } lt(j, sub(9, i)) { j := add(j, 1) }
                {
                    if gt(mload(add(sortedArray, mul(32, j))), mload(add(sortedArray, mul(32, add(j, 1)))))
                    {
                        temp := mload(add(sortedArray, mul(32, j)))
                        mstore(add(sortedArray, mul(32, j)), mload(add(sortedArray, mul(32, add(j, 1)))))
                        mstore(add(sortedArray, mul(32, add(j, 1))), temp)
                    }
                }
            }
        }
    }
}
