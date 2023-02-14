string a;

function setA(string memory x)public{
    a = x;
}

function reverseStr() public view returns(string memory){
    bytes memory entString = bytes(a);

    string memory revStrings =new  string(entString.length);

    bytes memory revString = bytes(revStrings);

    uint k=0;
    require(revString.length>0);

    for(uint i=revString.length;i>0 ;i--){
       revString[k++] = entString[i];
   }

    return string(revString);
}
