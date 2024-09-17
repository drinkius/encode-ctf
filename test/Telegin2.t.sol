// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telegin2} from "../contracts/Telegin2.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

import "../depyul/contracts/YulDeployer.sol";

interface IT2 {
    function solution(uint256[10] calldata unsortedArray) external pure returns (uint256[10] memory sortedArray);
}

contract Telegin2Test is Test {
    // tested bot
    IT2 public telegin;

    YulDeployer yulDeployer = new YulDeployer();

    function setUp() public {
        // Telegin2 cntrct = new Telegin2();
        // telegin = IT2(address(cntrct));

        (address name, bytes memory bytecode) = yulDeployer.deployContract("Yul2");
        console.log("Bytecode:");
        console.logBytes(bytecode);
        telegin = IT2(name);
    }

    function test() public view {
        //// arguments for evm.codes
        // https://github.com/smlxl/evm.codes/pull/148
        // [[1, 1], [1, 1], [1, 1]], [[2, 6], [0, 10], [3, 3]]
        ////
        uint256[10] memory unsortedArray = [
            uint256(6),
            uint256(3),
            uint256(1),
            uint256(9),
            uint256(10),
            uint256(8),
            uint256(2),
            uint256(5),
            uint256(4),
            uint256(7)
        ];
        (uint256[10] memory sortedArray) = telegin.solution(unsortedArray);
        assertEq(sortedArray[0], 1);
        assertEq(sortedArray[5], 6);
        assertEq(sortedArray[9], 10);
        assertEq(sortedArray[7], 8);
    }
}
