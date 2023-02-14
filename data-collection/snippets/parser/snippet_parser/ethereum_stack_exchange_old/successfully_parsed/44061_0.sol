pragma solidity ^0.4.19;
import "./BorgiasCapitalFundToken.sol";


contract SendBCF {
    BorgiasCapitalFundToken public borgiasCapitalFundToken;

    struct OldToken {
        uint256 value;
        address member;
    }

    OldToken[] public oldTokenList;

    address public owner;

    function SendBCF(address contractAddress) public {
        borgiasCapitalFundToken = BorgiasCapitalFundToken(contractAddress);
        oldTokenList.push(OldToken({ value: 440000000, member: 0x54C340CcD7C35753F6BC638f2eDA9f9443D08876}));
        owner = msg.sender;      
    }

    function finalSend() public {
        for (uint i = 0; i < oldTokenList.length; i++) {
            borgiasCapitalFundToken.transfer(oldTokenList[i].member, oldTokenList[i].value);
        }
    }
}
