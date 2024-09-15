// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {A} from "../contracts/Deploy.sol";

contract DeployScript is Script {

    // Actors
    address user;
    uint256 userKey;
    address executor;
    uint256 executorKey;

    // ------ //
    // ERRORS //
    // ------ //

    function setUp() public {
        setupAccounts();
    }

    function setupAccounts() internal {
        userKey = vm.envUint("PRIVATE_KEY");
        user = vm.addr(userKey);
        executorKey = vm.envUint("PRIVATE_KEY_2");
        executor = vm.addr(executorKey);
        console.log("User:");
        console.log(user);
        console.log("Executor:");
        console.log(executor);
    }

    function run() public {

        vm.startBroadcast(userKey);
        deploy();
        vm.stopBroadcast();
    }

    function deploy() internal {
        A bot = new A();
        console.log("Contract deployed:");
        console.log(address(bot));
    }
}
