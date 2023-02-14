
pragma solidity ^0.8.4;


import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';
import '@openzeppelin/contracts/security/PullPayment.sol';


contract RobocopPoster is ERC721, Ownable, PullPayment {

    
    uint256 public mintPrice;
    uint256 public totalSupply;
    uint256 public maxSupply;
    uint256 public maxPerWallet;
    bool public mintEnabled;
    mapping (address => uint256) public walletMints;

    
        
    constructor() payable ERC721('RobocopPoster', 'SFFPC') {
        mintPrice = 1 ether;
        totalSupply = 0;
        maxSupply = 1000;
        maxPerWallet = 3;
    }

    event Received(address, uint);
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    
    function setMintEnabled(bool mintEnabled_) external onlyOwner {
        mintEnabled = mintEnabled_;
    }

    function withdrawPayments(address payable payee) public override onlyOwner virtual {
        super.withdrawPayments(payee);
    }

    function accountBalance() public view returns (uint256) {
        return (address(this).balance);
    }

    function mint(uint256 quantity_) public payable {
        require(mintEnabled, 'Minting not enabled.');
        require(msg.value == quantity_ * mintPrice, 'wrong mint value');
        require(totalSupply + quantity_ <= maxSupply, 'sold out');
        require(walletMints[msg.sender] + quantity_ <= maxPerWallet, 'exceed max wallet');
        walletMints[msg.sender] += quantity_;
        _asyncTransfer(address(this), msg.value);

        for (uint i = 0; i < quantity_; i++) {
            uint256 newTokenId = totalSupply + 1;
            totalSupply++;
            _safeMint(msg.sender, newTokenId);
        }
    }
}
