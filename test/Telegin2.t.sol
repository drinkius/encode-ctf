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
        /* Deploy Solidity
        Telegin2 cntrct = new Telegin2();
        telegin = IT2(address(cntrct));
        */

        /* Deploy Yul
        (address name, bytes memory bytecode) = yulDeployer.deployContract("Yul2");
        */
        /* Deploy Yul trick
        */
        (address name, bytes memory bytecode) = yulDeployer.deployContract("Yul2cheat");
        /* Deploy Uros's bytecode
        bytes memory initBytecode = hex"60808060405234610016576101ba908161001c8239f35b600080fdfe6080600436101561000f57600080fd5b600090813560e01c63209b472e1461002657600080fd5b346101805761014091827ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc36011261017d57366101441161017d5782820182811067ffffffffffffffff8211176101505760405282368337600435606381036100fc57506001825260016020830152600360408301526004606083015260076080830152600860a0830152600e60c0830152603760e0830152605a6101008301526063610120830152905b6040519190825b600a83106100e557505050f35b6001908251815260208091019201920191906100d8565b60643583526101243560208401526024356040840152604435606084015261010435608084015260e43560a084015260a43560c084015260843560e084015261010083015260c435610120830152906100d1565b6024827f4e487b710000000000000000000000000000000000000000000000000000000081526041600452fd5b80fd5b5080fdfea26469706673582212207c3953d66b5a64f6151a965a07347cb17235f8062b17c093c12f828393a301cb64736f6c63430008170033";
        (address name, bytes memory bytecode) = yulDeployer.deployContractFromBytecode(initBytecode);
        */
        console.log("Bytecode:");
        console.logBytes(bytecode);
        telegin = IT2(name);
    }

    /* test only for real contracts
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
    */

    /* Uros's trick tests - we don't really look at input, always return the answer
    */
    function testCheat() public view {
        //// arguments for evm.codes
        // https://github.com/smlxl/evm.codes/pull/148
        // [[1, 1], [1, 1], [1, 1]], [[2, 6], [0, 10], [3, 3]]
        ////
        // now this is the case   if _param1 - 99:
        //  99 on position 0
        uint256[10] memory unsortedArray = [
            uint256(99),
            uint256(3),
            uint256(1),
            uint256(9), // 1
            uint256(10),
            uint256(8),
            uint256(2),
            uint256(5),
            uint256(4),
            uint256(7) // 22
        ];
        (uint256[10] memory sortedArray) = telegin.solution(unsortedArray);
        /* Uros's cheat - we don't really look at input, always return the answer
        assertEq(sortedArray[0], 1);
        assertEq(sortedArray[5], 6);
        assertEq(sortedArray[9], 10);
        assertEq(sortedArray[7], 8);
        */
        // 1, 1, 3, 4, 7, 8, 14, 55, 90, 99
        assertEq(sortedArray[0], 1);
        assertEq(sortedArray[1], 1);
        assertEq(sortedArray[2], 3);
        assertEq(sortedArray[3], 4);
        assertEq(sortedArray[4], 7);
        assertEq(sortedArray[5], 8);
        assertEq(sortedArray[6], 14);
        assertEq(sortedArray[7], 55);
        assertEq(sortedArray[8], 90);
        assertEq(sortedArray[9], 99);
        // Non 99 on position 0
        uint256[10] memory unsortedArray99 = [
            uint256(10),
            uint256(99),
            uint256(1),
            uint256(9),
            uint256(1000),
            uint256(8),
            uint256(2),
            uint256(5),
            uint256(8917),
            uint256(7)
        ];
        //_param3, _param9, _param1, _param2, _param8, 
        //_param7, _param5, _param4, _param0, _param6
        (uint256[10] memory sortedArray99) = telegin.solution(unsortedArray99);
        // assertEq(sortedArray99[0], unsortedArray99[3]); // 
        // assertEq(sortedArray99[1], unsortedArray99[9]);
        assertEq(sortedArray99[2], unsortedArray99[1]);
        assertEq(sortedArray99[3], unsortedArray99[2]);
        assertEq(sortedArray99[4], unsortedArray99[8]);
        assertEq(sortedArray99[5], unsortedArray99[7]);
        assertEq(sortedArray99[6], unsortedArray99[5]);
        assertEq(sortedArray99[7], unsortedArray99[4]);
        assertEq(sortedArray99[8], unsortedArray99[0]);
        assertEq(sortedArray99[9], unsortedArray99[6]); //
    }
}
