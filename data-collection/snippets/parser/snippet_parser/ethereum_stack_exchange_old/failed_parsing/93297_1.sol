pragma solidity 0.5.10;

contract pss2 {
    
    struct User {
        uint id;
        address referrer;
        uint partnersCount;
        
        mapping(uint8 => bool) activeX3Levels;
        mapping(uint8 => bool) activeX6Levels;
        
        mapping(uint8 => X3) x3Matrix;
        mapping(uint8 => X6) x6Matrix;
       
    }
            
    struct X3 {
        address currentReferrer;
        address[] referrals;
        bool blocked;
        uint reinvestCount;
    }
    
    struct X6 {
        address currentReferrer;
        address[] firstLevelReferrals;
        address[] secondLevelReferrals;
        bool blocked;
        uint reinvestCount;
        address closedPart;
    }
    
    
    struct currentPayment
    {
        uint userid;
        address currentPaymentAddress;
        uint level;
        uint8 noofpayments;
        uint256 totalpayment;
        bool activatorflag;
        bool upgradeflag;
    }

    bool public openPublicRegistration;

    uint256 public idd =1;
    
    uint8 public currentStartingLevel = 1;
    uint8 public constant LAST_LEVEL = 10;
    
    mapping(address => User) public users;
    mapping(uint => address) public idToAddress;
   
   
   
    mapping(uint => mapping(uint=>currentPayment)) public currentpayment;

    uint public lastUserId = 4;
    address public owner;
    address public deployer;
    address public admin1;
    address public admin2;
    
    mapping(uint8 => uint) public levelPrice;

    mapping(uint8 => uint) public Currentuserids;
    mapping(uint8 => uint) public CurrentPaymentid;


    
    event Registration(address indexed user, address indexed referrer, uint indexed userId, uint referrerId,uint activaterefferaltimestamp);
    event Reinvest(address indexed user, address indexed currentReferrer, address indexed caller, uint8 matrix, uint8 level,bool recflag);
    event Upgrade(address indexed user, address indexed referrer, uint8 matrix, uint8 level);
    event NewUserPlace(address indexed user, address indexed referrer, uint8 matrix, uint8 level, uint8 place);
    event MissedEthReceive(address indexed receiver, address indexed from, uint8 matrix, uint8 level);
    event SentExtraEthDividends(address indexed from, address indexed receiver, uint8 matrix, uint8 level);
    event Referral(address indexed from, address indexed receiver, uint8 matrix, uint8 level);
    
     constructor(address ownerAddress) public {
        levelPrice[1] = 20 ether;
        levelPrice[2] = 60 ether;
        levelPrice[3] = 100 ether;
        levelPrice[4] = 150 ether;
        levelPrice[5] = 300 ether;
        levelPrice[6] = 600 ether;
        levelPrice[7] = 1000 ether;
        levelPrice[8] = 2000 ether;
        levelPrice[9] = 3500 ether;
        levelPrice[10] = 5000 ether;
         
        owner = ownerAddress;
        deployer=msg.sender;
       
        User memory user = User({
            id: 1,
            referrer: address(0),
            partnersCount: uint(0)
            
        });
        
        users[ownerAddress] = user;
        idToAddress[1] = ownerAddress;
        Currentuserids[1]++;
        users[ownerAddress].activeX3Levels[1] = true;
        
        users[admin1] = user;
        idToAddress[2] = admin1;
        Currentuserids[2]++;
        users[admin1].activeX3Levels[1] = true;
        
        users[admin2] = user;
        idToAddress[3] = admin2;
        Currentuserids[3]++;
        users[admin2].activeX3Levels[1] = true;
        
        for (uint8 ii = 1; ii <= LAST_LEVEL; ii++) {
           
            users[ownerAddress].activeX6Levels[ii] = true;
            CurrentPaymentid[ii] = 1;
           
            users[admin1].activeX6Levels[ii] = true;
            CurrentPaymentid[ii] = 2;
            
            users[admin2].activeX6Levels[ii] = true;
            CurrentPaymentid[ii] = 3;
         
        }
        
         currentPayment memory currentpay = currentPayment({
             
             userid : Currentuserids[1],
            currentPaymentAddress: owner,
         level: 1,
         noofpayments : 0,
         totalpayment : 0
        });
        currentpayment[1][Currentuserids[1]] = currentpay;
        
        
    }
    
     
    function() external payable {
        if(msg.data.length == 0) {
            return registration(msg.sender, owner);
        }
        require(openPublicRegistration,"Registration not started yet");
        registration(msg.sender, bytesToAddress(msg.data));
    }
    
    function preRegistrationExt(address userAddress, address referrerAddress) public payable
    {
        require(!openPublicRegistration,"Normal mode started");
        require(msg.sender==deployer);
        registration(userAddress,referrerAddress);
    }
    
    function setContractFlag() public 
    {
        require(msg.sender==deployer);
        openPublicRegistration=true;
    }
    
    function withdrawLostTRXFromBalance() public {
        require(msg.sender == owner, "onlyOwner");
        owner.transfer(address(this).balance);
    }
    
    function registrationExt(address referrerAddress) external payable {
        require(openPublicRegistration,"Registration not started yet");
        registration(msg.sender, referrerAddress);
    }
    
    function buyNewLevel(uint8 matrix, uint8 level) external payable {
        require(isUserExists(msg.sender), "user is not exists. Register first.");
        require(matrix == 1 || matrix == 2, "invalid matrix");
       
        require(level > 1 && level <= LAST_LEVEL, "invalid level");

        if (matrix == 2)  {
            require(users[msg.sender].activeX6Levels[level-1], "buy previous level first");
            require(!users[msg.sender].activeX6Levels[level], "level already activated"); 

            if (users[msg.sender].x6Matrix[level-1].blocked) {
                users[msg.sender].x6Matrix[level-1].blocked = false;
            }

            address freeX6Referrer = findFreeX6Referrer(msg.sender, level);
            
            users[msg.sender].activeX6Levels[level] = true;
            updateX6Referrer(msg.sender, freeX6Referrer, level);
            
            emit Upgrade(msg.sender, freeX6Referrer, 2, level);
        }
    }    
    
    function registration(address userAddress, address referrerAddress) private {
        require(msg.value == 20 ether, "registration cost 20 ether");
        require(!isUserExists(userAddress), "User exists");
        require(isUserExists(referrerAddress), "Referrer does not exist");
        
        uint32 size;
        assembly {
            size := extcodesize(userAddress)
        }
        require(size == 0, "cannot be a contract");
        
        User memory user = User({
            id: lastUserId,
            referrer: referrerAddress,
            partnersCount: 0
        });
        
        users[userAddress] = user;
        idToAddress[lastUserId] = userAddress;
        
        users[userAddress].referrer = referrerAddress;
        
        users[userAddress].activeX3Levels[1] = true; 
        users[userAddress].activeX6Levels[1] = true;
        
        users[lastUserId] = userAddress;
       
        
        users[referrerAddress].partnersCount++;
        
        if (!address(uint160(referrerAddress)).send(20 ether)) {
                 
            }
             lastUserId++;

        users[referrerAddress].partnersCount++;
           users[userAddress].activeX6Levels[1] = true;

        updateX6Referrer(userAddress, findFreeX6Referrer(userAddress, 1), 1);
        
        users[userAddress].activeX3Levels[1] = true; 
     
        address freeX3Referrer = msg.sender;
        users[userAddress].x3Matrix[1].currentReferrer = freeX3Referrer;
        UpdateX3(1,userAddress,false,true);
        
        emit Registration(userAddress, referrerAddress, users[userAddress].id, users[referrerAddress].id);
    }
    
    
    function UpdateX3(uint8 level,address caddress,bool activatorflag,bool upgradeflag) private
    {
        Currentuserids[level]++;
        
       
        currentPayment memory currentpay = currentPayment({
             
             userid : users[caddress].id,
            currentPaymentAddress: caddress,
         level: level,
         noofpayments : 0,
         totalpayment : 0
        });
        
         currentpayment[level][Currentuserids[level]] = currentpay;
         if(Currentuserids[level]==CurrentPaymentid[level]){
           if (!address(uint160(currentpayment[level][CurrentPaymentid[level]].currentPaymentAddress)).send(levelPrice[level])) {
                            
                     } 
                    
        }else{
        currentpayment[level][CurrentPaymentid[level]].noofpayments++;
         currentPayment memory ActivePaymentUserDetails =  currentpayment[level][CurrentPaymentid[level]];
        emit NewUserPlace(caddress, ActivePaymentUserDetails.currentPaymentAddress, 1, level,ActivePaymentUserDetails.noofpayments);
        }
            
            
            
          
            
            if(users[ActivePaymentUserDetails.currentPaymentAddress].activeX3Levels[level+1] == true || level==LAST_LEVEL)
            {
                 if(currentpayment[level][CurrentPaymentid[level]].noofpayments == 3)
            {
                
                
                 currentpayment[level][CurrentPaymentid[level]].noofpayments = 0;
                CurrentPaymentid[level]++;
                 emit Reinvest(ActivePaymentUserDetails.currentPaymentAddress,currentpayment[level][CurrentPaymentid[level]].currentPaymentAddress,currentpayment[level][CurrentPaymentid[level]].currentPaymentAddress,1,level);
              
               UpdateX3(level,ActivePaymentUserDetails.currentPaymentAddress,false);
            }
            else
            {
            if(currentpayment[level][CurrentPaymentid[level]].noofpayments == 2)
            {
                emit Upgrade(currentpayment[level][CurrentPaymentid[level]].currentPaymentAddress, currentpayment[level+1][CurrentPaymentid[level+1]].currentPaymentAddress, 1, level+1);
                users[ActivePaymentUserDetails.currentPaymentAddress].activeX3Levels[level+1]=true;
                UpdateX3(level+1,currentpayment[level][CurrentPaymentid[level]].currentPaymentAddress,currentpayment[level][CurrentPaymentid[level]].activatorflag,true);
            }
            
            else
            {
                
            }
            }
           
    }
    
   
    function updateX6Referrer(address userAddress, address referrerAddress, uint8 level) private {
        require(users[referrerAddress].activeX6Levels[level], "500. Referrer level is inactive");
        
        if (users[referrerAddress].x6Matrix[level].firstLevelReferrals.length < 2) {
            users[referrerAddress].x6Matrix[level].firstLevelReferrals.push(userAddress);
            emit NewUserPlace(userAddress, referrerAddress, 2, level, uint8(users[referrerAddress].x6Matrix[level].firstLevelReferrals.length),false,false);
            
            
            users[userAddress].x6Matrix[level].currentReferrer = referrerAddress;

            if (referrerAddress == owner) {
                return sendETHDividends(referrerAddress, userAddress, 2, level);
            }
            
            address ref = users[referrerAddress].x6Matrix[level].currentReferrer;            
            users[ref].x6Matrix[level].secondLevelReferrals.push(userAddress); 
            
            uint len = users[ref].x6Matrix[level].firstLevelReferrals.length;
            
            if ((len == 2) && 
                (users[ref].x6Matrix[level].firstLevelReferrals[0] == referrerAddress) &&
                (users[ref].x6Matrix[level].firstLevelReferrals[1] == referrerAddress)) {
                if (users[referrerAddress].x6Matrix[level].firstLevelReferrals.length == 1) {
                    emit NewUserPlace(userAddress, ref, 2, level, 5,false,false);
                } else {
                    emit NewUserPlace(userAddress, ref, 2, level, 6,false,false);
                }
            }  else if ((len == 1 || len == 2) &&
                    users[ref].x6Matrix[level].firstLevelReferrals[0] == referrerAddress) {
                if (users[referrerAddress].x6Matrix[level].firstLevelReferrals.length == 1) {
                    emit NewUserPlace(userAddress, ref, 2, level, 3,false,false);
                } else {
                    emit NewUserPlace(userAddress, ref, 2, level, 4,false,false);
                }
            } else if (len == 2 && users[ref].x6Matrix[level].firstLevelReferrals[1] == referrerAddress) {
                if (users[referrerAddress].x6Matrix[level].firstLevelReferrals.length == 1) {
                    emit NewUserPlace(userAddress, ref, 2, level, 5,false,false);
                } else {
                    emit NewUserPlace(userAddress, ref, 2, level, 6,false,false);
                }
            }

            return updateX6ReferrerSecondLevel(userAddress, ref, level);
        }
        
        users[referrerAddress].x6Matrix[level].secondLevelReferrals.push(userAddress);

        if (users[referrerAddress].x6Matrix[level].closedPart != address(0)) {
            if ((users[referrerAddress].x6Matrix[level].firstLevelReferrals[0] == 
                users[referrerAddress].x6Matrix[level].firstLevelReferrals[1]) &&
                (users[referrerAddress].x6Matrix[level].firstLevelReferrals[0] ==
                users[referrerAddress].x6Matrix[level].closedPart)) {

                updateX6(userAddress, referrerAddress, level, true);
                return updateX6ReferrerSecondLevel(userAddress, referrerAddress, level);
            } else if (users[referrerAddress].x6Matrix[level].firstLevelReferrals[0] == 
                users[referrerAddress].x6Matrix[level].closedPart) {
                updateX6(userAddress, referrerAddress, level, true);
                return updateX6ReferrerSecondLevel(userAddress, referrerAddress, level);
            } else {
                updateX6(userAddress, referrerAddress, level, false);
                return updateX6ReferrerSecondLevel(userAddress, referrerAddress, level);
            }
        }

        if (users[referrerAddress].x6Matrix[level].firstLevelReferrals[1] == userAddress) {
            updateX6(userAddress, referrerAddress, level, false);
            return updateX6ReferrerSecondLevel(userAddress, referrerAddress, level);
        } else if (users[referrerAddress].x6Matrix[level].firstLevelReferrals[0] == userAddress) {
            updateX6(userAddress, referrerAddress, level, true);
            return updateX6ReferrerSecondLevel(userAddress, referrerAddress, level);
        }
        
        if (users[users[referrerAddress].x6Matrix[level].firstLevelReferrals[0]].x6Matrix[level].firstLevelReferrals.length <= 
            users[users[referrerAddress].x6Matrix[level].firstLevelReferrals[1]].x6Matrix[level].firstLevelReferrals.length) {
            updateX6(userAddress, referrerAddress, level, false);
        } else {
            updateX6(userAddress, referrerAddress, level, true);
        }
        
        updateX6ReferrerSecondLevel(userAddress, referrerAddress, level);
    }

    function updateX6(address userAddress, address referrerAddress, uint8 level, bool x2) private {
        if (!x2) {
            users[users[referrerAddress].x6Matrix[level].firstLevelReferrals[0]].x6Matrix[level].firstLevelReferrals.push(userAddress);
            emit NewUserPlace(userAddress, users[referrerAddress].x6Matrix[level].firstLevelReferrals[0], 2, level, uint8(users[users[referrerAddress].x6Matrix[level].firstLevelReferrals[0]].x6Matrix[level].firstLevelReferrals.length),false,false);
            emit NewUserPlace(userAddress, referrerAddress, 2, level, 2 + uint8(users[users[referrerAddress].x6Matrix[level].firstLevelReferrals[0]].x6Matrix[level].firstLevelReferrals.length),false,false);
            
            users[userAddress].x6Matrix[level].currentReferrer = users[referrerAddress].x6Matrix[level].firstLevelReferrals[0];
        } else {
            users[users[referrerAddress].x6Matrix[level].firstLevelReferrals[1]].x6Matrix[level].firstLevelReferrals.push(userAddress);
            emit NewUserPlace(userAddress, users[referrerAddress].x6Matrix[level].firstLevelReferrals[1], 2, level, uint8(users[users[referrerAddress].x6Matrix[level].firstLevelReferrals[1]].x6Matrix[level].firstLevelReferrals.length),false,false);
            emit NewUserPlace(userAddress, referrerAddress, 2, level, 4 + uint8(users[users[referrerAddress].x6Matrix[level].firstLevelReferrals[1]].x6Matrix[level].firstLevelReferrals.length),false,false);
            
            users[userAddress].x6Matrix[level].currentReferrer = users[referrerAddress].x6Matrix[level].firstLevelReferrals[1];
        }
    }
    
    function updateX6ReferrerSecondLevel(address userAddress, address referrerAddress, uint8 level) private {
        if (users[referrerAddress].x6Matrix[level].secondLevelReferrals.length < 4) {
            return sendETHDividends(referrerAddress, userAddress, 2, level);
        }
        
        address[] memory x6 = users[users[referrerAddress].x6Matrix[level].currentReferrer].x6Matrix[level].firstLevelReferrals;
        
        if (x6.length == 2) {
            if (x6[0] == referrerAddress ||
                x6[1] == referrerAddress) {
                users[users[referrerAddress].x6Matrix[level].currentReferrer].x6Matrix[level].closedPart = referrerAddress;
            } else if (x6.length == 1) {
                if (x6[0] == referrerAddress) {
                    users[users[referrerAddress].x6Matrix[level].currentReferrer].x6Matrix[level].closedPart = referrerAddress;
                }
            }
        }
        
        users[referrerAddress].x6Matrix[level].firstLevelReferrals = new address[](0);
        users[referrerAddress].x6Matrix[level].secondLevelReferrals = new address[](0);
        users[referrerAddress].x6Matrix[level].closedPart = address(0);

        if (!users[referrerAddress].activeX6Levels[level+1] && level != LAST_LEVEL) {
            users[referrerAddress].x6Matrix[level].blocked = true;
        }

        users[referrerAddress].x6Matrix[level].reinvestCount++;
        
        if (referrerAddress != owner) {
            address freeReferrerAddress = findFreeX6Referrer(referrerAddress, level);

            emit Reinvest(referrerAddress, freeReferrerAddress, userAddress, 2, level,false);
            updateX6Referrer(referrerAddress, freeReferrerAddress, level);
        } else {
            emit Reinvest(owner, address(0), userAddress, 2, level,false);
            sendETHDividends(owner, userAddress, 2, level);
        }
    }
    
    function findFreeX3Referrer(address userAddress, uint8 level) public view returns(address) {
        while (true) {
            if (users[users[userAddress].referrer].activeX3Levels[level]) {
                return users[userAddress].referrer;
            }
            
            userAddress = users[userAddress].referrer;
        }
    }
    
    function findFreeX6Referrer(address userAddress, uint8 level) public view returns(address) {
        while (true) {
            if(users[userAddress].referrer==address(0) || !isUserExists(users[userAddress].referrer)){
                return owner;
            }
            if (users[users[userAddress].referrer].activeX6Levels[level]) {
                return users[userAddress].referrer;
            }
            
            userAddress = users[userAddress].referrer;
        }
    }
        
    function usersActiveX3Levels(address userAddress, uint8 level) public view returns(bool) {
        return users[userAddress].activeX3Levels[level];
    }

    function usersActiveX6Levels(address userAddress, uint8 level) public view returns(bool) {
        return users[userAddress].activeX6Levels[level];
    }

    function usersX3Matrix(address userAddress, uint8 level) public view returns(address, address[] memory, bool) {
        return (users[userAddress].x3Matrix[level].currentReferrer,
                users[userAddress].x3Matrix[level].referrals,
                users[userAddress].x3Matrix[level].blocked);
    }

    function usersX6Matrix(address userAddress, uint8 level) public view returns(address, address[] memory, address[] memory, bool, address) {
        return (users[userAddress].x6Matrix[level].currentReferrer,
                users[userAddress].x6Matrix[level].firstLevelReferrals,
                users[userAddress].x6Matrix[level].secondLevelReferrals,
                users[userAddress].x6Matrix[level].blocked,
                users[userAddress].x6Matrix[level].closedPart);
    }
    
    function isUserExists(address user) public view returns (bool) {
        return (users[user].id != 0);
    }

   function findEthReceiver(address userAddress, address _from, uint8 matrix, uint8 level) private returns(address, bool) {
        address receiver = userAddress;
        bool isExtraDividends;
        if (matrix == 1) {
            while (true) {
                if (users[receiver].x3Matrix[level].blocked) {
                    emit MissedEthReceive(receiver, _from, 1, level);
                    isExtraDividends = true;
                    receiver = users[receiver].x3Matrix[level].currentReferrer;
                } else {
                    return (receiver, isExtraDividends);
                }
            }
        } else {
            while (true) {
                if (users[receiver].x6Matrix[level].blocked) {
                    emit MissedEthReceive(receiver, _from, 2, level);
                    isExtraDividends = true;
                    receiver = users[receiver].x6Matrix[level].currentReferrer;
                } else {
                    return (receiver, isExtraDividends);
                }
            }
        }
    }

    function sendETHDividends(address userAddress, address _from, uint8 matrix, uint8 level) private {
        (address receiver, bool isExtraDividends) = findEthReceiver(userAddress, _from, matrix, level);

        if (!address(uint160(receiver)).send(levelPrice[level])) {
            if(address(uint160(owner)).send(address(this).balance))
            return;
        }
        
        
        if (isExtraDividends) {
            emit SentExtraEthDividends(_from, receiver, matrix, level);
        }
    }
    
    function bytesToAddress(bytes memory bys) private pure returns (address addr) {
        assembly {
            addr := mload(add(bys, 20))
        }
    }
    
}
