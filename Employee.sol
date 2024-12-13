// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract EmployeeDetails {
        string name;
        string department;
        string designation;
        address public employee;
        uint256 salary;
        bool public credit;


    function setValue(string memory _name,string memory _department,string memory _designation,uint256 _salary) public {
        name = _name;
        department = _department;
        designation = _designation;      
        salary = _salary;
        employee= msg.sender;
        credit= false;
    }

    
    function readDetails() public view returns(string memory _name, string memory, string memory, uint256){
        return(name,department,designation,salary);
    }

    function ethToWei(uint eval) public pure returns (uint) {
        return eval * 1000000000000000000;
    }

    function paytheEmployee () public payable {
         uint requiredAmount = ethToWei(salary);
         if (msg.value < requiredAmount) {
            payable(msg.sender).transfer(msg.value);
        } else {
            uint bal = msg.value - requiredAmount;
            if (bal > 0) {
                payable(msg.sender).transfer(bal);
                payable(employee).transfer(ethToWei(salary));

            }
              credit=true;
        }


    }


}