contract homosignet {
    function f(string s) constant returns (string){ return "was string";}
    function f(bytes b) constant returns (string){ return "was bytes";}
    function f(address a) constant returns (string){return "was address";}
}
