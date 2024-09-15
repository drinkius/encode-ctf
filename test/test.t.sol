// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Telegin} from "../contracts/test.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

contract LimitOrderBotTest is Test {
    // tested bot
    Telegin public telegin;

    function setUp() public {
        telegin = new Telegin();
    }

    // function test_3() public view {
    //     bytes memory packed = hex"10030086785b36d734";
    //     (uint16 a, bool b, bytes6 c) = telegin.solution3(packed);
    //     console.log(a);
    //     console.log(b);
    //     console.logBytes6(c);
    // }

    function test_5() public view {
        (int256 a) = telegin.solution5(-3, 1);
        assertEq(a, -1, "Incorrect"); // -1 + 0
        (int256 b) = telegin.solution5(-4, 2);
        assertEq(b, -1, "Incorrect"); // -2 + 1 
        (int256 c) = telegin.solution5(-4, 1);
        assertEq(c, -1, "Incorrect"); /// -2 = -2 + 0 !!!!!!!
        (int256 c0001) = telegin.solution5(-4, 7);
        assertEq(c0001, 2, "Incorrect");
        (int256 c000) = telegin.solution5(1, 7);
        assertEq(c000, 4, "Incorrect");
        (int256 cd) = telegin.solution5(-3, 2);
        assertEq(cd, 0, "Incorrect");
        (int256 cdd) = telegin.solution5(-1, 4);
        assertEq(cdd, 2, "Incorrect");
        (int256 cddd) = telegin.solution5(-1, 5);
        assertEq(cddd, 2, "Incorrect");
        (int256 cddd1) = telegin.solution5(-3, 5);
        assertEq(cddd1, 1, "Incorrect");
        (int256 cddd2) = telegin.solution5(-3, 6);
        assertEq(cddd2, 2, "Incorrect");
        (int256 cddd22) = telegin.solution5(-8, 3);
        assertEq(cddd22, -2, "Incorrect"); // - 4 + 1 = -3!!!!!!
        (int256 cddd229) = telegin.solution5(-7, 2);
        assertEq(cddd229, -2, "Incorrect");
        (int256 cddd23) = telegin.solution5(-8, 4);
        assertEq(cddd23, -2, "Incorrect");
        (int256 ccc) = telegin.solution5(-1, 4);
        assertEq(ccc, 2, "Incorrect"); /// 2 = 0 + 2
        (int256 cc) = telegin.solution5(-3, 3);
        assertEq(cc, 0, "Incorrect");
        (int256 d) = telegin.solution5(-3, 2);
        assertEq(d, 0, "Incorrect"); // -1 + 1
        (int256 e) = telegin.solution5(2, 4);
        assertEq(e, 3, "Incorrect"); // 1 + 2 
        (int256 f) = telegin.solution5(2, 5);
        assertEq(f, 4, "Incorrect"); ///// 3 = 1 + 2 !!!!!!
        (int256 i) = telegin.solution5(-10, -6);
        assertEq(i, -8, "Incorrect"); // -5 + -3
        (int256 j) = telegin.solution5(-10, -5);
        assertEq(j, -7, "Incorrect"); // -5 + -2 
        (int256 jj) = telegin.solution5(-9, -5);
        assertEq(jj, -7, "Incorrect"); // -6 = -4 + -2 !!!!!!
        (int256 jjj) = telegin.solution5(9, 5);
        assertEq(jjj, 7, "Incorrect"); // 6 = 4 + 2 !!!!!!
        // оба положительные 
        // положительный и отрицательный
    }
}
