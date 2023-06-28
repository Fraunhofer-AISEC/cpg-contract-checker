pragma solidity >=0.4.22 <0.6.0;
pragma experimental ABIEncoderV2;
contract land{

    address public owner;

    constructor() public{
        owner = msg.sender;
    }

    struct Landpaper{
        string number;
        string landaddress;
        string landnumber;
        string landpurpose;
        uint landgrades;
        uint256 landarea;
        string holdpoints;
    }

    mapping(bytes8 => Landpaper) public lp;

    modifier Permission(){
        require(msg.sender == owner);
        _;
    }

    function set(string memory rfidnumber, Landpaper memory _landpaperRecord) public Permission{
        lp[rfidnumber]=_landpaperRecord;
    }

    function get(string memory rfidnumber) view public returns(Landpaper memory){
        return lp[rfidnumber];
    }

}

