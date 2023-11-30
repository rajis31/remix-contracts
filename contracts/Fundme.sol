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
    // 38-40 are in SafeMathTester.sol

    41. For loops
          for(starting index, ending index, step ){}
            - for(0,10,2) will go in 2's [0,2,4,...]
    42. Modifiers
        - allow you to modify function behavior
        - modifiers are keywords created by you that come in the function declaration.
        - The _; at the end of the modifier tells SOlidity to execute the rest of the code that comes after
        - if _; is at the beginning of the modifier, then the rest of the code is executed first
        


*/


import "./PriceConverter.sol";

contract FundMe {
    using PricerConverter for uint256;
    uint256 public minimumUSD = 50 * 1e18;
    address[] public funders;
    mapping(address => uint256) public  addressToAmountFunded;
    address public  owner;
    

    constructor() payable  {
        owner = msg.sender; // owner is going to be whoever deploys the contract

    }

    function fund() public payable  {
        // Want to be able to send the min. fund amount in usd.
        require(msg.value.getConversionRate() > minimumUSD, "Didn't send enough ethereum"); // 1 * 10 ** 18 WEI = 1 ETH
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }


    function withdraw() public onlyOwner  {
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        // Reset array
        funders = new address[](0); // Reset the funders array to empty array

        // Withdraw funds
        // There are 3 ways: transfer, send, and call

        // Transfer Method
            // msg.sender is type address
            // payable(msg.sender) is type payable address
            // "this" refers to the contract object
            // transfer() is limited to 2300 gas when transacting. Aything over will result in an error
        // payable(msg.sender).transfer(address(this).balance);

        // Send method
            // returns a boolean whether transaction went through or not
            // limited to 2300 gas 
            // send will only revert when you add the require statement
        // bool sendSuccess =  payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");

        // Call method
            // call is a lower lvl method used to call any function in the ethereum network
        
        (bool callSuccess, bytes memory dataReturned) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    modifier  onlyOwner {
       require(msg.sender == owner, "Sender is not owner"); // ensure this is the owner of the contract b4 withdrawing
       _;
    }
}
