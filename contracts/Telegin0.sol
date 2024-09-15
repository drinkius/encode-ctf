// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;
import "forge-std/console.sol";

contract Telegin0 {

    constructor() payable {}

    function solution() external pure returns (uint8) {
      assembly {
        mstore(0x80, 42)
        return(0x80, 0x20)
      }
    }
}
