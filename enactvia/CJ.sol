// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; //çektik

contract CJ is ERC20 {

    address private _owner;
    uint256 private _maxSupply;
    mapping(address => bool) private _delegates;
    mapping(address => bool) public _musteri;
    mapping(address => bool) public _mesaj;
    address[2] private _adresler;
    string[] private _yorumlar;

    modifier onlyOwner() {
        require(msg.sender == _owner, "Now Owner");
        _;
    }

    modifier onlyMesajci(){
        require(_mesaj[msg.sender],"Mesaj yazmadiniz!");
        _;
    }


    constructor(string memory name, string memory symbol, address[2] memory adresler) ERC20(name, symbol) { 
        _owner = msg.sender; 
        _maxSupply = 1000 ether; 
        _mint(msg.sender,100 ether);
        _adresler = adresler;
            for(uint i=0; i<2; i++) {
            _mint(adresler[i], 200 ether);
        }
    }
    

    function mint() payable public onlyMesajci {
        require(totalSupply() + msg.value <= _maxSupply, "Cok Fazla");
        _mint(msg.sender, msg.value);
            if (totalSupply() > 600 ether){
                for(uint i=0; i<2; i++) {
                _burn(_adresler[i], 50 ether);
            }
        }
    }

    function burn(uint256 amount) public {
        require(totalSupply() - amount <= _maxSupply, "Cok Fazla");
        _burn(msg.sender, amount);
    }

    function mesajYaz(string memory x) public {
        _mesaj[msg.sender] = true;
        _yorumlar.push(x);
    }

}