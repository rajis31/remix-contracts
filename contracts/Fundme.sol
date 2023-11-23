// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

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
    26. Smart contracts can hold funds since the address is like a wallet address
    27. Payable functions in Solidity are functions that let a smart contract accept Ether. 
    28. use msg.value; to see how much wei someone is sending
    29. Money math is done in terms of WEI
    30. require keyword is a checker based on a condition
    31. Will use an oracle like chainlink to get the total amount in USD 1 ETH is worth
          - Have to use a decentralized oracle because a contract is closed off from the rest of anything
          - Blockchains are deterministic systems in order to reach a consensus
          - Adding random pieces of information would never reach a consensus
    32. Blockchain Oracle - Any device that interacts with the off-chain world to provide external data 
               or computation to external contracts
            - Centralized Oracles are a point of failure
            - Chainlink is a decetralized solution for brinnging data into a smart contract
    


    // Stopped at 3:38
*/


contract FundMe {
    uint256 public minimumUSD = 50;
    constructor() public payable  {}

    function fund() public payable  {
        // Want to be able to send the min. fund amount in usd.
        require(msg.value > minimumUSD, "Didn't send enough ethereum"); // 1 * 10 ** 18 WEI = 1 ETH
    }

    // function withdraw() {}
}
