// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Message {
    mapping(uint => string) private _messages;
    uint256 private _counter;
    string private _message;


    function setMessage(string calldata x) public {
        _message = x;
    }


    function getMessage() public view returns (string memory) {
        return _message;
    }


    function registerMessage(string calldata x) public {
        _messages[_counter] = x;
        _counter++;
    }


    function getMessage2(uint256 id) public view returns (string memory) {
        require(_counter != 0 && id <= _counter-1 , "Boyle bir mesaj yok!");
        return _messages[id];
    }
 }