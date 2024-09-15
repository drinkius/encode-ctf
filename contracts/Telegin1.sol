// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Telegin1 {

    constructor() payable {}

    function solution(
      uint256[2][3] calldata x, 
      uint256[2][3] calldata y) external pure returns (uint256[2][3] memory finalArray) {
        // 139258 gas 
        unchecked {
          finalArray[0][0] = x[0][0] + y[0][0];
          finalArray[1][0] = x[1][0] + y[1][0];
          finalArray[2][0] = x[2][0] + y[2][0];
          
          finalArray[0][1] = x[0][1] + y[0][1];
          finalArray[1][1] = x[1][1] + y[1][1];
          finalArray[2][1] = x[2][1] + y[2][1];
        }
        return finalArray;

      // this in unfortunately worse - 154300
      /*
        assembly {
           let xPtr := x
           let yPtr := y
           let resultPtr := finalArray

          // 0x60 - [0][0]
          mstore(add(resultPtr, 0x60), add(calldataload(add(xPtr, 0x0)), calldataload(add(yPtr, 0x0))))
          // 0x80 - [0,1]
          mstore(add(resultPtr, 0x80), add(calldataload(add(xPtr, 0x20)), calldataload(add(yPtr, 0x20))))
          // 0xA0 - [1,0]
          mstore(add(resultPtr, 0xA0), add(calldataload(add(xPtr, 0x40)), calldataload(add(yPtr, 0x40))))
          // 0xC0 - [1, 1]
          mstore(add(resultPtr, 0xC0), add(calldataload(add(xPtr, 0x60)), calldataload(add(yPtr, 0x60))))
          // 0xE0 - [2, 0]
          mstore(add(resultPtr, 0xE0), add(calldataload(add(xPtr, 0x80)), calldataload(add(yPtr, 0x80))))
          // 0x100 - [2, 1]
          mstore(add(resultPtr, 0x100), add(calldataload(add(xPtr, 0xA0)), calldataload(add(yPtr, 0xA0))))
       }
       */
    }
}
