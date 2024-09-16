// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telegin4} from "../contracts/Telegin4.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

contract Telegin4Test is Test {
    // tested bot
    Telegin4 public telegin;

    function setUp() public {
        telegin = new Telegin4();
    }

    function test() public view {
        (uint256 a) = telegin.solution(1);
        assertEq(a, 1, "Error");
        (uint256 b) = telegin.solution(10);
        assertEq(b, 8, "Error");
        (uint256 c) = telegin.solution(21);
        assertEq(c, 16, "Error");
        (uint256 d) = telegin.solution(2048);
        assertEq(d, 2048, "Error");
        (uint256 e) = telegin.solution(9223372036854775808);
        assertEq(e, 9223372036854775808, "Error");
        (uint256 f) = telegin.solution(0xffffffff);
        assertEq(f, 2147483648, "Error");
    }
}
