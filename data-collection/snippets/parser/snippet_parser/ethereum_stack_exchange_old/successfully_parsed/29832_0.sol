pragma solidity ^0.4.13;



interface tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData) public; }

contract TokenHappyBirthday
 

{
    
    string public name = "HappyBirthdayToken";
    string public symbol = "HBT";
    uint8 public decimals = 4;
    
    
    uint256 public totalSupply = 10**8;

    
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    
    event Transfer(address indexed from, address indexed to, uint256 value);

    
    event Burn(address indexed from, uint256 value);

    
    function TokenHappyBirthday(
        
    ) public {
        
        
        balanceOf[msg.sender] = totalSupply;                
        
        
    }

    
    function _transfer(address _from, address _to, uint _value) internal {
        
        require(_to != 0x0);
        
        require(balanceOf[_from] >= _value);
        
        require(balanceOf[_to] + _value > balanceOf[_to]);
        
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        
        balanceOf[_from] -= _value;
        
        balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
        
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }

    
    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }

    
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    
    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }

    
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);   
        balanceOf[msg.sender] -= _value;            
        totalSupply -= _value;                      
        Burn(msg.sender, _value);
        return true;
    }

    
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value);                
        require(_value <= allowance[_from][msg.sender]);    
        balanceOf[_from] -= _value;                         
        allowance[_from][msg.sender] -= _value;             
        totalSupply -= _value;                              
        Burn(_from, _value);
        return true;
    }
}



contract HBTCrowdsale {

        
    address public beneficiary; 
    uint256 public minAmount = 1 ether; 
    uint256 public maxAmount = 500000 ether; 
    uint256 public maxSupply = 10**8; 
    uint256 public minAcceptedAmount = 10**15 wei; 

    
    uint256 public rateFirstWeek = 125;
    uint256 public rateSecondWeek = 115;
    uint256 public rateThirdWeek = 105;
    uint256 public rateLastWeek = 100;

    uint256 public rateFirstWeekEnd = 5 minutes; 
    uint256 public rateSecondWeekEnd = 10 minutes;
    uint256 public rateThirdWeekEnd = 15 minutes;
    uint256 public rateLastWeekEnd = 20 minutes;

    enum Stages {
        InProgress,
        Ended,
        Withdrawn
    }

    Stages public stage = Stages.InProgress;

    
    uint256 public start;
    uint256 public end;
    uint256 public raised;

    
    TokenHappyBirthday public hbtToken;

    
    mapping (address => uint256) balances;


    
    modifier atStage(Stages _stage) {
        if (stage != _stage) {
            revert();
        }
        _;
    }


    
    modifier onlyBeneficiary() {
        if (beneficiary != msg.sender) {
            revert();
        }
        _;
    }


    
    function balanceOf(address _investor) constant returns (uint256 balance) {
        return balances[_investor];
    }


    
    function HBTCrowdsale( address _tokenAddress, address _beneficiary , uint256 _start ) {

        
        hbtToken = TokenHappyBirthday(0x14723a09acff6d2a60dcdf7aa4aff308fddc160c);
        beneficiary =  _beneficiary; 0xca35b7d915458ef540ade6068dfe2f44e8fa733c; 
        start = 0; 
        end = start + rateLastWeekEnd;
    }

    
    function toHBT(uint256 _wei) returns (uint256 amount) {
        uint256 rate = 0;
        if (stage != Stages.Ended && now >= start && now <= end) {


            
            if (now <= start + rateFirstWeekEnd) {
                rate = rateFirstWeek;
            }

            
            else if (now <= start + rateSecondWeekEnd) {
                rate = rateSecondWeek;
            }

            
            else if (now <= start + rateThirdWeekEnd) {
                rate = rateThirdWeek;
            }

            
            else if (now <= start + rateLastWeekEnd) {
                rate = rateLastWeek;
            }
        }

        return _wei * rate * 10**4 / 1 ether; 
    }


    
    function endCrowdsale() atStage(Stages.InProgress) {

        
        if (now < end) {
            revert();
        }

        stage = Stages.Ended;
    }


    
    function withdraw() onlyBeneficiary atStage(Stages.Ended) {

        
        if (raised < minAmount) {
            revert();
        }


        
        uint256 ethBalance = this.balance;
        if (!beneficiary.send(ethBalance)) {
            revert();
        }

        stage = Stages.Withdrawn;
    }


    
    function refund() atStage(Stages.Ended) {

        
        if (raised >= minAmount) {
            revert();
        }

        uint256 receivedAmount = balances[msg.sender];
        balances[msg.sender] = 0;

        if (receivedAmount > 0 && !msg.sender.send(receivedAmount)) {
            balances[msg.sender] = receivedAmount;
        }
    }


    
    function () payable atStage(Stages.InProgress) {

        
        if (now < start) {
            revert();
        }

        
        if (now > end) {
            revert();
        }

        
        if (msg.value < minAcceptedAmount) {
            revert();
        }

        uint256 received = msg.value;
        uint256 valueInHBT = toHBT(msg.value);



        
        hbtToken.transfer(msg.sender, valueInHBT);

        if (now <= start + rateFirstWeek) {

        } else {

            
        balances[msg.sender] += received; 
        }

        raised += received;

        
        if (raised >= maxAmount || hbtToken.totalSupply() >= maxSupply) {
            stage = Stages.Ended;
        }
    }
}
