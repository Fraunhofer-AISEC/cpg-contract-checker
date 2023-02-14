

import "./IERC20.sol"; import "./ILendingPool.sol";


contract DeFiBank {
    address[] public depositors;
    uint public immutable amount;
    uint public immutable fee;
    bool public isWithdrawing;
    mapping(address => uint) public bankBalance;
    mapping(address => bool) public hasDeposited;

    
    ILendingPool pool = ILendingPool(0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9);
    
    IERC20 usdc = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    
    IERC20 aUsdc = IERC20(0x9bA00D6856a4eDF4665BcA2C2309936572473B7E);

    constructor(uint _amount) {
        amount = _amount;
        
        fee = amount * 5 / 1000;
    }

    function deposit() public payable {
        
        bool success = usdc.transferFrom(msg.sender, address(this), amount);

        
        require(success, "transfer of funds failed");

        
        
        uint newAmount = (amount - fee);

        
        
        
        require(usdc.approve(address(pool), newAmount), 'approval failed');

        
        pool.deposit(address(usdc), newAmount, address(this), 0);

        
        bankBalance[msg.sender] = bankBalance[msg.sender] + newAmount;

        
        if(!hasDeposited[msg.sender]) {
            depositors.push(msg.sender);
        }

        
        hasDeposited[msg.sender] = true;
    }
    
    function withdrawlInterest() public {
        uint interest = (aUsdc.balanceOf(address(this)) - (amount));

        
        
        require(aUsdc.approve(address(pool), interest), "approval failed");

        
        require(!isWithdrawing, "reentrancy detected");
        isWithdrawing = true;

        
        
        
        
        
        
        uint[] memory withdrawn = new uint[](depositors.length);
        for(uint i = 0; i < depositors.length; i++) {
            withdrawn[i] = pool.withdraw(address(usdc), interest, depositors[i]);

            
            
            
            require(withdrawn[i] <= interest, "Incorrect amount withdrawn");
        }
        isWithdrawing = false;

        for(uint i = 0; i < depositors.length; i++) {
            
            if(withdrawn[i] > 0) {
                
                bankBalance[depositors[i]] = bankBalance[depositors[i]] - withdrawn[i]; 
            }
        }
    }

    
    function withdrawBalance() public {
        uint balance = aUsdc.balanceOf(address(this));

        
        require(aUsdc.approve(address(pool), balance));

        
        require(!isWithdrawing, "reentrancy detected");
        isWithdrawing = true;

        uint[] memory withdrawn2 = new uint[](depositors.length);
        for(uint i = 0; i < depositors.length; i++) {
            withdrawn2[i] = pool.withdraw(address(usdc), balance, depositors[i]);

            
            require(withdrawn2[i] <= balance, "Incorrect amount withdrawn");
        }
        isWithdrawing = false;

        for(uint i = 0; i < depositors.length; i++) {
            
            bankBalance[depositors[i]] = 0;

            
            delete depositors[i];
        }  
    } } 
