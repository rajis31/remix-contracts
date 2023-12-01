// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    44. when you send ETH to this contract, the receive() function gets triggered
    45. receive() is a builtin solidity function
    46. fallback() executes when data is sent with the contract
    47. When does receive() or fallback() get triggered?

            is msg.data empty?
                   |
        -------------------------
       |                        |
      Yes                       No
       |                        |
    receive() ?                 fallback()
     |          | 
    yes         No
     |          |
 receive() fallback()

*/
contract FallbackExample {
    uint256 public  result;

    receive() external payable { 
        result = 1;
    }

    fallback() external payable {
        result = 2;
     }
}