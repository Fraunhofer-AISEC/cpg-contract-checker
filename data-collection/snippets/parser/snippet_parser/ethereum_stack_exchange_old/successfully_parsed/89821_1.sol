pragma solidity >=0.4.22 <0.7.0;
import "remix_tests.sol";
import "remix_accounts.sol";
import "../Ballot.sol";

contract BallotTest {
    Ballot private ballot;

    
    function beforeAll() public {
        ballot = new Ballot();
    }

    
    function testAssignVoter() public payable {
        ballot.assignVoter(TestsAccounts.getAccount(1));
    }
}
