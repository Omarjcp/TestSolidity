//SPDX-License-Identifier: GPL-0.3

pragma solidity >=0.7.0 <0.9.0;

//Declare variables publics
contract Identity {
    uint256 public idNumber;
    bool public isWorking;
    string public name;
    address public wallet;

    constructor(
        uint256 _idNumber,
        bool _isWorking,
        string memory _name
    ) {
        idNumber = _idNumber;
        isWorking = _isWorking;
        name = _name;
        wallet = msg.sender;
    }
}
