
pragma solidity 0.8.9;
contract main{
    struct data{ 
        string data;       
        uint num1;
        uint num2;
        uint num3;
    }

    mapping(string => data[]) public Data;

    address internal owner;

    
    function getOwner() public view returns(address){
        return owner;
    }

    modifier onlyOwner(){
        require(getOwner()==msg.sender, "solo el creado puede modificar.");
        _;
    }
    
    function arrayStructData( data[] memory _data) public{
        for(uint i=0; i<_data.length; i++){ 
            Data[_data[i].data].push(data(_data[i].data,_data[i].num1,_data[i].num2,_data[i].num3));
           
        }
    }
}
