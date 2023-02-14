

pragma solidity ^0.8.1;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract AliceCoin is ERC20 {
    constructor(uint256 supply) ERC20("AliceCoin", "ALI") {
        _mint(msg.sender, supply);
    } 
}

contract BobCoin is ERC20{
    constructor(uint256 supply) ERC20("BobCoin", "BOB"){
        _mint(msg.sender, supply);
    }
}



contract AtomicSwap{
    ERC20 public tokenA;
    ERC20 public tokenB;

     
     constructor(address _addressAliceCoin, address _addressBobCoin) payable {
        tokenA = ERC20(_addressAliceCoin);
        tokenB = ERC20(_addressBobCoin);
     }

     
    struct Swap {
        
        
        address payable recipient;
        
        address payable Owner;
        
        address tokenAddress;
        
        uint256 amount;
        
        
        uint256 timelock;
        
        bytes32 Hashlock; 
        
        string secret; 
        
        bool refunded; 
        
        bool claimed;
    }

    mapping(address => mapping(address => uint256)) private _allowances;
    mapping(bytes32 => Swap) public swaps;


    event NewAtomicSwap(
        bytes32 swapId,
        address payable Owner,
        address payable recipient,
        address tokenAddress,
        uint256 amount,
        bytes32 Hashlock,
        uint256 timelock
    );
    event Claimed(
        bytes32 swapId
    );
    event Refunded(
        bytes32 swapId
    );

    

    modifier checkAllowance(address _token, address _Owner, uint256 _amount){
        require(_amount > 0, "Token amount must be greater than 0");
        require(ERC20(_token).allowance(_Owner, address(this)) >= _amount, "Allowance must be greater than 0");
        _;
    }

    modifier futureTimelock(uint256 _time){
        require(_time > block.timestamp, "timelock has to be set in the future");
        _;
    }

    modifier claimable(bytes32 _swapId) {
            require(swaps[_swapId].recipient == msg.sender, "This is not the right recipient");
            require(swaps[_swapId].claimed == false, "already claimed");
            require(swaps[_swapId].refunded == false, "already refunded");
            _;
    }

    modifier matchingHashlocks(bytes32 _swapId, bytes32 _x){
        require(
            swaps[_swapId].Hashlock == keccak256(abi.encodePacked(_x)),
            "incorrect hashlock"
        );
        _;
    }

    modifier existingContract(bytes32 _swapId) {
        require(haveContract(_swapId), "contract does not exist");
        _;
    }

    modifier refundable(bytes32 _swapId) {
        require(swaps[_swapId].Owner == msg.sender, "Only the sender of this coin can refund");
        require(swaps[_swapId].refunded == false, "Already refunded");
        require(swaps[_swapId].claimed == false, "Already claimed");
        require(swaps[_swapId].timelock <= block.timestamp, "Timelock not yet passed");
        _;
    }

    function newSwap(
        address payable _recipient, 
        bytes32 _Hashlock,
        uint256 _timelock,
        address _tokenAddress,
        uint256 _amount
        )
    public  
    payable
    checkAllowance(_tokenAddress, msg.sender, _amount)
    futureTimelock(_timelock)
    returns(bytes32 swapId)
    {
        swapId = keccak256(
            abi.encodePacked(
                msg.sender,
                _recipient,
                _tokenAddress,
                _amount,
                _Hashlock,
                _timelock
            )
        );

        if(haveContract(swapId))
            revert("Contract exists");

        
        if(!AliceCoin(_tokenAddress).transferFrom(_recipient, address(this), _amount))
            revert("transfer failed");



        swaps[swapId] = Swap({
            recipient : _recipient,
            Owner : payable(_recipient),
            tokenAddress : _tokenAddress,
            amount : _amount,
            timelock : block.timestamp + 60000,
            Hashlock : _Hashlock,
            secret : "djkcoeuxhjkdf",
            
            
            
            refunded : false,
            claimed: false

        });

        emit NewAtomicSwap(
            swapId,
            payable(_recipient),
            _recipient,
            _tokenAddress,
            _amount,
            _Hashlock,
            _timelock
        );     
    }

    
    

    function claim(bytes32 _swapId, bytes32 _Hashlock) public payable claimable(_swapId) matchingHashlocks(_swapId, _Hashlock) existingContract(_swapId) returns(bool){
        Swap storage s = swaps[_swapId];
        s.Hashlock = _Hashlock;
        s.claimed = true;
        AliceCoin(s.tokenAddress).transfer(s.recipient, s.amount);
        emit Claimed(_swapId);
        return true;
    }

    function refund(bytes32 _swapId) external existingContract(_swapId) refundable(_swapId) returns(bool) {   
       Swap storage s = swaps[_swapId];
       s.refunded = true;
       AliceCoin(s.tokenAddress).transfer(s.Owner, s.amount);
       emit Refunded(_swapId);
       return true;
    }

    function haveContract(bytes32 _swapId) internal view returns (bool available){
        available = (swaps[_swapId].Owner != address(0));
    }
}
