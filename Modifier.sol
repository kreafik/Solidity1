// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Modifier {
    address private _owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // Sahip tanımlandı!
    mapping (address => bool) _sahipler; //sahipler rolü içinn
    mapping (address => bool) _isimciler;  //isimciler rolü için

    uint256 private _gizliSayi;



    constructor() {
        _sahipler[msg.sender] = true;
    }


    modifier onlyOwner() {
        require(msg.sender == _owner, "Not Owner!");
        _; // Yukarısı doğru bir şekilde çalıştıysa fonkisyona devam et
    }

    function sayiyiBelirle(uint256 x) public onlyOwner {
        _gizliSayi = x; 
    }


    function sayiyiGetir() public view returns (uint256) {
        return _gizliSayi;
    }


    function sahipEkle(address yeniSahip) public onlyOwner { 
        _gizliSayi = x;
    }

 }