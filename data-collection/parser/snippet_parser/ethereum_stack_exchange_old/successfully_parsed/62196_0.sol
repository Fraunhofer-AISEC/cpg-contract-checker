contract Broker
{
    using SafeMathOZ for uint256;
    Target                      public target;
    mapping(address => uint256) public m_balance;
    mapping(address => uint256) public m_reward;

    constructor(address _target) public {
        target = Target(_target);
    }

    function () public payable {
        m_balance[msg.sender] = m_balance[msg.sender].add(msg.value);
    }

    function deposit() public payable {
        m_balance[msg.sender] = m_balance[msg.sender].add(msg.value);
    }

    function depositFor(address _account) public payable {
        m_balance[_account] = m_balance[_account].add(msg.value);
    }

    function withdraw(uint256 _amount) public {
        m_balance[msg.sender] = m_balance[msg.sender].sub(_amount);
        msg.sender.transfer(_amount);
    }

    function setReward(uint256 _reward) public {
        m_reward[msg.sender] = _reward;
    }

    function XXX(Data data) public returns (bytes32) {
        uint256 gasBefore = gasleft();
        bytes32 result = target.XXX(data);
        address payer = data.requester;
        uint256 price = tx.gasprice * (87000 + gasBefore - gasleft()) + m_reward[payer];
        m_balance[payer] = m_balance[payer].sub(price);
        msg.sender.transfer(price);
        return result;
    }
}
