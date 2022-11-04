
contract Test_Lottery {

    address payable[] public Players;
    mapping (address => bytes32) public PlayersCheck;

    address payable public admin;

    receive() external payable {
        require(msg.value >= 0.001 ether , "You haven't entered enough into the pot!");
        require(msg.sender != admin , "The admin cannot play!");

            if (PlayersCheck[msg.sender]=="Y") {
                 revert() ; 
            } else {
                Players.push(payable(msg.sender));
                PlayersCheck[msg.sender]="Y" ;
            }          
    }

}