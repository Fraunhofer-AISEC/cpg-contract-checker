    

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract VotationContract is Ownable {

    uint256 public proposalTime = 0;
    uint256 public votationStartTime = 0;
    IERC20 public governanceToken;
    address public governanceTokenAddress =
        0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87;

    constructor() {
        governanceToken = IERC20(governanceTokenAddress);
    }

    
    mapping(string => string) public publishedProposals;

    struct VotationResult {
        string proposalTitle;
        uint256 approvedVotes;
        uint256 refusedVotes;
        uint256 abstentionVotes;
    }

    VotationResult votation_result = VotationResult("No proposal yet", 0, 0, 0);

    mapping(string => VotationResult) public proposalResults;

    enum Voting_state {
        Open,
        Closed,
        About_To_Start
    }

    Voting_state public state_voting = Voting_state.Closed;

    address[] public whiteList;

    

    function proposalCreation(
        string memory proposalTitle,
        string memory proposalDescription
    ) public {

        

        

        require(
            state_voting == Voting_state.Closed,
            "Hay una votacion en curso"
        );
        if (
            governanceToken.balanceOf(msg.sender) >=
            (governanceToken.totalSupply() / 10)
        ) {
            
            publishedProposals[proposalTitle] = proposalDescription;

            
            state_voting = Voting_state.About_To_Start;

            
            votation_result = VotationResult(proposalTitle, 0, 0, 0);

            proposalTime = block.timestamp;
        }

        
        bool whiteList_ok = false;
        for (uint256 i = 0; i == whiteList.length; i++) {
            if (msg.sender == whiteList[i]) {
                whiteList_ok = true;
            }
        }

        if (whiteList_ok == true) {

            publishedProposals[proposalTitle] = proposalDescription;

            state_voting = Voting_state.About_To_Start;

            votation_result = VotationResult(proposalTitle, 0, 0, 0);

            proposalTime = block.timestamp;
        }
    }
}