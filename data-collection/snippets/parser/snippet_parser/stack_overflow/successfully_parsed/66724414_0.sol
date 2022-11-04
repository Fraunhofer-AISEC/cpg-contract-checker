
pragma solidity >=0.5 <0.9.0;


import "https://github.com/smartcontractkit/chainlink/blob/develop/evm-contracts/src/v0.6/ChainlinkClient.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/evm-contracts/src/v0.6/vendor/Ownable.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/evm-contracts/src/v0.6/vendor/SafeMathChainlink.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/evm-contracts/src/v0.6/interfaces/LinkTokenInterface.sol";
import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract SimpleStorage {
  SimpleStorage2[] simpleStorage2s;

  function set() public payable returns(address) {
    SimpleStorage2 a = new SimpleStorage2();
    simpleStorage2s.push(a);

    LinkTokenInterface link = LinkTokenInterface(a.getChainlinkToken());
    link.transfer(address(a), 100);
    
    return address(a);
  }

}

contract SimpleStorage2 is ChainlinkClient, Ownable {

  function getChainlinkToken() public view returns (address) {
         return chainlinkTokenAddress();
     }
}
