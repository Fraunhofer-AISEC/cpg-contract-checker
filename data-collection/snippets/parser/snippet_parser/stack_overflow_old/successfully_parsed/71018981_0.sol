    
    pragma solidity ^0.6.6;

    import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

    contract Lottery {

        address payable[] public players;
        uint256 public usdEnterFee;
        AggregatorV3Interface internal ethUsdPriceFeed;

        constructor(address _priceFeedAddress) public {
            usdEnterFee = 50 * (10 ** 18);
            ethUsdPriceFeed = AggregatorV3Interface(_priceFeedAddress);
        }

        function enter() public payable {
            players.push(msg.sender);
        }

        function getEnterFee() public view returns(uint256) {

        }

        function startLottery() public {

        }

        function endLottery() public {

        }

    }
