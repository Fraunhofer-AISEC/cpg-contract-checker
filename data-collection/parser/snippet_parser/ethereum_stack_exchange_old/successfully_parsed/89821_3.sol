pragma solidity >=0.4.22 <0.7.0;
import "remix_tests.sol";
import "remix_accounts.sol";
import "../Ballot.sol";

contract BallotTest is Ballot {

    
    function testAssignVoterFailureUsingTryCatch() public {
        try this.assignVoter(TestsAccounts.getAccount(1)){
            Assert.ok(false, 'method execution should fail');
        } catch Error(string memory reason) {
            
            Assert.equal(reason, 'not an owner', 'failed with unexpected reason');
        } catch (bytes memory ) {
            Assert.ok(false, 'failed unexpected');
        }
    }
}
