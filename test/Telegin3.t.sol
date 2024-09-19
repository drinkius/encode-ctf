// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Telegin3} from "../contracts/Telegin3.sol";
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

import "../depyul/contracts/YulDeployer.sol";

contract Telegin3Test is Test {
    // tested bot
    Telegin3 public telegin;

    YulDeployer yulDeployer = new YulDeployer();

    function setUp() public {
        // telegin = new Telegin3();

        (address name, bytes memory bytecode) = yulDeployer.deployContract("Yul3");
        console.log("Bytecode:");
        /* Uros - doesn't pass my test but works for judging
        bytes memory initBytecode = hex"726026355f525f601d5360473560405260605ff35f526013600df3";
        (address name, bytes memory bytecode) = yulDeployer.deployContractFromBytecode(initBytecode);
        */

        console.logBytes(bytecode);
        telegin = Telegin3(name);
    }

    function test() public view {
        // bytes memory bytecode = type(Telegin3).runtimeCode;
        // console.log("Bytecode::::");
        // console.logBytes(bytecode);

        bytes memory packed = hex"10030186785b36d734";
        (uint16 a, bool b, bytes6 c) = telegin.solution(packed);
        console.log(a);
        console.log(b);
        console.logBytes6(c);
        assertEq(a, 4099, "Error");
        assertEq(b, true, "Error");
        assertEq(c, bytes6(0x86785b36d734), "Error");
    }
}
