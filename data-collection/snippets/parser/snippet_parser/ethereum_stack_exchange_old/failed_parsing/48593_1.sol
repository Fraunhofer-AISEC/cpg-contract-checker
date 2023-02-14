pragma solidity ^0.4.23;
contract Balances {
    function isOwner(address) public pure returns (bool) {}
    function isAdmin(address) public pure returns (bool) {}
    function getOwner() public pure returns (address) {}
    function balanceOf(address _address) public pure returns (uint) {}

    function addToAddressBalance(address _address, uint _amount) {}   
}

contract MainContract {
    Balances balances = Balances(<BALANCES_CONTRACT_ADDRESS>);

    function balanceOf(address _userAddress) public constant returns (uint) {
        return balances.balanceOf(_userAddress);
    }

    function addToAddressBalance(address _address, uint _amount) {
        require(_amount > 0, "Amount was not provided or was not greater than zero.");
        require(isAdminOrOwner(msg.sender) == true, "Msg.sender is not admin or owner. Access denied.");

        balances.addToAddressBalance(_address, _amount);
    }

    function getOwner() public constant returns (address) {
        return balances.getOwner();
    }

    function isAdminOrOwner(address _address) public constant returns (bool) {
        return balances.isOwner(_address) || balances.isAdmin(_address);
    }

    function isAdmin(address _address) public constant returns (bool) {
        return balances.isAdmin(_address);
    }

    function isOwner(address _address) public constant returns (bool) {
        return balances.isOwner(_address);
    }
}
