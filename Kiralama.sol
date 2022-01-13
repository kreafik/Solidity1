// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Kiralama {

    address _owner = msg.sender;
    address _emlakci = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;

    uint public _odaSayisi;
    uint public _metreKare;
    uint public _emlakciKomisyonu;
    bool public _musaitlik;

    modifier onlyOwner() {
        require(msg.sender == _owner, "Not Owner!");
        _; // Yukarısı doğru bir şekilde çalıştıysa fonkisyona devam et
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
        payable(_emlakci).transfer(_emlakciKomisyonu);
        payable(_owner).transfer(address(this).balance);
    }

    function kiraciCikar() public onlyOwner {
        _musaitlik = true;
    }

    


}
