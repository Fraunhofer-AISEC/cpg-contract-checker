pragma solidity ^0.5.0; 
contract FractionalizedAssets {

    address public owner; 

    mapping (address => uint) public tokenBalanceOf; 

    constructor() public { 
        owner = msg.sender; 
    }

    function mint(uint256 _amount, address _to) external onlyOwner {
        require(_amount > 0);  
        tokenBalanceOf[_to] += _amount; 
    }

    function transfer(address _from, address _to, uint256 _tokens) external { 
        require(tokenBalanceOf[_from] >=_tokens && _tokens > 0); 
        tokenBalanceOf[_from] -=_tokens; 
        tokenBalanceOf[_to] +=_tokens; 
        emit Transfer(_from,_to,_tokens); 
    }
    
    event Transfer(address indexed from, address indexed to, uint256 value);

    modifier onlyOwner() {
        require( msg.sender == owner );
        _;
    }

    function burn(uint256 _amount, address _from) external onlyOwner { 
        require(_amount > 0);
        tokenBalanceOf[_from] -= _amount; 
    }

    function totalSupply() public view returns (uint256) { 
       return address(this).balance; 
    }

    function balanceOf(address _owner) public view returns (uint256) { 
        return tokenBalanceOf[_owner]; 
    }

    function transferFrom(address _from, address _to, uint256 _tokens) external { 
        require(_tokens > 0 && tokenBalanceOf[_from] >=_tokens); 
        tokenBalanceOf[_from] -=_tokens; 
        tokenBalanceOf[_to] +=_tokens; 
        emit Transfer(_from,_to,_tokens); 
    }

    function approve(address _spender, uint256 _tokens) external { 
        allowed[msg.sender][_spender] = _tokens; 
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return allowed[_owner][_spender]; 
    }

    function transferFrom(address _from, address _to, uint256 _tokens) external { 
        require(_tokens > 0 && tokenBalanceOf[_from] >=_tokens && allowed[_from][msg.sender] >=_tokens); 
        tokenBalanceOf[_from] -= _tokens; 
        tokenBalanceOf[_to] += _tokens; 
        allowed[_from][msg.sender] -= _tokens; 
        emit Transfer(_from,_to,_tokens); 
    }

    function increaseApproval(address _spender, uint256 _addedValue) external { 
        allowed[msg.sender][_spender] += _addedValue; 
    }
    
    function decreaseApproval(address _spender, uint256 _subtractedValue) external {
        allowed[msg.sender][_spender] -= _subtractedValue; 
    }

    function burnFrom(address _from, uint256 _tokens) external { 
        require(_tokens > 0 && tokenBalanceOf[_from] >=_tokens && allowed[_from][msg.sender] >=_tokens); 
        tokenBalanceOf[_from] -=_tokens; 
        allowed[_from][msg.sender]-=_tokens; 
        emit Burn(_from,_to,_tokens); 
    }

    event Burn(address indexed from, address indexed to, uint256 value);

    function burnAll(address _from) external onlyOwner { 
        uint256 balance = tokenBalanceOf[_from]; 
        require(balance > 0); 
        tokenBalanceOf[_from] = 0; 
        emit Burn(_from, address(0), balance); 
    }

    function pause() external onlyOwner { 
        paused = true; 
        emit Pause(); 
    }

    function unpause() external onlyOwner {
        paused = false; 
    }

    event Pause();
    
    function renounceOwnership() external onlyOwner { 
        emit OwnershipRenounced(owner); 
        owner = address(0); 
    }

    event OwnershipRenounced(address indexed previousOwner);


    function transferOwnership(address _newOwner) external onlyOwner { 
        require(_newOwner != address(0)); 
        emit OwnershipTransferred(owner, _newOwner); 
        owner = _newOwner; 
    } 

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    function reclaimEther() external onlyOwner { 
        owner.transfer(address(this).balance); 
        emit ReclaimEther(); 
    } 
    
    event ReclaimEther();

    function destroy() external onlyOwner { 
        selfdestruct(owner); 
        emit Destroy(); 
    }
 
    event Destroy();
    
    function updateOwner(address _newOwner) external onlyOwner { 
        require(_newOwner != address(0)); 
        emit OwnershipTransferred(owner, _newOwner); 
        owner = _newOwner; 
    }

    function updateTokenName(string calldata _name) external onlyOwner { 
        tokenName = _name; 
        emit TokenNameUpdated(_name); 
    }

    event TokenNameUpdated(string indexed newTokenName);
}
