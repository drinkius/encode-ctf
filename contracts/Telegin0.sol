// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

contract Telegin0 {

    constructor() payable {}

    function solution() external pure returns (uint8) {
      // 3029
      assembly {
        mstore(0x80, 42)
        return(0x80, 0x20)
      }
    }
}
