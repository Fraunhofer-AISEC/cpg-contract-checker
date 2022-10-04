pragma solidity ^0.4.11;

contract BasicLottery {

        
            mapping(uint => address) public gamblers;


            uint public my_length; 
            uint public random; 

            function BasicLottery(){
                my_length == 0;
            }
        
        
        

        function bet() payable {

        
        
        require(msg.value == 1);

        my_length +=1;

        gamblers[my_length] = msg.sender;

        if (my_length == 5) {
            
            random = uint(block.blockhash(block.number-1))%5 + 1;
            gamblers[random].transfer(5);
            my_length == 0;

        }
    }
}
