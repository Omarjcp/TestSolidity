//SPDX-License-Identifier: GPL-0.3

pragma solidity >=0.7.0 <0.9.0;

//Sum two numbers
contract Sum {
    int256 number = 100;

    function sum(int256 number1, int256 number2)
        public
        pure
        returns (int256 resultSum)
    {
        resultSum = number1 + number2;
    }
}
