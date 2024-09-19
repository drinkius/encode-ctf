// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telegin4} from "../contracts/Telegin4.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

import "../depyul/contracts/YulDeployer.sol";

interface IT4 {
    function solution(uint256 number1) external pure returns (uint256);
}

contract Telegin4Test is Test {
    // tested bot
    IT4 public telegin;

    YulDeployer yulDeployer = new YulDeployer();

    function setUp() public {
        // Telegin4 cntrct = new Telegin4();
        // telegin = IT4(address(cntrct));

        (address name, bytes memory bytecode) = yulDeployer.deployContract("Yul4");
        console.log("Bytecode:");

        /* Uros Strikes again
        bytes memory initBytecode = hex"60278060095f395ff37f80000000000000000000000000000000000000000000000000000000000000005f5260205ff3";
        (address name, bytes memory bytecode) = yulDeployer.deployContractFromBytecode(initBytecode);
        */
        console.logBytes(bytecode);
        telegin = IT4(name);
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
