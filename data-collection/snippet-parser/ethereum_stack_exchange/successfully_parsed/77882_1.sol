pragma solidity ^ 0.4.13;
contract exercise3
{
    mapping (string => mapping(string => int)) gameResult;
    address player1;
    bool hasRight1; 

    address player2;
    bool hasRight2; 
    address public rec = 0x6F40147fE553b2Fb16A41C57CC87Ab72678d85C2;
    string public choice1;
    string public choice2;
    function deposit1() public payable {
        require(msg.value == 5 ether);
        rec.transfer(msg.value);
        player1 = msg.sender; 
        hasRight1 = true;
     }
     function deposit2() public payable {
        require(msg.value == 5 ether);
        rec.transfer(msg.value);
        player2 = msg.sender; 
        hasRight2 = true;
     }
    function rps() public
    {   
        gameResult["rock"]["rock"] = 0;
        gameResult["rock"]["paper"] = 2;
        gameResult["rock"]["scissors"] = 1;
        gameResult["paper"]["rock"] = 1;
        gameResult["paper"]["paper"] = 0;
        gameResult["paper"]["scissors"] = 2;
        gameResult["scissors"]["rock"] = 2;
        gameResult["scissors"]["paper"] = 1;
        gameResult["scissors"]["scissors"] = 0;
    }

    function play (string choice) public 
    {     
        if (msg.sender == player1&&hasRight1 == true)
            choice1 = choice;
        else if (msg.sender == player2 &&hasRight2 == true)
            choice2 = choice;

    }
    function sendReward()  public payable
    {
        if (bytes(choice1).length != 0 && bytes(choice2).length != 0)
        {

            int winner = gameResult[choice1][choice2];
            if (winner == 1)

                player1.transfer(10 ether);
            else if (winner == 2)
                player1.transfer(10 ether);
            else
            {
                player1.transfer(5 ether);
                player2.transfer(5 ether);

            }


        }
    }
}
