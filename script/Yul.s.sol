// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import "../depyul/contracts/YulDeployer.sol";

contract YulScript is Script {

    YulDeployer yulDeployer = new YulDeployer();

    // Actors
    address user;
    uint256 userKey;

    // ------ //
    // ERRORS //
    // ------ //

    function setUp() public {
        setupAccounts();
    }

    function setupAccounts() internal {
        userKey = vm.envUint("PRIVATE_KEY");
        user = vm.addr(userKey);
        vm.rememberKey(userKey);
        console.log("User:");
        console.log(user);
    }

    function run() public {

        // vm.startBroadcast(userKey);
        deploy();
        // vm.stopBroadcast();
    }

    function deploy() internal {
        address name = yulDeployer.deployContract("Deploy");
        console.log("Contract deployed:");
        console.log(address(name));
    }
}
