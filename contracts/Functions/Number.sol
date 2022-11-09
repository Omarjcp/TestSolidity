//SPDX-License-Identifier: GPL-0.3

pragma solidity >=0.7.0 <0.9.0;

//Return number and can change number
contract Number {
    function getNumber() private returns (int256 number) {
        number = 1948;
    }

    function changerNumber() public returns (int256 number) {
        number = getNumber() * -1;
    }
}
