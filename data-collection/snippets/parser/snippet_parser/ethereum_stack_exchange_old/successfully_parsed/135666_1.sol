contract repo{

    struct Board{
        bool isActive;
        mapping(string => string) content;
        uint count;
        string[] checkSums;
        mapping(string => uint) indexController;
    }

    mapping(address => ClipBoard) _clips;
    address[] _allAddress;


    function register(address addr) public returns(bool){
        if(!isUserExist(addr)){
            _clips[addr].isActive = true;
            return true;
        }else{
            return false;
        }
    }
}
