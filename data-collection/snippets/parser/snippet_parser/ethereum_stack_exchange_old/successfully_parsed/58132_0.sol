contract Bar{

    struct Foo{
        uint x;
        uint y;
    }
    mapping(uint => Foo[]) foo;

    function add(uint id, uint x , uint y)  {
        foo[id].push(Foo(x, y));
    }

    function get(uint id, uint index) public returns(uint, uint){
      
      {
      var a = foo[id][index].x;
      var b = foo[id][index].y;
      }
      return (a,b);
    }

    function get_last_ten(uint id) constant returns(uint[20]){
    uint[20] memory lastItems;
    for(uint i=0;i<20;i++){
        if(foo[id].length>i){
            lastItems[i] = foo[id][foo[id].length-i-1].x;
        }
    }
    return lastItems;
}
}
