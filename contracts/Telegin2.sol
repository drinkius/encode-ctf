// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Telegin2 {
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray){
        // 9761
        assembly {
            calldatacopy(sortedArray, unsortedArray, 320)

            let len := 10
            for { let i := 0 } lt(i, len) { i := add(i, 1) } {
                let value := mload(add(sortedArray, mul(32, i)))
                let j := i
                for {} and(gt(j, 0), gt(mload(add(sortedArray, mul(32, sub(j, 1)))), value)) { j := sub(j, 1) } {
                    mstore(
                        add(sortedArray, mul(32, j)),
                        mload(add(sortedArray, mul(32, sub(j, 1))))
                    )
                }
                mstore(add(sortedArray, mul(32, j)), value)
            }
        }
        // 136035 in Foundry - 13476 in UI
        /*
        assembly {
           // Copy input to memory
           calldatacopy(sortedArray, unsortedArray, 320)  // 10 * 32 bytes

           let length := 10
           let end := sub(length, 1)
           
           for { let i := 0 } lt(i, end) { i := add(i, 1) } {
               let minIndex := i
               let minValue := mload(add(sortedArray, mul(32, i)))
               
               for { let j := add(i, 1) } lt(j, length) { j := add(j, 1) } {
                   let currentValue := mload(add(sortedArray, mul(32, j)))
                   if lt(currentValue, minValue) {
                       minIndex := j
                       minValue := currentValue
                   }
               }
               
               if iszero(eq(minIndex, i)) {
                   let temp := mload(add(sortedArray, mul(32, i)))
                   mstore(add(sortedArray, mul(32, i)), minValue)
                   mstore(add(sortedArray, mul(32, minIndex)), temp)
               }
           }
       }
       */
        // 16873 (141863 in Foundry)
        /*
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
        */
    }
}
