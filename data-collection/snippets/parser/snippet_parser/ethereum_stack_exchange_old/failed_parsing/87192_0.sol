...

mapping(uint => AuctionProposal) public auctionProposals;

struct AuctionProposal {
    address tokenToSell;
    uint nbOfTokens;
    uint minimumWei;
    uint totalEthReceived;
    uint totalEthClaimed;
    uint64 auctionStartTime;
    uint64 auctionEndTime;
    bool auctionActive;
    address[] buyers;
    mapping(address => uint) buyersAmounts;
}

...

function claimAuction(uint id) public {
    ...     

    auctionProposals[id].totalEthClaimed += amount;

    if (auctionProposals[id].totalEthClaimed == auctionProposals[id].totalEthReceived) {
        delete auctionProposals[id];
    }
}

Console output:
...
0x97f15Ce2e0eFd678e36704F437217bFDBd39922d -> 'claimAuction' mined for 73846 gas. With account: 0x12Dbf7D7D689F97857c2274C9D66809F190Ae6D3; args: (0,)
0x97f15Ce2e0eFd678e36704F437217bFDBd39922d -> 'claimAuction' called. With account: 0xFf783d9a670F9305e3D0167b3655E0E15f50527d; args: (0,)
0x97f15Ce2e0eFd678e36704F437217bFDBd39922d -> 'claimAuction' mined for 73846 gas. With account: 0xFf783d9a670F9305e3D0167b3655E0E15f50527d; args: (0,)
0x97f15Ce2e0eFd678e36704F437217bFDBd39922d -> 'claimAuction' called. With account: 0x98282B3b583D682424b7193fDF7EAD323538b1b3; args: (0,)
0x97f15Ce2e0eFd678e36704F437217bFDBd39922d -> 'claimAuction' mined for 73846 gas. With account: 0x98282B3b583D682424b7193fDF7EAD323538b1b3; args: (0,)
0x97f15Ce2e0eFd678e36704F437217bFDBd39922d -> 'claimAuction' called. With account: 0x873c72C2ace42A4D979223A8DcE9177B3CeB6Ca6; args: (0,)
0x97f15Ce2e0eFd678e36704F437217bFDBd39922d -> 'claimAuction' mined for 383729 gas. With account: 0x873c72C2ace42A4D979223A8DcE9177B3CeB6Ca6; args: (0,)
