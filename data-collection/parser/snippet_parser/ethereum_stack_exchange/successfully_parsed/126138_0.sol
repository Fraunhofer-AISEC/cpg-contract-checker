mapping(address => trnsctn[])   private  transactionsOfAdress;
    struct trnsctn{
        uint256 when;
        uint256 amount;
    }
    uint256 public ege;
    function deposit() public payable {

        transactionsOfAdress[msg.sender].push( trnsctn(block.timestamp, msg.value));
        ege= transactionsOfAdress[msg.sender].length;

    }
    uint256 public ege2= transactionsOfAdress[msg.sender].length;
