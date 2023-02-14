pragma solidity ^0.5.0;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol;

contract XToken is ERC20, Ownable {
    using SafeMath for uint8;
    using SafeMath for uint256;

    string public constant name = "XToken";
    string public constant symbol = "XTN";
    uint256 public constant decimals = 8;
    uint256 public _totalSupply = 5000000;

    mapping(address => uint) balances;
    mapping(address => string) public  receivedMessage;
    mapping(address => string) public  sentMessage;

    constructor (uint256 _initialSupply) public {
        balances[msg.sender] = _initialSupply;
    }

    function airdrop(address _to, uint256 _value) public onlyOwner returns (bool) {
        transfer(_to, _value);
        return true;
    }

    function sendTxAndMessage(address _from, address _to, uint256 _value, string memory _calldata) public returns (bool) {
        transferFrom(_from, _to, _value);
        sentMessage[_from] = _calldata;
        receivedMessage[_to] = _calldata;
        return true;
    }

    function fetchReceivedMessage(address _to) public view returns (string memory) {
        return receivedMessage[_to];
    }

    function fetchSentMessage(address _from) public view returns (string memory) {
        return sentMessage[_from];  
    }
