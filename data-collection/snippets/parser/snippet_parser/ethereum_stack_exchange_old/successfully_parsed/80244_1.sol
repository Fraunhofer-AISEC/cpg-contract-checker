pragma solidity ^0.5.0;

contract Azimuth {

    function getSponsoringCount(uint32) external view returns (uint256) {}

    function sponsoring(uint32, uint) public returns (uint32) {}

}

contract Subscriptions {

    Azimuth azi = Azimuth(0x0baB5299383880A1282F481402b72696Caa2025D);

    address payable internal owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Error: not the contract owner.");
        _;
    }

    mapping(uint32 => uint256) internal balances;
    uint32[] internal subscribers;

    
    function importSubscribers(uint32 _point) internal onlyOwner {
        for (uint i = 0; i < azi.getSponsoringCount(_point); i++) {
            subscribers.push(azi.sponsoring(_point, i));
        }
    }

    mapping(uint32 => bool) internal blacklist;

    function addBlacklist(uint32 _point) public onlyOwner {
        blacklist[_point] = true;
    }

    function unBlacklist(uint32 _point) public onlyOwner {
        blacklist[_point] = false;
    }

    
    function isSubscriber(uint32 _point) internal view returns (bool _isSubscriber) {
        for (uint i = 0; i < subscribers.length; i += 1) {
            if (subscribers[i] == _point) {
                _isSubscriber = true;
            }
        }
        return _isSubscriber;
    }

    
    function subscribe(uint32 _point) public payable {
        require(isSubscriber(_point) == false, "Error: this point is already a subscriber.");
        subscribers.push(_point);
        balances[_point] = msg.value;
        owner.transfer(msg.value);
    }

    
    function pay(uint32 _point) public payable {
        require(isSubscriber(_point) == true, "Error: this point is not a valid subscriber.");
        balances[_point] += msg.value;
        owner.transfer(msg.value);
    }

    
    function checkBalance(uint32 _point) public view onlyOwner returns(uint _balance) {
        require(isSubscriber(_point) == true, "Error: this point is not a valid subscriber.");
        return (balances[_point]);
    }

    
    
    uint internal billingRate = 0;

    
    function bill() public onlyOwner {
        for (uint i = 0; i < subscribers.length; i += 1) {
            if (balances[subscribers[i]] < billingRate) {
                boot(subscribers[i]);
            } else {
                balances[subscribers[i]] -= billingRate;
            }
        }
    }

    
    function boot(uint32 _point) public onlyOwner {
        balances[_point] = 0;
        for (uint i = 0; i < subscribers.length; i++) {
            if (subscribers[i] == _point) {
                delete subscribers[i];
                break; 
            }
        }
    }

    
    function setRate(uint _amount) public onlyOwner {
        billingRate = _amount;
    }
}
