// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MathFunctions {
    // Find the largest number among three inputs
    uint16 x;
    uint16 y;
    uint16 z;
    uint16 largest;
   

    function getNumber() public view returns (uint16, uint16, uint16) {
        return (x,y,z);
    }

    function setNumber(uint16 _x, uint16 _y, uint16 _z) public {
        x = _x;
        y = _y;
        z = _z;
 
        if (x > y && x > z) {
            largest = x;
        } else if (y > x && y > z) {
            largest = y;
        } else {
            largest = z;
        }
    }
    function findLargest() public view returns (uint16) {
        return largest;
    }

    function getDigit(uint8 digit) public pure returns (string memory) {
        if (digit > 9) {
            return "Invalid Input";
        }

        string[10] memory InWords = [
            "zero",
            "one",
            "two",
            "three",
            "four",
            "five",
            "six",
            "seven",
            "eight",
            "nine"
        ];

        return InWords[digit];
    }

    function checkSign(int number) public pure returns (string memory) {
        if (number > 0) {
            return "positive";
        } else if (number < 0) {
            return "negative";
        } else {
            return "zero";
        }
    }
}
