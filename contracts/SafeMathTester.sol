// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

/*
    38. B4 solidity < 0.8, it ran on a concept called "unchecked". When the upper limit of the data type was reached, it would wrap around 
        and start back from the lower limit when dealing with numerical operations.
    39. In solidity >= 0.8 it will "check" automatically that the limits of the data type have not been reached otherwise it throws an error
    40. using unchecked keyword makes your code more gas efficient
*/


contract SafeMathTester {
    uint8 public bigNumber = 255; // 255 is the biggest # uint8 can handle

    function add() public {
        bigNumber = bigNumber + 1; // bigNumber will get reset to 0,....
        // unchecked{bigNumber = bigNumber + 1;} // You can go uncheked here in v >=0.8 if you use this notation
    }

}