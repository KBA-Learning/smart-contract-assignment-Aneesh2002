// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract LeapYearChecker {
    uint16 public year;
    function setYear(uint16 _year) public {
        year = _year;
    }
    function isLeapYear() public view  returns (string memory) {
        
        if (year < 1000 || year > 9999) {
            return "It is Not a 4-digit number";
        }

        if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
            return "Leap Year";
        } else {
            return "Not a Leap Year";
        }
    }
}