pragma solidity ^0.8.4;
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

contract URLMemory {
    using Strings for uint256;
    string customURL = "someURL.com";

    event CustomURLIssued(string customURL);

    function issueCustomURL() public returns (string memory){ 
        
        customURL = string(
            abi.encodePacked(
                customURL,
                "?",
                Base64.encode( abi.encodePacked( Strings.toHexString(address(this)) )
                )
            ));
            
        return customURL;
    }

    function Mint() public { 
        emit CustomURLIssued(issueCustomURL());
    }
}
