interface ERC20Token {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);

    function transfer(address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}



contract SimpleContract {
    address public owner;
    ERC20Token public TetherToken;
    ERC20Token public USDCoin;

    struct Transaction {
        address payable recipient;
        uint amount;
        string coinType;
    }

    constructor() {
        owner = msg.sender;
        TetherToken = ERC20Token(0x97192842006D54AC767D004c96Dd3723194c8AcC);
        USDCoin = ERC20Token(0xFE724a829fdF12F7012365dB98730EEe33742ea2);
    }


    function batchTransaction(Transaction[] memory transactions) public payable {
        for(uint i = 0; i < transactions.length; i++) {
            if(keccak256(abi.encodePacked(transactions[i].coinType)) == keccak256(abi.encodePacked("ETH"))) {
                transactions[i].recipient.transfer(transactions[i].amount);
            } else if (keccak256(abi.encodePacked(transactions[i].coinType)) == keccak256(abi.encodePacked("USDC"))) {
                USDCoin.transferFrom(msg.sender, transactions[i].recipient, transactions[i].amount);
            } else if (keccak256(abi.encodePacked(transactions[i].coinType)) == keccak256(abi.encodePacked("USDT"))) {
                TetherToken.transferFrom(msg.sender, transactions[i].recipient, transactions[i].amount);
            }
        }
    }

}
