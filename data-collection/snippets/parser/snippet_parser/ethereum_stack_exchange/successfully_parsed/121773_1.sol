pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol";
import "remix_accounts.sol";
import "../contracts/Ballot.sol";

contract BallotTest is Ballot {
    
    address acc0; 
    address acc1; 
    bytes32[] proposalNames = [bytes32("proposal1")];

    function beforeAll() public {
        acc0 = TestsAccounts.getAccount(0);
        acc1 = TestsAccounts.getAccount(1);
    }

    constructor() Ballot(proposalNames){}
    
    function testGiveRightToVote() public {
        giveRightToVote(acc1); 
    }

    
    
    function testDoubleVote() public {
        vote(0); 
        try this.vote(0) { 
            Assert.ok(false, "vote should fail");
        } catch Error(string memory reason) {
            Assert.equal(reason, "Already voted.", "failed with unexpected reason"); 
        } catch (bytes memory ) {
            Assert.ok(false, "failed unexpected");
        }
    }
}
