
pragma solidity ^0.8.15;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Lottery {

    event TicketsBought(address playerAddress, uint256 quantity, uint256 ticketPrice);
    event WinnerPicked(ticket ticket, uint256 amount);

    struct ticket {
        address walletAddress;
        uint256 ticketId;
    }

    uint256 currentTicketId = 0;

    address gamblinoAddress = 0xE9FEA6A6A1a8BB99E0C888c93A06D22f804A5fFA;
    uint public ticketPrice = 50 * 10**18;
    address public manager;
    ticket public winner;
    ticket[] public tickets;

    uint256 public balance;

    constructor() {
        manager = msg.sender;
        balance = 0;
    }

    function getPlayerAddresses() private view returns (address[] memory) {
        address[] memory addresses;

        for(uint i = 0; i < tickets.length; i++) {
             addresses[i] = tickets[i].walletAddress;
        }

        return addresses;
    }

    function buyTickets(uint256 quantity) public payable {
        uint256 amount = ticketPrice * quantity;
        GamblinoToken gamblinoToken = GamblinoToken(gamblinoAddress);
        uint256 allowance = gamblinoToken.allowance(msg.sender, address(this));
        uint256 playerBalance = gamblinoToken.balanceOf(msg.sender);
        require(playerBalance >= amount, 'Check token balance');
        require(allowance >= amount, 'Check the token allowance');

        balance = balance + amount;

        for (uint i = 0; i < quantity; i++) {
            ticket memory t = ticket(msg.sender, currentTicketId);
            tickets.push(t);
            currentTicketId++;
        }

        gamblinoToken.transferFrom(msg.sender, address(this), amount);
        emit TicketsBought(msg.sender, quantity, ticketPrice);

    }

    function random() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, getPlayerAddresses())));
    }

    function pickWinner() public {
        uint index = random() % tickets.length;
        uint256 amount = balance;

        GamblinoToken gamblinoToken = GamblinoToken(gamblinoAddress);
        
        gamblinoToken.transfer(tickets[index].walletAddress, balance);
        
        balance = 0;
        
        winner = tickets[index];
        
        currentTicketId = 0;
        
        delete tickets;

        emit WinnerPicked(winner, amount);
    }

    function getTickets() public view returns (ticket[] memory) {
        return tickets;
    }

    
    modifier restricted() {
        require(msg.sender == manager);
        _;
    }
}

interface ERC20Interface {
    function totalSupply() external view returns (uint256);
    function balanceOf(address tokenOwner) external view returns (uint balance);
    function allowance(address tokenOwner, address spender) external view returns (uint remaining);
    function transfer(address to, uint tokens) external returns (bool success);
    function approve(address spender, uint tokens) external returns (bool success);
    function transferFrom(address from, address to, uint tokens) external returns (bool success);
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract GamblinoToken is ERC20Interface {
    function totalSupply() public override view returns (uint256) {}
    function balanceOf(address tokenOwner) public override view returns (uint) {}
    function transfer(address receiver, uint numTokens) public override returns (bool) {}
    function approve(address delegate, uint numTokens) public override returns (bool) {}
    function allowance(address owner, address delegate) public override view returns (uint) {}
    function transferFrom(address owner, address buyer, uint numTokens) public override returns (bool) {}
}
