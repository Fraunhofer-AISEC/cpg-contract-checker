    pragma solidity ^0.5.11;

    import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/token/ERC20/ERC20.sol";

    contract Token is ERC20 {}

    contract Depository {
        mapping(address => uint256) public balances;

        function deposit(uint256 amount) external {
            require(amount > 0);

            Token token = Token(0xFab46E002BbF0b4509813474841E0716E6730136);
            require(token.transferFrom(msg.sender, address(this), amount), "The deposit failed");
            balances[msg.sender] += amount;
        }
    }

    contract Owner {
        function transfer(uint256 amount) external {
            require(amount > 0);

            Token token = Token(0xFab46E002BbF0b4509813474841E0716E6730136);
            
            token.approve(0xEa917F373afa9F7F4AdB31a01D4c91E763De6502, amount);

            Depository depository = Depository(0xEa917F373afa9F7F4AdB31a01D4c91E763De6502);
            depository.deposit(amount);

        }
    }
