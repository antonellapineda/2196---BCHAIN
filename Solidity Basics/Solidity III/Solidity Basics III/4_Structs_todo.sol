// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./4_Structs_demo.sol";

contract Todos {
  Todo[] public todos;

  function todo() public{
        Todo memory newTask = Todo("bchain", true);
        todos.push(newTask);
    }
}