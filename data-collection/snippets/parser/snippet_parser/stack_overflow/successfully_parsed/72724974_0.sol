 uint public size;
    
    function setSize(uint s) public {
        size = s;
    } 

    uint[size] arr;  
    
    function SetArray() public {   
        for(uint i=0; i<size; i++){
            arr[i] = i+1;
        }
    }

    function getArray() public view returns(uint[size] memory){
        return arr;
    }
