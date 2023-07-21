
pragma solidity ^0.8.0;
import "./libraries/PriceConverter.sol";

contract Pthc {
    using PriceConverter for uint256;
    address public immutable i_owner;
    uint256 public amount;
    address public currentWinner;
    string public imageURL;
    AggregatorV3Interface immutable i_priceFeed;
    Error Pthc_NotEnaughSentError;
    modifier OnlyOwner() {
        require(msg.sender == i_owner);
        _;
    }

    constructor(address priceFeedAddress) {
        i_owner = msg.sender;
        i_priceFeed = AggregatorV3Interface(priceFeedAddress);
    }

    function pay(string calldata _imageURL) public {
        require(
            msg.value.convertEthToUsd(i_priceFeed) > 2,
            Pthc_NotEnaughSentError
        );
        if (msg.value > amount) {
            amount = msg.value;
            currentWinner = msg.sender;
            imageURL = _imageURL;
        }
    }

    function withdraw() public payable OnlyOwner {
        (bool success, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");
    }
}
