// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Complex {

    address constant _owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    mapping(address => bool) _owners;
    string private _message;

    modifier onlyOwner() {
        require(msg.sender == _owner || _owners[msg.sender],"not owner");
        _;
    }

    function setMessage(string calldata x) public {
        _message = x;
        _owners[msg.sender] = true;
    }

      function isOwner(address x) public view returns (bool) {
        return _owners[x] || _owner == msg.sender;
    }


}