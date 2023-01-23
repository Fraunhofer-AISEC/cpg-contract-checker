
address public cronFactoryAddress = 0x1af3cE8de065774B0EC08942FC5779930d1A9622;
address public keeperRegistrar = 0x57A4a13b35d25EE78e084168aBaC5ad360252467;

constructor(){
        cronFactory = ICronFactory(cronFactoryAddress);
    }

function createUpkeep(string memory _cronString) public{
        address _target = address(this);    
        bytes memory functionToCall = bytes(abi.encodeWithSignature("sendSalary(string)", _cronString));
        
        bytes memory job = cronFactory.encodeCronJob(_target, functionToCall,  _cronString);
        uint256 maxJobs = cronFactory.s_maxJobs();
        address delegateAddress = cronFactory.cronDelegateAddress();
        address newCronUpkeep = address(new CronUpkeep(msg.sender, delegateAddress, maxJobs, job));
        allUpkeeps.push(newCronUpkeep);
    }

function fundUpkeep(uint256 _linkAmount, address _upkeepAddress) public{
        bytes4 reg = bytes4(keccak256("register(string,bytes,address,uint32,address,bytes,bytes,uint96,address)"));
        bytes memory _data = abi.encode(
            "TestV2",
            "",
            _upkeepAddress,
            uint32(500000),
            address(this),
            "",
            "",
            _linkAmount,
            address(this)
        );
        bytes memory combinedData = abi.encodePacked(reg, _data);
        LinkContract.transferAndCall(keeperRegistrar, _linkAmount, combinedData);
    }
