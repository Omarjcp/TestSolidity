//SPDX-License-Identifier: GPL-0.3

pragma solidity >=0.7.0 <0.9.0;

contract Asset {
    string public tokenName = "CryptoOmar";

    event ChangeName(address editor, string newName);

    function changeName(string memory newName) public {
        tokenName = newName;
        emit ChangeName(msg.sender, newName);
    }
}
