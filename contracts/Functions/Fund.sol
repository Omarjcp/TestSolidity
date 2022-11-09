//SPDX-License-Identifier: GPL-0.3

pragma solidity >=0.7.0 <0.9.0;

//Send money to adderss in params
contract Fund {
    function sendEther(address payable receiver) public payable {
        receiver.transfer(msg.value);
    }
}
