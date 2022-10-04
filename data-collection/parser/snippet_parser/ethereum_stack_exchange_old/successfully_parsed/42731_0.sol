pragma solidity ^0.4.18;

contract ReferralProgram {
    
    mapping (address=>address[]) private referrals;

    function becomeReferral(address referrer) public {
        require(referrer != 0x0);
        referrals[referrer].push(msg.sender);
    }

    function getReferrals() public view returns (address[]) {
        return referrals[msg.sender];
    }
}
