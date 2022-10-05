 pragma solidity ^0.4.20;

    
    contract Moderated {

        address public moderator;

        bool public unrestricted;

        modifier onlyModerator {
            require(msg.sender == moderator);
            _;
        }

        modifier ifUnrestricted {
            require(unrestricted);
            _;
        }

        modifier onlyPayloadSize(uint numWords) {
            assert(msg.data.length >= numWords * 32 + 4);
            _;
        }

        function Moderated() public {
            moderator = msg.sender;
            unrestricted = true;
        }

        function reassignModerator(address newModerator) public onlyModerator {
            moderator = newModerator;
        }

        function restrict() public onlyModerator {
            unrestricted = false;
        }

        function unrestrict() public onlyModerator {
            unrestricted = true;
        }

        
        
        function extract(address _token) public returns (bool) {
            require(_token != address(0x0));
            Token token = Token(_token);
            uint256 balance = token.balanceOf(this);
            return token.transfer(moderator, balance);
        }

        function isContract(address _addr) internal view returns (bool) {
            uint256 size;
            assembly { size := extcodesize(_addr) }
            return (size > 0);
        }
    }

    
    contract Token {

        function totalSupply() public view returns (uint256);
        function balanceOf(address who) public view returns (uint256);
        function transfer(address to, uint256 value) public returns (bool);
        function transferFrom(address from, address to, uint256 value) public returns (bool);
        function approve(address spender, uint256 value) public returns (bool);
        function allowance(address owner, address spender) public view returns (uint256);
        event Transfer(address indexed from, address indexed to, uint256 value);
        event Approval(address indexed owner, address indexed spender, uint256 value);

 }
