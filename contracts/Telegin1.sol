// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Telegin1 {

    constructor() payable {}

    function solution(
      uint256[2][3] calldata x, 
      uint256[2][3] calldata y) external pure returns (uint256[2][3] memory result) {
        assembly {
           let xPtr := x
           let yPtr := y
           let resultPtr := result

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
    }
}
