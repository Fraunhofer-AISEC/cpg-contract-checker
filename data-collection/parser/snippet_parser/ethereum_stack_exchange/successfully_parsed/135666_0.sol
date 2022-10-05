contract repo{

    struct Board{
        bool isActive;
        mapping(string => string) content;
        uint count;
        string[] checkSums;
        mapping(string => uint) indexController;
    }

    mapping(address => Board) _clips;
    address[] _allAddress;


    function register(address addr) public returns(bool){
        if(!isUserExist(addr)){
            _clips[addr] = Board({
                isActive: true,
                count: 0
            });
            return true;
        }else{
            return false;
        }
    }
}

