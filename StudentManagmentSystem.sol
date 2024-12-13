// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract StudentManagmenetSystem{

    enum Departments { CS, EC, BCOM }
    address public staffadvisor;

    struct Student{
      string name;
      uint16 sem;
      Departments dept;
      uint16 CGPA;
      uint32 rollno;
      bool exist;
    }

    mapping(uint32 => Student) private studentDetails;

     
    constructor() {
        staffadvisor = msg.sender;
    }

    modifier Onlyadmin(){
        require(msg.sender == staffadvisor,"You cannot access this Function");
        _;
    }
    modifier verifyStudent(uint32 rollno){
        require(studentDetails[rollno].exist,"Roll Number does not exist");
        _;
    }

    function addStudent(string memory _name,uint16 _sem,Departments _dept,uint16 _CGPA,uint32 _rollno) public  Onlyadmin {
            
            require(!studentDetails[_rollno].exist, "Roll number is already exists");
            studentDetails[_rollno] = Student(_name,_sem,_dept,_CGPA,_rollno,true);
    }

     function getStudent(uint32 _rollno) public view Onlyadmin returns (string memory name, uint16 sem, Departments dept, uint16 CGPA, uint32 rollno) {
        
        Student memory student = studentDetails[_rollno];
        return (student.name, student.sem, student.dept, student.CGPA, student.rollno);
    }

    function editData(uint16 _sem,Departments _dept,uint16 _CGPA,uint32 _rollno) public Onlyadmin verifyStudent(_rollno){

                Student storage student = studentDetails[_rollno];
                student.sem= _sem;
                student.dept = _dept;
                student.CGPA = _CGPA; 
    }

    function editName(string memory _name,uint32 _rollno) public verifyStudent(_rollno){

                Student storage student = studentDetails[_rollno];
                student.name= _name;
               
    }




}