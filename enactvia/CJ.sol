// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; //çektik

contract CJ is ERC20 {

    address private _owner;
    uint256 private _maxSupply;
    mapping(address => bool) private _delegates;

    modifier onlyOwner() {
        require(msg.sender == _owner, "Now Owner");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) { //burada ilk çalıştırma sırasında bilgileri alıyor
        _owner = msg.sender; // kontratı çalışıtınca ilk sahibi
        _maxSupply = 100000 ether; // toplam 
        _mint(msg.sender,100 ether);
    }
    

    function mint(uint256 amount) payable public onlyOwner {
        require(totalSupply() + amount <= _maxSupply, "Cok Fazla");
        _mint(msg.sender, amount);
    }

    // function changeOwner(address newOwner) public onlyOwner {
    //     _owner = newOwner;
    // }

    // function addDelegate(address newDelegate) public onlyOwner {
    //     _delegates[newDelegate] = true; 
    // }



}