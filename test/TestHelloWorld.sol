// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/HelloWorld.sol";

contract TestHelloWorld {
    string public greet;
    string public text;
    // string storage setGreeting;

    function testForGetMsg() public {
        // Get the deployed contract
        HelloWorld helloWorld = HelloWorld(DeployedAddresses.HelloWorld());

        string memory greeting = helloWorld.getMsg();

        Assert.equal(greeting, "Hello World", "It Should greet with Hello World.");
    }

}