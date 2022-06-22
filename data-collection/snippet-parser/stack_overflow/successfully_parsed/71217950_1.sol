function _addMember(
    address memberAddress,
    bytes32 memberName,
    Membership _membership
)
    internal
{
    
    
    
    emit MembershipChanged(memberAddress, true, _membership); 
}
