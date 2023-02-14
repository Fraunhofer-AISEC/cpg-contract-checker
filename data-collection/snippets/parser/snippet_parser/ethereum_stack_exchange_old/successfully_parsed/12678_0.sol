contract Child {

      mapping(string => string) private strings;


      function GetString(string key) public constant returns(string value) {
        return strings[key];
      }

}


contract Parent {

     Child c;


     function GetString(string key) public constant returns(string value) {
         return c.GetString(key);
     }

 }
