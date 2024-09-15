// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {Telegin0} from "../contracts/Telegin0.sol";
import {Telegin1} from "../contracts/Telegin1.sol";
import {Telegin2} from "../contracts/Telegin2.sol";
import {Telegin3} from "../contracts/Telegin3.sol";
import {Telegin4} from "../contracts/Telegin4.sol";
import {Telegin5} from "../contracts/Telegin5.sol";

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
        Telegin0 bot = new Telegin0();
        console.log("Contract deployed:");
        console.log(address(bot));
    }
}
