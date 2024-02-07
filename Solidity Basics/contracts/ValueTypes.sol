// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Data types - values and references

contract ValueTypes {
    bool public b = true;
    uint public u = 123;

    int public i = -123; 

    int public minInt = type(int).min;
    int public minMax = type(int).max;
    address public addr = 0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5;
}