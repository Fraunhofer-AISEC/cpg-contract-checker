`function getElement(uint _element) public view returns(string memory ArrayString){
    require((_element >= 0) && (_element < MyArray.length),"error invalid entry");
    return MyArray[_element];
}`
