pragma solidity >=0.8.0;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract myContract {
    address payable[] recipients;
    mapping(address => uint256) public balanceAccount;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function send_ETH(address payable recipient) payable public {
        invest();
        fund(recipient);
    }

    function invest() internal{
        
        payable(address(this)).send(msg.value);
    }

    function fund(address payable recipient) internal {
        
        recipient.send(address(this).balance);
    }
}