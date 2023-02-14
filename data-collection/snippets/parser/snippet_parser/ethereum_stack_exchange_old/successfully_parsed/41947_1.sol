    pragma solidity ^0.4.20;
        

        contract ABCD is Moderated {
            using SafeMath for uint256;

                string public name = "ABCD22";
                string public symbol = "ABCD Eon Exchange Tokens22";
                uint8 public decimals = 18;

                uint256 public maximumTokenIssue = 30000000 * 10**18;

                mapping(address => uint256) internal balances;
                mapping (address => mapping (address => uint256)) internal allowed;

                uint256 internal totalSupply_;

                event Approval(address indexed owner, address indexed spender, uint256 value);
                event Transfer(address indexed from, address indexed to, uint256 value);

                
                function totalSupply() public view returns (uint256) {
                    return totalSupply_;
                }

                
                function transfer(address _to, uint256 _value) public ifUnrestricted onlyPayloadSize(2) returns (bool) {
                    return _transfer(msg.sender, _to, _value);
                }

                
                function transferFrom(address _from, address _to, uint256 _value) public ifUnrestricted onlyPayloadSize(3) returns (bool) {
                    require(_value <= allowed[_from][msg.sender]);
                    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
                    return _transfer(_from, _to, _value);
                }

                function _transfer(address _from, address _to, uint256 _value) internal returns (bool) {
                    
                    require(_to != address(0x0) && _to != address(this));
                    
                    require(_value <= balances[_from]);
                    
                    balances[_from] = balances[_from].sub(_value);
                    
                    balances[_to] = balances[_to].add(_value);
                    
                    Transfer(_from, _to, _value);
                    return true;
                }

                
                function balanceOf(address _owner) public view returns (uint256) {
                    return balances[_owner];
                }

                
                function approve(address _spender, uint256 _value) public ifUnrestricted onlyPayloadSize(2) returns (bool sucess) {
                    
                    require(allowed[msg.sender][_spender] == 0 || _value == 0);
                    allowed[msg.sender][_spender] = _value;
                    Approval(msg.sender, _spender, _value);
                    return true;
                }

                
                function allowance(address _owner, address _spender) public view returns (uint256) {
                    return allowed[_owner][_spender];
                }

                
                function increaseApproval(address _spender, uint256 _addedValue) public ifUnrestricted onlyPayloadSize(2) returns (bool) {
                    require(_addedValue > 0);
                    allowed[msg.sender][_spender] = allowed[msg.sender][_spender].add(_addedValue);
                    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
                    return true;
                }

                
                function decreaseApproval(address _spender, uint256 _subtractedValue) public ifUnrestricted onlyPayloadSize(2) returns (bool) {
                    uint256 oldValue = allowed[msg.sender][_spender];
                    require(_subtractedValue > 0);
                    if (_subtractedValue > oldValue) {
                        allowed[msg.sender][_spender] = 0;
                    } else {
                        allowed[msg.sender][_spender] = oldValue.sub(_subtractedValue);
                    }
                    Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
                    return true;
                }

                
                function generateTokens(address _to, uint _amount) internal returns (bool) {
                    totalSupply_ = totalSupply_.add(_amount);
                    balances[_to] = balances[_to].add(_amount);
                    Transfer(address(0x0), _to, _amount);
                    return true;
                }
                
                function () external payable {
                    revert();
                }

                function ABCD() public {
                    generateTokens(msg.sender, maximumTokenIssue);
                }

  }
