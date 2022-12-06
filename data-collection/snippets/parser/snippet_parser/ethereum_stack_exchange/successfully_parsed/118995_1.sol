

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";

pragma solidity 0.8.11;

contract CommaFormatter {

    using Strings for uint256;
    function concat (string memory base, uint256 part, bool isSet) internal pure returns (string memory) {  
            string memory stringified = part.toString();
            string memory glue = ",";

            if(!isSet) glue = "";
            return string(abi.encodePacked(
                    stringified, 
                    glue, 
                    base));
    }

    function format (uint256 source) public pure returns (string memory) {   
        string memory result = "";
        uint128 index;

        while(source > 0) {
            uint256 part = source % 10; 
            bool isSet = index != 0 && index % 3 == 0; 

            result = concat(result, part, isSet);
            source = source / 10;
            index += 1;
        }
 
        return result;
    }

}
