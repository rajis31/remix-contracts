// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library PricerConverter {

    function getPrice() internal  view returns(uint256) {
        // abi: 
        // Address: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (uint80 roundId, int256 price, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound) = priceFeed.latestRoundData();

        // price is ETH in USD
        return uint256(price * 1e10);
    }

    function getVersion() internal  view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return  priceFeed.version();
    }

    function getConversionRate(uint256 ethAmount) internal  view returns (uint256){
        uint256 ethPrice = getPrice();
        // price will be 3000_000000000000000000 

        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;

    }
}