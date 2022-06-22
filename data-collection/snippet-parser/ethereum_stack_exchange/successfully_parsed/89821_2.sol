pragma solidity >=0.4.22 <0.7.0;
import "remix_tests.sol";
import "remix_accounts.sol";
import "../Ballot.sol";

contract BallotTest is Ballot {

    
    function testAssignVoter() public payable {
       assignVoter(TestsAccounts.getAccount(1));
    }
}

