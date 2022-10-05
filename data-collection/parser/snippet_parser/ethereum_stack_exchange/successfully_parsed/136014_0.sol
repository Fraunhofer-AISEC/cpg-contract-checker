contract Svggen {

function svg() public pure returns (string memory){
    string memory svgS="<svg width='1024' height='1024'><defs><rect id='1' x='0' y='0' width='32' height='32' style='fill:rgb(0,0,255)'/><rect id='2' x='0' y='0' width='32' height='32' style='fill:rgb(255,0,255)'/><rect id='3' x='0' y='0' width='32' height='32' style='fill:rgb(0,255,255)'/><rect id='4' x='0' y='0' width='32' height='32' style='fill:rgb(0,0,255)'/><rect id='5' x='0' y='0' width='32' height='32' style='fill:rgb(255,255,255)'/></defs>";
    for(uint y=0; y < 1024; y = y + 32) {
        svgS = string(abi.encodePacked(svgS,"<svg y='",Strings.toString(y),"'>"));
        for(uint x=0; x < 1024; x = x + 32) {
            
            svgS = string(abi.encodePacked(svgS,"<use href='#1' x='",Strings.toString(x),"'/>"));
        }
        svgS = string(abi.encodePacked(svgS,"</svg>"));
    }
    svgS = string(abi.encodePacked(svgS,"</svg>"));
    return svgS;
    
}
}