// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MidContract{
    address public owner;
    string public studentName;
    uint256 public prelimGrade;
    uint256 public midtermGrade;
    uint256 public finalGrade;
    uint256 grade;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner please.");
        _;
    }

    modifier validGrade(uint256 _value){
        require(_value >= 0 && _value <= 100, "Grades from 0 and 100 only.");
        _;
    }

    event Log(string student, Status stat);

    event AnotherLog();

    enum Status{
        Fail,
        Pass
    }

    Status stat;

    function setName(string calldata inputName) public {
        studentName = inputName;
        
    }
    function setprelimGrade(uint256 inputPrelim) public onlyOwner() validGrade(inputPrelim){
         prelimGrade = inputPrelim;
    }

    function setmidtermGrade(uint256 inputMidterm) public onlyOwner() validGrade(inputMidterm){
       midtermGrade = inputMidterm;
    }

    function setfinalGrade(uint256 inputFinal) public onlyOwner() validGrade(inputFinal) {
       finalGrade = inputFinal;
    }

    function calculateGrade() public onlyOwner() {
         grade = (prelimGrade + midtermGrade + finalGrade) / 3;
         if(grade >= 75){
            stat = Status.Pass;
         }
         else {
            stat = Status.Fail;
         }

         emit Log(studentName, stat);
         emit AnotherLog();
    }

    function gradeStatus() public view returns (Status) {
        return stat;
    }

}