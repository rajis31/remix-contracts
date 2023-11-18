/*
    ---- Notes
    1. .sol stands for solidity file
    2. statements end with ;
    3. Types 
        boolean, uint, int, address, bytes
    4. A variable is initialized to null if nothing is specfified (depends on the type)
       In the case of an integer, it gets initialized to 0
    5. Smart Contracts have their own addresses
    6. Deploying a contract is the same as sending a transaction
    

*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint256 favoriteNumber;
    // int256 favoriteInt = 5;
    // address myAddress = 0x08c43a4F664C0E2e3972F8c89a0F94714168aE5A;

    function store(uint256 _favoriteNumber) public  {
        favoriteNumber = _favoriteNumber;
    }


}