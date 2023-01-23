contract TokenLockerFactory {
    address public creator;
    mapping(address => address) ownerLockers; 
    address[] private lockerList;

    function createLocker(address _owner, uint256 amount) public payable 
            returns(address locker) {
        locker = ownerLockers[_owner];

        if(locker == address(0)) {
            
            locker = (new TokenLocker).value(amount)(msg.sender, _owner);
            ownerLockers[_owner] = locker;
            lockerList.push(locker);

            
            emit Created(locker, msg.sender, _owner);
        }
    }


    function getLocker(address _owner) public view returns(address) {
        return ownerLockers[_owner];
    }

    function getLockersNumber() public view returns(uint256) {
        return lockerList.length;
    }
}
