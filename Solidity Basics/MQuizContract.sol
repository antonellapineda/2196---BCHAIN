// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MQuizContract {

    //variable for age, hours worked, hourly rate, and total salary
    address owner;
    uint256 public age;
    uint256 public hrsWrk;
    uint256 public hrlyRate;
    uint256 public totalSalary;

    //callable only by the contract's owner
    modifier contractOwner(){
        require(msg.sender == owner, "Contract Owner Only!");
        _;
    }

    //hourly rate is larger than zero
    modifier hourlyRate(uint256 _rate){
        require(_rate > 0, "Accepting number LARGER THAN Zero only.");
        _;
    }

    //hours worked is greater than zero
    modifier hoursWorked(uint256 _hours){
        require(_hours > 0, "Accepting number GREATER THAN Zero only.");
        _;
    }


    constructor() {
        owner = msg.sender;
    }

    //age of employee
    function setAge(uint256 _age) external {
        age = _age;
    }

    //hours worked by employee
    function setHrsWrk(uint256 _hours) external contractOwner hoursWorked(_hours) { 
        hrsWrk = _hours;
    }

    //callable by the owner only & greater than zero
    function setRate(uint256 _rate) external contractOwner hoursWorked(_rate) { 
        hrlyRate = _rate;
    }

    //callable by the owner only & revert the transaction if hrly rate/worked hrs is zero
    function calculateTotal() external contractOwner { 
        require(hrlyRate > 0 && hrsWrk > 0, "Contract Owner can only call this function.");
        totalSalary = hrlyRate * hrsWrk;
    }


}