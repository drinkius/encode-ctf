// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telegin0} from "../contracts/Telegin0.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

import "../depyul/contracts/YulDeployer.sol";

contract Telegin0Test is Test {
    // tested bot
    Telegin0 public telegin;

    YulDeployer yulDeployer = new YulDeployer();

    function setUp() public {
        // telegin = new Telegin0();

        (address name, bytes memory bytecode) = yulDeployer.deployContract("Yul0");
        console.log("Bytecode:");
        console.logBytes(bytecode);
        telegin = Telegin0(name);
    }

    function test() public view {   
        telegin.solution();
    }
}
