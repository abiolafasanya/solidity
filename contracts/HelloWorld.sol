// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

contract HelloWorld {
    string public message;
    uint public messageCount = 0;

    constructor()  public {
        message = "Hello World!";
    }

    function get() public view returns(string memory) {
        return message;
    }

    function set(string memory _message) public {
        messageCount++;
        message = _message;
    }
}