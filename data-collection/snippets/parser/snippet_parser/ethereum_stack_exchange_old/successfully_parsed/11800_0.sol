contract Proxy is mortal {

address watch_addr  = 0xEB1e2c19bd833b7f33F9bd0325B74802DF187935;
address user_addr   = msg.sender;

function register(string _text){
    Name name = Name(watch_addr);
    name.register(_text);
}}
