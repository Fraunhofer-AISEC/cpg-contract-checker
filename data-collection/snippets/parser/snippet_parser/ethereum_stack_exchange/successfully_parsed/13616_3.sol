pragma experimental ABIEncoderV2;


function getproduct(address _adress)returns (player){
    return players[_adress];
}


  function readProduct (uint u) returns (bool c) {
      p_id = p.getproduct(u).id;
      p_name = p.getproduct(u).name;
      c = true;
    }
