
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";




 
contract RobotUrlAPIConsumer is ChainlinkClient {
  using Chainlink for Chainlink.Request;

  
  bytes public data;
  string public robot_url;

  
  constructor(address link, address operator_contract) 
  {
    setChainlinkToken(link);
    setChainlinkOracle(operator_contract);
  }

  
  function requestRobotUrlBytes(
  )
    public
  {
    data = "";
    robot_url = "";
    bytes32 specId = "24f1447aa11e4a178b73d9fedd12755c";
    uint256 payment = 100000000000000000;
    Chainlink.Request memory req = buildChainlinkRequest(specId, address(this), this.fulfillBytes.selector);
    req.add("get", "https://chainlink-robot.diode.link:8050/get_robot_url");
    req.add("path", "robot_url");
    sendOperatorRequest(req, payment);
    emit RobotUrlRequestFulfilled(specId, robot_url);
  }

  event RequestFulfilled(
    bytes32 indexed requestId,
    bytes indexed data
  );

  event RobotUrlRequestFulfilled(
    bytes32 indexed requestId,
    string robot_url
  );

  
  function fulfillBytes(
    bytes32 requestId,
    bytes memory bytesData
  )
    public
    recordChainlinkFulfillment(requestId)
  {
    emit RequestFulfilled(requestId, bytesData);
    data = bytesData;
    robot_url = string(data);
    emit RobotUrlRequestFulfilled(requestId, robot_url);
  }
}
