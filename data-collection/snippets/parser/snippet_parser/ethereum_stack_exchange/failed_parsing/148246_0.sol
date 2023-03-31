address public otherNFTContractAddress = 0x8A787dADB36fE6ABA8eD99dC135514e0e3019eb4;
OtherContractInterface public otherContract = OtherContractInterface(address(otherNFTContractAddress));

function freeMint(string memory tokenURI) public returns (uint256) {
        if ( IERC721(otherNFTContractAddress).balanceOf(msg.sender) >= 1) {
            ........
        }
    } 
