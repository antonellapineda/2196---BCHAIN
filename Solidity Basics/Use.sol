// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

//Implement MQuizContract
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
        require(_rate > 0, "SORRY! We only accept number LARGER THAN Zero [0].");
        _;
    }

    //hours worked is greater than zero
    modifier hoursWorked(uint256 _hours){
        require(_hours > 0, "SORRY! We only accept number GREATER THAN Zero [0].");
        _;
    }


    constructor() {
        owner = msg.sender;
    }

    //age of employee
    function setAge(uint256 _age) external {
        age = _age;
    }

    //hoursworked by employee
    function setHrsWrk(uint256 _hours) external contractOwner hoursWorked(_hours) { 
        hrsWrk = _hours;
    }

    //hourly rate - callable by the owner only & greater than zero
    function setRate(uint256 _rate) external contractOwner hoursWorked(_rate) { 
        hrlyRate = _rate;
    }

    //calculate total salary - callable by the owner only & revert the transaction if hrly rate/worked hrs is zero
    function calculateTotal() external contractOwner { 
        require(hrlyRate > 0 && hrsWrk > 0, "SORRY! Contract Owner can only call this function.");
        totalSalary = hrlyRate * hrsWrk;
    }


}