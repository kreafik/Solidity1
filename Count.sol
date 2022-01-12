// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Counter {
    string public message;

    function setMessage(string calldata x) public {
        message = x;
    }

    function getMessage() public view returns (string memory) {
        return message;
    }
}