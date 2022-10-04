contract Implementation {
    using Strings for string;

    string a = "first";
    string b = "second";
    string public c;
    
    constructor() {
        c = a.concat(b); 
    }
}
