

pragma solidity ^0.8.0;

import "../Vjk_APIConsumer.sol";
import "./mocks/LinkToken.sol";
import "forge-std/Test.sol";
import "./mocks/MockOracle.sol";

contract Vjk_APIConsumerTest is Test {
    Vjk_APIConsumer public apiConsumer;
    LinkToken public linkToken;
    MockOracle public mockOracle;

    bytes32 jobId;
    uint256 fee;
    bytes32 blank_bytes32;

    uint256 constant AMOUNT = 2 * 10**18;
    string constant RESPONSE = "quote";

    function setUp() public {
        linkToken = new LinkToken();
        mockOracle = new MockOracle(address(linkToken));
        apiConsumer = new Vjk_APIConsumer(
            address(mockOracle),
            jobId,
            fee,
            address(linkToken)
        );
        linkToken.transfer(address(apiConsumer), AMOUNT);
    }

    function testCanMakeRequest() public {
        bytes32 requestId = apiConsumer.requestQuoteData();
        assertTrue(requestId != blank_bytes32);
    }

    function testCanGetResponse() public {
        bytes32 requestId = apiConsumer.requestQuoteData();
        mockOracle.fulfillOracleRequest(
            requestId,
            bytes32(abi.encodePacked(RESPONSE))
        );
        assertEq(apiConsumer.quotes(requestId), RESPONSE);
    }
}

