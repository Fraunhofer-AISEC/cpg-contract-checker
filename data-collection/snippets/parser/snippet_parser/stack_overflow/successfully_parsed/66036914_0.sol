    pragma solidity 0.5.12;

    contract Hello {
    
    string public helloStr = "Hello, world 2!";
    
    uint[] public nums = [10, 20, 30];
    
    function getHello() public view returns (string memory) {
        
        
        return helloStr;
        
    }
    
    function pushNewElement(uint newElement) public returns (uint) {
        
        nums.push(newElement);
        
    }
    
    function popLastElement () public returns (uint) {
        
        nums.pop();
        
    }
    
   
    function setHello(string memory newHello) public {
        
        
        helloStr = newHello;
        
    }
    
    
}
