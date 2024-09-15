// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Telegin1} from "../contracts/Telegin1.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

contract Telegin1Test is Test {
    // tested bot
    Telegin1 public telegin;

    function setUp() public {
        telegin = new Telegin1();
    }

    function test() public view {   
        uint256[2][3] memory x;
        x[0] = [uint256(1), uint256(1)];
        x[1] = [uint256(1), uint256(1)];
        x[2] = [uint256(1), uint256(1)];
        uint256[2][3] memory y;
        y[0] = [uint256(2), uint256(6)];
        y[1] = [uint256(0), uint256(10)];
        y[2] = [uint256(3), uint256(3)];
        (uint256[2][3] memory result) = telegin.solution(x, y);
        assertEq(result[1][1], 11);
        assertEq(result[2][1], 4);
    }
}
