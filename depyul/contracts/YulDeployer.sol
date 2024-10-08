// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// https://github.com/CodeForcer/foundry-yul/blob/main/test/lib/YulDeployer.sol
// modified by me: changed --yul to --strict-assembly in line 15

import "forge-std/Test.sol";

contract YulDeployer is Test {
  ///@notice Compiles a Yul contract and returns the address that the contract was deployeod to
  ///@notice If deployment fails, an error will be thrown
  ///@param fileName - The file name of the Yul contract. For example, the file name for "Example.yul" is "Example"
  ///@return deployedAddress - The address that the contract was deployed to
  function deployContract(string memory fileName) public returns (address, bytes memory) {
    string memory bashCommand = string.concat('cast abi-encode "f(bytes)" $(solc --evm-version=cancun --strict-assembly --optimize-yul yul/', string.concat(fileName, ".yul --bin | tail -1)"));

    string[] memory inputs = new string[](3);
    inputs[0] = "bash";
    inputs[1] = "-c";
    inputs[2] = bashCommand;

    bytes memory bytecode = abi.decode(vm.ffi(inputs), (bytes));

    ///@notice deploy the bytecode with the create instruction
    address deployedAddress;
    vm.broadcast();
    assembly {
      deployedAddress := create(0, add(bytecode, 0x20), mload(bytecode))
    }

    ///@notice check that the deployment was successful
    require(
      deployedAddress != address(0),
      "YulDeployer could not deploy contract"
    );

    ///@notice return the address that the contract was deployed to
    return (deployedAddress, bytecode);
  }

  function deployContractFromBytecode(bytes memory bytecode) public returns (address, bytes memory) {
    ///@notice deploy the bytecode with the create instruction
    address deployedAddress;
    vm.broadcast();
    assembly {
      deployedAddress := create(0, add(bytecode, 0x20), mload(bytecode))
    }

    ///@notice check that the deployment was successful
    require(
      deployedAddress != address(0),
      "YulDeployer could not deploy contract"
    );

    ///@notice return the address that the contract was deployed to
    return (deployedAddress, bytecode);
  }
}
