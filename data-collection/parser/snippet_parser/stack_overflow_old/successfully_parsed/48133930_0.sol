contract zero_one {

address public player_one;
address public player_two;
uint public player_one_amount;
uint public player_two_amount;


function zero_one() public{
    reset();
}

function play() public payable{
    
    if(player_one != address(0) && player_two != address(0)) throw;

    
    else if(player_one == address(0) && player_two == address(0)){
        player_one=msg.sender;
        player_one_amount = msg.value;
    }

    
    else{
        player_two = msg.sender;
        player_two_amount = msg.value;

        
        if(player_two_amount>player_one_amount){
            player_one.transfer(player_one_amount+player_two_amount);
            reset();
        }
        else if(player_two_amount<player_one_amount){
            player_two.transfer(player_one_amount+player_two_amount);
            reset();
        }
        else{
            
            player_one.transfer(player_one_amount);
            player_two.transfer(player_two_amount);
            reset();
        }
    }
}

function reset() internal{
    player_one = address(0);
    player_two = address(0);
    player_one_amount = 0;
    player_two_amount = 0;
}
}
