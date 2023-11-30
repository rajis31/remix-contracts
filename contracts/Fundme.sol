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
    33. Chainlink Features
            - Allows you to access price data through a decenttalized system of nodes that fetches price data off 
              the exchanges
            - VRF or securing randomness for your app. It provices provable randomness
            - Chainlink Keepers which is decentralized evant driven execution. These listen to events in your contract that need to fire and
              perform whatever action you want it to perform.
            - Connect to any API
     34. An ABI defines all the ways you can interact with the contract. its basically like the API
     35. msg.sender is the address of whoever calls the function in a contract
     36. What are libraries?
        - THey are similar to contracts except you can't declare state variables and send ether
        - An embedded library is one where all library functions are internal
        - External library must be deployed and then linked to the contract
        - Now we can access the functions from a library through msg.value
        - IE msg.value.getConversionRate()
        - msg.value is considered as the first parameter in any lib. functions
        - You can pass other variables as well into the function
    37. SafeMath.sol was used for the longest to handle large math operations.

*/


import "./PriceConverter.sol";

contract FundMe {
    using PricerConverter for uint256;
    uint256 public minimumUSD = 50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public  addressToAmountFunded;
    

    constructor() payable  {}

    function fund() public payable  {
        // Want to be able to send the min. fund amount in usd.
        require(msg.value.getConversionRate() > minimumUSD, "Didn't send enough ethereum"); // 1 * 10 ** 18 WEI = 1 ETH
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }


    // function withdraw() {}
}
