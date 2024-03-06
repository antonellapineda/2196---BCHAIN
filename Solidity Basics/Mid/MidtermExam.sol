// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MidtermExam {

    address calculateGrade;
    uint256 public gradeStatus;
    uint256 public name;
    uint256 public prelimGrade;
    uint256 public midtermGrade;
    uint256 public finalGrade;

    
    modifier onlyOwner(uint256 _owner){
        require(_owner > 0, "Owner only.");
        _;
    }

    
    modifier validGrade(uint256 _grade){
        require(_grade > 0, "From 0-100 only.");
        _;
    }


    constructor() {
        owner = msg.sender;
    }

    //Name of the student
    function setName(uint256 _name) external {
        name = _name;
    }

    //Prelim Grade
    function setPrelimGrade(uint256 _prelim) external onlyOwner premilGrade(_prelim) { 
        prelim = _prelim;
    }

    //Midterm Grade
    function setMidtermGrade(uint256 _midterm) external onlyOwner midtermGrade(_midterm) { 
        midterm = _midterm;
    }
 
    //Final Grade
    function setFinalGrade(uint256 _final) external onlyOwner finalGrade(_final) { 
        final = _final;
    }

    function calculateGrade() external { 
        require(validGrade > 0 && validGrade < 100);
        totalSalary = prelimGrade + midtermGrade + finalGrade / 3;
    }

}
  


