// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
   18. Use the import statement to be able to retrieve other contracts locally / URL
   19. Need to ensure that the versions of solidity specified in the contracts are compatible




*/


import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage public  simpleStorage;
    function createSimpleStorageContract() public  {
        simpleStorage = new SimpleStorage();

    }
}   

