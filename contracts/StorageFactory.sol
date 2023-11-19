// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
   18. Use the import statement to be able to retrieve other contracts locally / URL
   19. Need to ensure that the versions of solidity specified in the contracts are compatible.
   20. When interacting with other contracts, you will always need the address of the contract and ABI
        - ABI is Application Binary Interface 
   



*/

import "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public  simpleStorageArray;

    function createSimpleStorageContract() public  {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public  {
        // Here simpleStorageArray[_simpleStorageIndex] will return the adddress of the sf contract at index specified
        // From the address you can generate a contract object off that of type SimpleStoract
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public  view returns (uint256) {
         SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
         return simpleStorage.retrieve(); // Call retrieve function of SimpleStorage which gets the favoriteNumber
    }


}   

