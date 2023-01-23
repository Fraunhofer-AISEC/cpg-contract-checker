    $ node
    > var solc = require("solc")  
    > var src = `contract yoThere {
        string public msg;
        function yoThere() {
          msg = "Hey lol";
        }

        function greet() constant returns(string) {
          return msg;
        }
     }
     `

     > var comp = solc.compile(src)
