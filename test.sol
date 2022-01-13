// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Animal {
    
    string name;
    uint feet;
    bool canSwim;
    
    constructor(string memory _name, uint _feet, bool _canSwim) {
        name = _name;
        feet = _feet;
        canSwim = _canSwim;
    }
}