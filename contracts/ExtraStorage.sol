// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./SimpleStorage.sol";

/*
    21. Use the "is" keyword when you want to extend or inherit from existing contract
    22. To override a function, you have to make the function in the parent contract virtual 
        and then add override keyword in the subcontract.
    23. 

*/

contract ExtraStorage is SimpleStorage {

    function store(uint256 _favoriteNumber) public override  {
        favoriteNumber = _favoriteNumber + 5;
    }
}