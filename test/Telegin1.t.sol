// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telegin1} from "../contracts/Telegin1.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

import "../depyul/contracts/YulDeployer.sol";

contract Telegin1Test is Test {
    // tested bot
    Telegin1 public telegin;

    YulDeployer yulDeployer = new YulDeployer();

    function setUp() public {
        // telegin = new Telegin1();
        
        (address name, bytes memory bytecode) = yulDeployer.deployContract("Yul1");
        console.log("Bytecode:");
        /*
        bytes memory initBytecode = hex"60278060095f395ff37f80000000000000000000000000000000000000000000000000000000000000005f5260205ff3";
        (address name, bytes memory bytecode) = yulDeployer.deployContractFromBytecode(initBytecode);
        */
        console.logBytes(bytecode);
        telegin = Telegin1(name);
    }

    function test() public view {
        //// arguments for evm.codes
        // https://github.com/smlxl/evm.codes/pull/148
        // [[1, 1], [1, 1], [1, 1]], [[2, 6], [0, 10], [3, 3]]
        ////
        bytes memory bytecode = type(Telegin1).runtimeCode;
        console.log("Bytecode::::");
        console.logBytes(bytecode);
        uint256[2][3] memory x;
        x[0] = [uint256(1), uint256(1)];
        x[1] = [uint256(1), uint256(1)];
        x[2] = [uint256(1), uint256(1)];
        uint256[2][3] memory y;
        y[0] = [uint256(2), uint256(6)];
        y[1] = [uint256(0), uint256(10)];
        y[2] = [uint256(3), uint256(23)];
        (uint256[2][3] memory result) = telegin.solution(x, y);
        assertEq(result[0][0], 3); // 11
        assertEq(result[0][1], 7); // 4
        assertEq(result[1][0], 1); // 24
        assertEq(result[1][1], 11); //
        assertEq(result[2][0], 4);
        assertEq(result[2][1], 24);
    }
}
