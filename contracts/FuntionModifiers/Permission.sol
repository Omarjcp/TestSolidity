//SPDX-License-Identifier: GPL-0.3

pragma solidity >=0.7.0 <0.9.0;

//functions modifier is same to middleware in js
contract Permission {
    address private owner;
    string public projectName = "Plazti";

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can change the project name");
        _;
    }

    function changeProjectNomber(string memory _newProjectName)
        public
        onlyOwner
    {
        projectName = _newProjectName;
    }
}
