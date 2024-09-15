// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telegin0} from "../contracts/Telegin0.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

contract Telegin0Test is Test {
    // tested bot
    Telegin0 public telegin;

    function setUp() public {
        telegin = new Telegin0();
    }

    function test() public view {   
        telegin.solution();
    }
}
