airdrop.sol 


pragma solidity ^0.8.0;

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


    constructor() {
        _transferOwnership(_msgSender());
    }

   
    function owner() public view virtual returns (address) {
        return _owner;
    }

    
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

   
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

   
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

   
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }

  
}

interface token{
     function transfer(address recipient, uint256 amount) external returns (bool);

     function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
}

contract airTortuga is Ownable{

      mapping (address=>bool)claimed;
      mapping (address=>bool) _blacklistedaddress;
      uint public amountToken=110000*10**9;
      uint public _airdropDelivered = 0;
      bool public airdropAlive = false;
      
      token _token;
      address[]  _blacklistedaddresses=[...];
      
      function setclaimtokenaddress(address add)public onlyOwner{
          _token=token(add);
      }
      function settokenamounttobeclaimed(uint amount)public onlyOwner{
          amountToken=amount*10**9;
      }
      function removeblackListAddress(address add)public onlyOwner{
           _blacklistedaddress[add]=false;
      }
      function resetairdropnumber()public onlyOwner{
          _airdropDelivered = 0;
      }
      function enableAirdropAlive()public onlyOwner{
          airdropAlive = true;
      }
      function disableAirdropAlive()public onlyOwner{
          airdropAlive = false;
      }
      
      function  blackListAddress()public onlyOwner{
          for (uint i; i<=_blacklistedaddresses.length-1; i++){
          _blacklistedaddress[_blacklistedaddresses[i]]=true;
          }
      }

      function claim()public{
          require(_blacklistedaddress[msg.sender]==false,'cant claim address blacklisted ');
          require(claimed[msg.sender]==false,'already claimed');
          require(airdropAlive==true,'no airdrop alive');
          
          _token.transferFrom(address(this), msg.sender, amountToken );
          _airdropDelivered = _airdropDelivered + 1;
          
          claimed[msg.sender]=true;
      }
    
}
