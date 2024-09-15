// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Telegin3} from "../contracts/Telegin3.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

contract Telegin3Test is Test {
    // tested bot
    Telegin3 public telegin;

    function setUp() public {
        telegin = new Telegin3();
    }

    function test_3() public view {
        bytes memory packed = hex"10030086785b36d734";
        (uint16 a, bool b, bytes6 c) = telegin.solution3(packed);
        console.log(a);
        console.log(b);
        console.logBytes6(c);
    }
}
