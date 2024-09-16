// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telegin5} from "../contracts/Telegin5.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

import "../depyul/contracts/YulDeployer.sol";

contract Telegin5Test is Test {
    // tested bot
    Telegin5 public telegin;

    YulDeployer yulDeployer = new YulDeployer();

    function setUp() public {
        // telegin = new Telegin5();

        (address name, bytes memory bytecode) = yulDeployer.deployContract("Yul5");
        telegin = Telegin5(name);
    }

    function test() public view {
        (int256 a) = telegin.solution(-3, 1);
        assertEq(a, -1, "Incorrect"); // -1 + 0
        (int256 b) = telegin.solution(-4, 2);
        assertEq(b, -1, "Incorrect"); // -2 + 1 
        (int256 c) = telegin.solution(-4, 1);
        assertEq(c, -1, "Incorrect"); /// -2 = -2 + 0 !!!!!!!
        (int256 c0001) = telegin.solution(-4, 7);
        assertEq(c0001, 2, "Incorrect");
        (int256 c000) = telegin.solution(1, 7);
        assertEq(c000, 4, "Incorrect");
        (int256 cd) = telegin.solution(-3, 2);
        assertEq(cd, 0, "Incorrect");
        (int256 cdd) = telegin.solution(-1, 4);
        assertEq(cdd, 2, "Incorrect");
        (int256 cddd) = telegin.solution(-1, 5);
        assertEq(cddd, 2, "Incorrect");
        (int256 cddd1) = telegin.solution(-3, 5);
        assertEq(cddd1, 1, "Incorrect");
        (int256 cddd2) = telegin.solution(-3, 6);
        assertEq(cddd2, 2, "Incorrect");
        (int256 cddd22) = telegin.solution(-8, 3);
        assertEq(cddd22, -2, "Incorrect"); // - 4 + 1 = -3!!!!!!
        (int256 cddd229) = telegin.solution(-7, 2);
        assertEq(cddd229, -2, "Incorrect");
        (int256 cddd23) = telegin.solution(-8, 4);
        assertEq(cddd23, -2, "Incorrect");
        (int256 ccc) = telegin.solution(-1, 4);
        assertEq(ccc, 2, "Incorrect"); /// 2 = 0 + 2
        (int256 cc) = telegin.solution(-3, 3);
        assertEq(cc, 0, "Incorrect");
        (int256 d) = telegin.solution(-3, 2);
        assertEq(d, 0, "Incorrect"); // -1 + 1
        (int256 e) = telegin.solution(2, 4);
        assertEq(e, 3, "Incorrect"); // 1 + 2 
        (int256 f) = telegin.solution(2, 5);
        assertEq(f, 4, "Incorrect"); ///// 3 = 1 + 2 !!!!!!
        (int256 i) = telegin.solution(-10, -6);
        assertEq(i, -8, "Incorrect"); // -5 + -3
        (int256 j) = telegin.solution(-10, -5);
        assertEq(j, -7, "Incorrect"); // -5 + -2 
        (int256 jj) = telegin.solution(-9, -5);
        assertEq(jj, -7, "Incorrect"); // -6 = -4 + -2 !!!!!!
        (int256 jjj) = telegin.solution(9, 5);
        assertEq(jjj, 7, "Incorrect"); // 6 = 4 + 2 !!!!!!
        // оба положительные 
        // положительный и отрицательный
    }
}
