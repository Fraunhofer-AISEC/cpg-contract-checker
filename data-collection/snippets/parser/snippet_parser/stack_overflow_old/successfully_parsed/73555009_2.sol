contract MiniTest {

    string public letters = "abcdefghijklmnopqrstuvwxyz";
    
    uint counter =1;

    
    function randomString(uint size) public  payable returns(string memory){
        bytes memory randomWord=new bytes(size);
        
        bytes memory chars = new bytes(26);
        chars="abcdefghijklmnopqrstuvwxyz";
        for (uint i=0;i<size;i++){
            uint randomNumber=random(26);
            
            randomWord[i]=chars[randomNumber];
        }
        return string(randomWord);
    }

    function random(uint number) public payable returns(uint){
        counter++;
        return uint(keccak256(abi.encodePacked(block.timestamp,block.difficulty,  
        msg.sender,counter))) % number;
    }
}
