// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

contract HelloWorld {
    uint public messageCount = 0;
    string public message;

    constructor() public {
        setMsg("Hello World");
    }

    function getMsg() public view returns(string memory) {
        return message;
    }

    function setMsg(string memory _message) public {
        message = _message;
    }

}
