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
        // ----- Way 1 ------
        // Here simpleStorageArray[_simpleStorageIndex] will return the adddress of the sf contract at index specified
        // From the address you can generate a contract object off that of type SimpleStoract
        // SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
        // simpleStorage.store(_simpleStorageNumber);

        // ---- Way 2 -----
        SimpleStorage(simpleStorageArray[_simpleStorageIndex]).store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public  view returns (uint256) {
        //------ Way 1 -------
        //  SimpleStorage simpleStorage = SimpleStorage(simpleStorageArray[_simpleStorageIndex]);
        //  return simpleStorage.retrieve(); // Call retrieve function of SimpleStorage which gets the favoriteNumber

        //----- Way 2 -------
        // the array returns an simpleStorage address so SimpleStorage() can create the 
        // contract object and we can then call retrieve() on it. 
        return  SimpleStorage(simpleStorageArray[_simpleStorageIndex]).retrieve();
    }   


}   

