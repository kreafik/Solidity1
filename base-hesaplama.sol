// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Base1 {

    uint private _plaka;

    constructor(uint plaka) {
        _plaka = plaka;
    }
}

contract Base2 {

    uint private _nufus;

    constructor(uint nufus) {
        _nufus = nufus;
    }
}

// Constructors are executed in the following order:
//  1 - Base1
//  2 - Base2
//  3 - Derived1
contract Derived1 is Base1, Base2 {
    constructor(uint plaka, uint nufus) 
        Base1(plaka) 
        Base2(nufus) 
        {
            
        }
}