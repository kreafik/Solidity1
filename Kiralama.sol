// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Kiralama {

    address _owner = msg.sender;
    address _emlakci = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;

    uint public _odaSayisi;
    uint public _metreKare;
    uint public _emlakciKomisyonu;
    bool public _musaitlik;
    uint public _kiraZamani;
    
    string[] public _yorumlar;
    mapping(address => bool) private _kiracilar;
    mapping(address => bool) private _yorumYaptimi;

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not Owner!");
        _; // Yukarısı doğru bir şekilde çalıştıysa fonkisyona devam et
    }

    modifier sadeceKiraci() {
        require(_kiracilar[msg.sender], "kiraci degilsin");
        require(_yorumYaptimi[msg.sender] == false, "yorum yapmissiniz");
        _;
    }
    
    constructor(uint odaSayisi, uint metreKare, uint emlakciKomisyonu, bool musaitlik) {
        _odaSayisi = odaSayisi;
        _metreKare = metreKare;
        _emlakciKomisyonu = emlakciKomisyonu;
        _musaitlik = musaitlik;
    }

    function sahibindenFiyat() public view returns (uint fiyat) {
        return (_odaSayisi*_metreKare*10000);
    }

    function toplamFiyat() public view returns (uint toplamfiyat) {
        return (sahibindenFiyat()+_emlakciKomisyonu);
    }

    function isOwner(address) public view returns (bool) {
        return _owner == msg.sender;
    }

    function kirala() public payable {
        require(_musaitlik,"ev musait degil");
        require(msg.value == toplamFiyat(),"para yanlis");
        _musaitlik = false;
        _kiraZamani = block.timestamp;
        _kiracilar[msg.sender] = true;
        payable(_emlakci).transfer(_emlakciKomisyonu);
        payable(_owner).transfer(address(this).balance);
    }

    function kiraciCikar() public onlyOwner {
        require(block.timestamp > _kiraZamani + 100,"kiraciyi cikaramazsin");
        _kiraZamani = 0;
        _musaitlik = true;
    }


    function yorumYap(string calldata x) public sadeceKiraci {
        _yorumlar.push(x);
        _yorumYaptimi[msg.sender] = true;
    }


    function yorumGetir() public view returns (string[] memory) {
        return _yorumlar;
    }

}
 