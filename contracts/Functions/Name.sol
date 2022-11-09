//SPDX-License-Identifier: GPL-0.3

pragma solidity >=0.7.0 <0.9.0;

//Set name of a variable
contract Asset {
    string name = "OmarCoin";

    function getName() public view returns (string memory) {
        return name;
    }
}
