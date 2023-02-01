 *Submitted for verification at BscScan.com on 2021-06-22
*/



pragma solidity >=0.7.0 <0.9.0;


contract Owner {

    address private owner;
    
    
    event OwnerSet(address indexed oldOwner, address indexed newOwner);
    
    
    modifier isOwner() {
        
        
        
        
        
        require(msg.sender == owner, "Caller is not owner");
        _;
    }
    
    
    constructor() {
        owner = msg.sender; 
        emit OwnerSet(address(0), owner);
    }

    
    function changeOwner(address newOwner) public isOwner {
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
    }

    
    function getOwner() external view returns (address) {
        return owner;
    }
}


pragma solidity ^0.8.4;

interface IERC20 {
    function balanceOf(address _owner) external view returns (uint balance);
    function transfer(address _to, uint _value) external returns (bool success);
    function transferFrom(address _from, address _to, uint _value) external returns (bool success);
    function approve(address _spender, uint _value) external returns (bool success);
    function allowance(address _owner, address _spender) external view returns (uint remaining);
}

contract infinity_text is Owner {
    
    
    event Transfer(address indexed from, address indexed to, uint256 value);

    event message_added(string message, uint price, uint timestamp);
    event error(string message);
    event nouv_cote(uint cote);
    uint public nb_msg;
    
    address address_usdt;
    IERC20 public usdt_contract;
    function change_usdt_crypto(address nouv) isOwner public {
        usdt_contract = IERC20(nouv);
    }
    
    function withdraw_owner() isOwner public {
        usdt_contract.transfer(msg.sender, usdt_contract.balanceOf(address(this)));
    }
    
    function change_cote(uint nouv) isOwner public {
        cote = nouv * 100000000000000; 
        emit nouv_cote(cote);
    }
    
    uint public cote;
    
    struct mssg {
        address user_sender;
        string message;
        uint price;
        uint64 time;
    }
    
    mssg[] public lst_msg;
    mapping(address => uint200) public signal;
    
    function len(string memory strr) internal pure returns(uint) {
        return bytes(strr).length;
    }
    
    function set_signal_address(address _address) isOwner public {
        signal[_address] = signal[_address] + 1;
    }
    
    function get_address_signaled(address _address) external view returns(uint) {
        return signal[_address];
    }
    
    function add_message(string memory _message, uint32 _amount_add, uint64 time) external {
        require(signal[msg.sender] <= 100,'address t reported');
        require(_amount_add >=1, 'min => 1 usdt');
        uint amount_msg = (_amount_add * 1000000000000000000) + (len(_message) * cote);
        usdt_contract.transferFrom(msg.sender, address(this), amount_msg);
        emit Transfer(msg.sender, address(this), amount_msg);
        nb_msg = nb_msg + 1;
        lst_msg.push(mssg(msg.sender, _message, amount_msg, time));
    }
    
}
