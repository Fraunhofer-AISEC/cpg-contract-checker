        pragma solidity ^0.8.0;
        
        import "@openzeppelin/contracts/utils/Counters.sol";
        import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
        import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
        
        contract AllCause is ReentrancyGuard {
            using Counters for Counters.Counter;
            Counters.Counter private _causeIds; 
            Counters.Counter private _causeDone; 
        
            address payable owner; 
            
            uint256 listingPrice = 0.025 ether;
            uint256 minamount = 0.05 ether;
        
            constructor() {
                owner = payable(msg.sender);
            }
        
            struct CauseItem {
                uint256 causeId; 
                address causeContract;
                uint256 tokenId;
                address payable creator; 
                address payable donor; 
                uint256 amount;
                uint256 goal;
                bool completed;
            }
        
            
            mapping(uint256 => CauseItem) private idCauseItem;
        
            
            event CauseItemCreated(
                uint256 indexed causeId,
                address indexed causeContract,
                uint256 indexed tokenId,
                address creator,
                address donor,
                uint256 amount,
                uint256 goal,
                bool completed
            );
        
            
            function getListingPrice() public view returns (uint256) {
                return listingPrice;
            }
        
            function setListingPrice(uint256 _price) public returns (uint256) {
                if (msg.sender == address(this)) {
                    listingPrice = _price;
                }
                return listingPrice;
            }
        
            
            function createCauseItem(
                address causeContract,
                uint256 tokenId,
                uint256 amount,
                uint256 goal
            ) public payable nonReentrant {
                require(goal > 0, "Price must be above zero");
                require(
                    msg.value == listingPrice,
                    "Price must be equal to listing price"
                );
                _causeIds.increment(); 
                uint256 causeId = _causeIds.current();
        
                idCauseItem[causeId] = CauseItem(
                    causeId,
                    causeContract,
                    tokenId,
                    payable(msg.sender), 
                    payable(address(0)), 
                    amount,
                    goal,
                    false
                );
        
                
                IERC721(causeContract).transferFrom(msg.sender, address(this), tokenId);
        
                
                emit CauseItemCreated(
                    causeId,
                    causeContract,
                    tokenId,
                    msg.sender,
                    address(0),
                    0, 
                    goal,
                    false
                );
            }
        
            
            function createCauseDonate(address causeContract, uint256 causeId, uint256 curramt)
                public
                payable
                nonReentrant
            {
                
                uint256 curramount = curramt;
                uint256 tokenId = idCauseItem[causeId].tokenId;
        
                require(
                    msg.value >= minamount,
                   "Please submit the asking price in order to complete purchase"
                );
        
                msg.value == curramount;
        
                
                idCauseItem[causeId].creator.transfer(msg.value);
        
                
                IERC721(causeContract).transferFrom(address(this), msg.sender, tokenId);
        
                idCauseItem[causeId].donor = payable(msg.sender); 
        
                idCauseItem[causeId].amount += curramount;
                if(idCauseItem[causeId].amount >= idCauseItem[causeId].goal){
                    idCauseItem[causeId].completed = true; 
                    _causeDone.increment(); 
                }
                
                payable(owner).transfer(listingPrice); 
        
            }
        
            
            function fetchCauseItems() public view returns (CauseItem[] memory) {
                uint256 causeCount = _causeIds.current(); 
                
                uint256 undoneCauseCount = _causeIds.current() - _causeDone.current();
                uint256 currentIndex = 0;
        
                CauseItem[] memory causes = new CauseItem[](undoneCauseCount);
        
                
                for (uint256 i = 0; i < causeCount; i++) {
                    
                    
                    
                    if (idCauseItem[i + 1].donor == address(0)) {
                        
                        uint256 currentId = idCauseItem[i + 1].causeId;
                        CauseItem storage currentCause = idCauseItem[currentId];  
                        causes[currentIndex] = currentCause;
                        currentIndex += 1;
                    }
                }
                return causes; 
            }
        
            
            function fetchMyCauses() public view returns (CauseItem[] memory) {
                
                uint256 totalCauseCount = _causeIds.current();
        
                uint256 causeCount = 0;
                uint256 currentIndex = 0;
        
                for (uint256 i = 0; i < totalCauseCount; i++) {
                    
                    if (idCauseItem[i + 1].donor == msg.sender) {
                        causeCount += 1; 
                    }
                }
        
                CauseItem[] memory causes = new CauseItem[](causeCount);
                for (uint256 i = 0; i < totalCauseCount; i++) {
                    if (idCauseItem[i + 1].donor == msg.sender) {
                        uint256 currentId = idCauseItem[i + 1].causeId;
                        CauseItem storage currentItem = idCauseItem[currentId];
                        causes[currentIndex] = currentItem;
                        currentIndex += 1;
                    }
                }
                return causes;
            }
        
            
            function fetchCausesCreated() public view returns (CauseItem[] memory) {
                
                uint256 totalCauseCount = _causeIds.current();
        
                uint256 causeCount = 0;
                uint256 currentIndex = 0;
        
                for (uint256 i = 0; i < totalCauseCount; i++) {
                    
                    if (idCauseItem[i + 1].creator == msg.sender) {
                        causeCount += 1; 
                    }
                }
        
                CauseItem[] memory causes = new CauseItem[](causeCount);
                for (uint256 i = 0; i < totalCauseCount; i++) {
                    if (idCauseItem[i + 1].creator == msg.sender) {
                        uint256 currentId = idCauseItem[i + 1].causeId;
                        CauseItem storage currentCause = idCauseItem[currentId];
                        causes[currentIndex] = currentCause;
                        currentIndex += 1;
                    }
                }
                return causes;
            }
        
        }
