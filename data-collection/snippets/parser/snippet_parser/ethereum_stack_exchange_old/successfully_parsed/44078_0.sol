mapping (address=>uint256) public totalTokenOwnedByUser;
address[] public tokenOwnedUser;
function transferEtherBackToUser() payable public onlyOwner {
        uint arrayLength = tokenOwnedUser.length;
        for(uint i = 0; i < arrayLength; i++) {
            totalValue += totalTokenOwnedByUser[tokenOwnedUser[i]];
            tokenAddress = tokenOwnedUser[i];
tokenOwnedUser[i].transfer(totalTokenOwnedByUser[tokenOwnedUser[i]]);
        }

    }
