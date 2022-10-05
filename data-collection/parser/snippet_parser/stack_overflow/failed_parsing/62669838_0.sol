contract MyContract {
    struct UserStruct {
        bool isExist;
        uint id;
        uint referrerID;
        uint referredUsers;
    }
      
    mapping (address => PoolUserStruct) [] poolUsers;
    mapping(uint => address) [] poolUserList;
    uint[] public poolCurrentUserID = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    constructor {
        PoolUserStruct memory pooluserStruct;

        for(uint i = 1; i <= 10; i++){
          poolCurrentUserID[i]++;

          pooluserStruct = PoolUserStruct({
            isExist: true,
            id: poolCurrentUserID[i],
            payment_received: 0
          });

          poolActiveUserID[i] = poolCurrentUserID[i];
          poolUsers[i][msg.sender] = pooluserStruct;
          poolUserList[i][poolCurrentUserID[i]]=msg.sender;
        }
    }
}
