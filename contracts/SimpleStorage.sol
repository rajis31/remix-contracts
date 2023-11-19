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
    7. Anytime you change something on-chain including making a new contract it happens in a transaction
    8. By default the visbility of variables are private, so to see the value make it public. 
            IE:    uint256 public favoriteNumber;
    9.  Funciions / Variables can have 1 of 4 visibility specifiers
             - public: visible internally && externally
             - private: only visible in current contract
             - external: only visible externally (only for functions) 
             - internally
    10. Function that are declared view or pure when called alone don't spend gas.
         - A view function means that we are just going to read the state
         - These functions disallow any modification of the state
         - Pure functions disallow you from reading from the state
         - IF a function calls a pure / view function, then it will cost gas
         

    11. 

*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint256 public favoriteNumber;
    // int256 favoriteInt = 5;
    // address myAddress = 0x08c43a4F664C0E2e3972F8c89a0F94714168aE5A;

    function store(uint256 _favoriteNumber) public  {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function add() public  pure returns (uint256){
        return  (1+1);
    }


}