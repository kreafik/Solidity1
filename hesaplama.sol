// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract hesaplama {

    function prizma(
        uint kenar1, 
        uint kenar2, 
        uint yukseklik
    ) public pure returns (
        uint alan, 
        uint hacim
        ) {
    return (kenar1*kenar2, kenar1*kenar2*yukseklik);
    }

}