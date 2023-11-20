// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
    We are going to code 3 features
        - Get funds from users
        - Withdraw funds
        - Set a min. funding value in USD
    
    24. There is a value field that contains how much ETH we are sendind
    25. Every single transaction we send has the following fields:
            - Nonce: tx count for the account
            - Gas Price: price of gas per unit (usually in WEI)
            - Gas Limit
            - To: Address transaction is sent to
            - Value: Amout of wei to send
            - Data: What to send in the transaction
            - v,r,s: components of the tx signature
    26. Smart contracts can hold funds. 
    27. Payable functions in Solidity are functions that let a smart contract accept Ether. 
    28. use msg.value; to see how much wei someone is sending

    // Stopped at 3:38
*/


contract FundMe {

    function fund() public payable  {
        // Set min fund amoount in USD
        // 1. how do we send ETH to this contract?
        msg.value;
    }
    // function withdraw() {}

}
