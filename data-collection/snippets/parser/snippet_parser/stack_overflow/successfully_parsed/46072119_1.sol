contract Sale {
    address owner;

    address public founderAddress;
    uint256 public constant foundersAmount = 50;

    MyToken public token = new MyToken(1000);


    uint256 public issuedTokensAmount = 0;

    function Sale() {
        owner = msg.sender;
        founderAddress = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c;
        token.transfer(founderAddress, foundersAmount);
    }

    function() external payable {
        token.transfer(msg.sender, 1);
        owner.transfer(msg.value);
    }   
}
