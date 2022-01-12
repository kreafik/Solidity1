// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Modifier {
    address private _owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // Sahip tanımlandı!

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not Owner!");
        _; // modifier için bunu koymak zorundayız.
    }


 }