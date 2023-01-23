struct Data
{
    uint id;
    
    string name;
    string Surname
    string moreInfo;
  
}
mapping(address => Data[]) private ownerauto;
address[] private owners
string[] private linksStorage;

function setdata(address _acc, string[] memory _data) external 
{
    requireData(_data)==false,"Data is empty!!!");
    Data memory autom;
    autom.id = ownerauto[_acc].length;
    autom.name = _data[0];
    autom.Surname = _data[1];
    autom.moreInfo = _data[2];
    linksStorage.push(_data[3]);

   
    owners.push(_acc);
}

function getAllData() external view  returns(string[] memory)
{     
    uint index = 0;
    uint countDiag = 0;

    for(uint i=0;i<docs.length;i++)
    {
        address own = owners[i];
        countDiag +=ownerauto[own ].length;
    }

    string[] memory data = new string[](countDiag+2);
    for(uint i =0;i<owners.length;i++)
    {
        address own = owners[i];
        for(uint j=0;j<doctor_diagnosis[own].length;j++)
        {    
            data[index] = _getDiagnos(ownerauto[own ][j]);
            assembly
            {
                index:=add(index,0x1)
            }
            
        }
    }
    data[index] = _getLinksIPFS();
    return data;
}
function _getDiagnos(Data memory _own) private pure returns(string memory)
{
    string memory id = _own.id.uintTostring();
    
    string memory names = _own.name;
    string memory Surname = _own.Surname;
    string memory infoDiag = _own.moreInfo;
  
    string memory all = "";
    all = string(abi.encodePacked("id:" , id , "/name:" , name , "/surname :" ,
                Surname , "/i:", infoDiag ,";"));

    return all;
}
 function _getLinksIPFS() private view returns(string memory)
{
    
}


function uintTostring(uint _number) internal pure returns (string memory _uintAsString) 
{
    bytes memory curNumber;
    if(_number==0)
        return "0";
    assembly
    {
        function calculateLenBytes(_num) -> len 
        {
            let num := _num
            for { } gt(num,0) {}
            {
                len:=add(len,0x1)
                num:= div(num,0xA)
            }
        }
        
        let length := calculateLenBytes(_number)
        let indexByte := length
        let temp
        curNumber := mload(length)
        for { } gt(_number,0) {}
        { 
            temp := add(  0x30, sub(_number, mul(div(_number,0xA),0xA)))

            mstore(add(curNumber,indexByte),temp)
            indexByte := sub(indexByte,0x1)
            _number:= div(_number,0xA)
        }
        mstore(curNumber,length)
    }

    return string(curNumber);
}
