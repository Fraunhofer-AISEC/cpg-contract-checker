    function addElement(string memory input, string memory array_name) public onlyOwner returns(bool success)
     {
         {array}.push(input);
         return true;
    }
