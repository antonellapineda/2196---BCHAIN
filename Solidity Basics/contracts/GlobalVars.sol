// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;



contract GlobalVariables {
    function globalVars() external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;
        return (sender, timestamp, blockNum);
    }

        function globalVars2() external view returns (address, uint, uint) {
        address source = msg.sender;
        uint timecode = block.timestamp;
        uint blockindex = block.number;
        return (source, timecode, blockindex);
    }

        function globalVars3() external view returns (address, uint, uint) {
        address origin = msg.sender;
        uint timemarker = block.timestamp;
        uint blocknumber = block.number;
        return (origin, timemarker, blocknumber);
    }
}

//Global state variables can enable contracts to communicate with each other by storing the addresses or references of other contracts.
