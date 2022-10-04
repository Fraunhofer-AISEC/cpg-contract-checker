
pragma solidity ^0.7.5;

import "./libraries/SafeMath.sol";


import "./interfaces/IOwnable.sol";
import "./interfaces/IERC20.sol";
import "./interfaces/IERC20Metadata.sol";
import "./interfaces/IOHM.sol";
import "./interfaces/IsOHM.sol";
import "./interfaces/IBondingCalculator.sol";
import "./interfaces/ITreasury.sol";

import "./types/OlympusAccessControlled.sol";

interface IERC20Mintable {
  function mint( uint256 amount_ ) external;

  function mint( address account_, uint256 ammount_ ) external;
}

contract OKPTreasury is OlympusAccessControlled {

using SafeMath for uint;


event Deposit( address indexed token, uint amount, uint value );
event Withdrawal( address indexed token, uint amount, uint value );
event CreateDebt( address indexed debtor, address indexed token, uint amount, uint value );
event RepayDebt( address indexed debtor, address indexed token, uint amount, uint value );
event ReservesManaged( address indexed token, uint amount );
event ReservesUpdated( uint indexed totalReserves );
event ReservesAudited( uint indexed totalReserves );
event RewardsMinted( address indexed caller, address indexed recipient, uint amount );
event ChangeQueued( MANAGING indexed managing, address queued );
event ChangeActivated( MANAGING indexed managing, address activated, bool result );

enum MANAGING { RESERVEDEPOSITOR, RESERVESPENDER, RESERVETOKEN, RESERVEMANAGER, LIQUIDITYDEPOSITOR, LIQUIDITYTOKEN, LIQUIDITYMANAGER, DEBTOR, REWARDMANAGER, SOKP }

address public immutable OKP;
uint public blocksNeededForQueue;

address[] public reserveTokens; 
mapping( address => bool ) public isReserveToken;
mapping( address => uint ) public reserveTokenQueue; 

address[] public reserveDepositors; 
mapping( address => bool ) public isReserveDepositor;
mapping( address => uint ) public reserveDepositorQueue; 

address[] public reserveSpenders; 
mapping( address => bool ) public isReserveSpender;
mapping( address => uint ) public reserveSpenderQueue; 

address[] public liquidityTokens; 
mapping( address => bool ) public isLiquidityToken;
mapping( address => uint ) public LiquidityTokenQueue; 

address[] public liquidityDepositors; 
mapping( address => bool ) public isLiquidityDepositor;
mapping( address => uint ) public LiquidityDepositorQueue; 

mapping( address => address ) public bondCalculator; 

address[] public reserveManagers; 
mapping( address => bool ) public isReserveManager;
mapping( address => uint ) public ReserveManagerQueue; 

address[] public liquidityManagers; 
mapping( address => bool ) public isLiquidityManager;
mapping( address => uint ) public LiquidityManagerQueue; 

address[] public debtors; 
mapping( address => bool ) public isDebtor;
mapping( address => uint ) public debtorQueue; 
mapping( address => uint ) public debtorBalance;

address[] public rewardManagers; 
mapping( address => bool ) public isRewardManager;
mapping( address => uint ) public rewardManagerQueue; 

address public sOKP;
uint public sOKPQueue; 

uint public totalReserves; 
uint public totalDebt;

constructor (
    address _OKP,
    address _BUSD,
    address _authority,
    uint _blocksNeededForQueue
) OlympusAccessControlled(IOlympusAuthority(_authority)) {
    require( _OKP != address(0) );
    OKP = _OKP;

    isReserveToken[ _BUSD ] = true;
    reserveTokens.push( _BUSD );

    blocksNeededForQueue = _blocksNeededForQueue;
}


function deposit( uint _amount, address _token, uint _profit ) external returns ( uint send_ ) {
    require( isReserveToken[ _token ] || isLiquidityToken[ _token ], "Not accepted" );
    IERC20( _token ).transferFrom( msg.sender, address(this), _amount );

    if ( isReserveToken[ _token ] ) {
        require( isReserveDepositor[ msg.sender ], "Not approved" );
    } else {
        require( isLiquidityDepositor[ msg.sender ], "Not approved" );
    }

    uint value = valueOf(_token, _amount);
    
    
    send_ = value.sub( _profit );
    IERC20Mintable( OKP ).mint( msg.sender, send_ );

    totalReserves = totalReserves.add( value );
    emit ReservesUpdated( totalReserves );

    emit Deposit( _token, _amount, value );
}


function withdraw( uint _amount, address _token ) external {
    require( isReserveToken[ _token ], "Not accepted" ); 
    require( isReserveSpender[ msg.sender ] == true, "Not approved" );

    uint value = valueOf( _token, _amount );
    IOHM( OKP ).burnFrom( msg.sender, value );

    totalReserves = totalReserves.sub( value );
    emit ReservesUpdated( totalReserves );

    IERC20( _token ).transfer( msg.sender, _amount );

    emit Withdrawal( _token, _amount, value );
}


function incurDebt( uint _amount, address _token ) external {
    require( isDebtor[ msg.sender ], "Not approved" );
    require( isReserveToken[ _token ], "Not accepted" );

    uint value = valueOf( _token, _amount );

    uint maximumDebt = IERC20( sOKP ).balanceOf( msg.sender ); 
    uint availableDebt = maximumDebt.sub( debtorBalance[ msg.sender ] );
    require( value <= availableDebt, "Exceeds debt limit" );

    debtorBalance[ msg.sender ] = debtorBalance[ msg.sender ].add( value );
    totalDebt = totalDebt.add( value );

    totalReserves = totalReserves.sub( value );
    emit ReservesUpdated( totalReserves );

    IERC20( _token ).transfer( msg.sender, _amount );
    
    emit CreateDebt( msg.sender, _token, _amount, value );
}


function repayDebtWithReserve( uint _amount, address _token ) external {
    require( isDebtor[ msg.sender ], "Not approved" );
    require( isReserveToken[ _token ], "Not accepted" );

    IERC20( _token ).transferFrom( msg.sender, address(this), _amount );

    uint value = valueOf( _token, _amount );
    debtorBalance[ msg.sender ] = debtorBalance[ msg.sender ].sub( value );
    totalDebt = totalDebt.sub( value );

    totalReserves = totalReserves.add( value );
    emit ReservesUpdated( totalReserves );

    emit RepayDebt( msg.sender, _token, _amount, value );
}


function repayDebtWithOKP( uint _amount ) external {
    require( isDebtor[ msg.sender ], "Not approved" );

    IOHM( OKP ).burnFrom( msg.sender, _amount );

    debtorBalance[ msg.sender ] = debtorBalance[ msg.sender ].sub( _amount );
    totalDebt = totalDebt.sub( _amount );

    emit RepayDebt( msg.sender, OKP, _amount, _amount );
}


function manage( address _token, uint _amount ) external {
    if( isLiquidityToken[ _token ] ) {
        require( isLiquidityManager[ msg.sender ], "Not approved" );
    } else {
        require( isReserveManager[ msg.sender ], "Not approved" );
    }

    uint value = valueOf(_token, _amount);
    require( value <= excessReserves(), "Insufficient reserves" );

    totalReserves = totalReserves.sub( value );
    emit ReservesUpdated( totalReserves );

    IERC20( _token ).transfer( msg.sender, _amount );

    emit ReservesManaged( _token, _amount );
}


function mintRewards( address _recipient, uint _amount ) external {
    require( isRewardManager[ msg.sender ], "Not approved" );
    require( _amount <= excessReserves(), "Insufficient reserves" );

    IERC20Mintable( OKP ).mint( _recipient, _amount );

    emit RewardsMinted( msg.sender, _recipient, _amount );
} 


function excessReserves() public view returns ( uint ) {
    return totalReserves.sub( IERC20( OKP ).totalSupply().sub( totalDebt ) );
}


function auditReserves() external onlyGovernor() {
    uint reserves;
    for( uint i = 0; i < reserveTokens.length; i++ ) {
        reserves = reserves.add (
            valueOf( reserveTokens[ i ], IERC20( reserveTokens[ i ] ).balanceOf( address(this) ) )
        );
    }
    for( uint i = 0; i < liquidityTokens.length; i++ ) {
        reserves = reserves.add (
            valueOf( liquidityTokens[ i ], IERC20( liquidityTokens[ i ] ).balanceOf( address(this) ) )
        );
    }
    totalReserves = reserves;
    emit ReservesUpdated( reserves );
    emit ReservesAudited( reserves );
}


function valueOf( address _token, uint _amount ) public view returns ( uint value_ ) {
    if ( isReserveToken[ _token ] ) {
        
        value_ = _amount.mul( 10 ** IERC20Metadata( OKP ).decimals() ).div( 10 ** IERC20Metadata( _token ).decimals() );
    } else if ( isLiquidityToken[ _token ] ) {
        value_ = IBondingCalculator( bondCalculator[ _token ] ).valuation( _token, _amount );
    }
}

function setNeededQueueBlock(uint _blocksNeededForQueue) public onlyGovernor() {
    blocksNeededForQueue = _blocksNeededForQueue;
}

function queue( MANAGING _managing, address _address ) external onlyGovernor() returns ( bool ) {
    require( _address != address(0) );
    if ( _managing == MANAGING.RESERVEDEPOSITOR ) { 
        reserveDepositorQueue[ _address ] = block.number.add( blocksNeededForQueue );
    } else if ( _managing == MANAGING.RESERVESPENDER ) { 
        reserveSpenderQueue[ _address ] = block.number.add( blocksNeededForQueue );
    } else if ( _managing == MANAGING.RESERVETOKEN ) { 
        reserveTokenQueue[ _address ] = block.number.add( blocksNeededForQueue );
    } else if ( _managing == MANAGING.RESERVEMANAGER ) { 
        ReserveManagerQueue[ _address ] = block.number.add( blocksNeededForQueue.mul( 2 ) );
    } else if ( _managing == MANAGING.LIQUIDITYDEPOSITOR ) { 
        LiquidityDepositorQueue[ _address ] = block.number.add( blocksNeededForQueue );
    } else if ( _managing == MANAGING.LIQUIDITYTOKEN ) { 
        LiquidityTokenQueue[ _address ] = block.number.add( blocksNeededForQueue );
    } else if ( _managing == MANAGING.LIQUIDITYMANAGER ) { 
        LiquidityManagerQueue[ _address ] = block.number.add( blocksNeededForQueue.mul( 2 ) );
    } else if ( _managing == MANAGING.DEBTOR ) { 
        debtorQueue[ _address ] = block.number.add( blocksNeededForQueue );
    } else if ( _managing == MANAGING.REWARDMANAGER ) { 
        rewardManagerQueue[ _address ] = block.number.add( blocksNeededForQueue );
    } else if ( _managing == MANAGING.SOKP ) { 
        sOKPQueue = block.number.add( blocksNeededForQueue );
    } else return false;

    emit ChangeQueued( _managing, _address );
    return true;
}


function toggle( MANAGING _managing, address _address, address _calculator ) external onlyGovernor() returns ( bool ) {
    require( _address != address(0) );
    bool result;
    if ( _managing == MANAGING.RESERVEDEPOSITOR ) { 
        if ( requirements( reserveDepositorQueue, isReserveDepositor, _address ) ) {
            reserveDepositorQueue[ _address ] = 0;
            if( !listContains( reserveDepositors, _address ) ) {
                reserveDepositors.push( _address );
            }
        }
        result = !isReserveDepositor[ _address ];
        isReserveDepositor[ _address ] = result;
        
    } else if ( _managing == MANAGING.RESERVESPENDER ) { 
        if ( requirements( reserveSpenderQueue, isReserveSpender, _address ) ) {
            reserveSpenderQueue[ _address ] = 0;
            if( !listContains( reserveSpenders, _address ) ) {
                reserveSpenders.push( _address );
            }
        }
        result = !isReserveSpender[ _address ];
        isReserveSpender[ _address ] = result;

    } else if ( _managing == MANAGING.RESERVETOKEN ) { 
        if ( requirements( reserveTokenQueue, isReserveToken, _address ) ) {
            reserveTokenQueue[ _address ] = 0;
            if( !listContains( reserveTokens, _address ) ) {
                reserveTokens.push( _address );
            }
        }
        result = !isReserveToken[ _address ];
        isReserveToken[ _address ] = result;

    } else if ( _managing == MANAGING.RESERVEMANAGER ) { 
        if ( requirements( ReserveManagerQueue, isReserveManager, _address ) ) {
            reserveManagers.push( _address );
            ReserveManagerQueue[ _address ] = 0;
            if( !listContains( reserveManagers, _address ) ) {
                reserveManagers.push( _address );
            }
        }
        result = !isReserveManager[ _address ];
        isReserveManager[ _address ] = result;

    } else if ( _managing == MANAGING.LIQUIDITYDEPOSITOR ) { 
        if ( requirements( LiquidityDepositorQueue, isLiquidityDepositor, _address ) ) {
            liquidityDepositors.push( _address );
            LiquidityDepositorQueue[ _address ] = 0;
            if( !listContains( liquidityDepositors, _address ) ) {
                liquidityDepositors.push( _address );
            }
        }
        result = !isLiquidityDepositor[ _address ];
        isLiquidityDepositor[ _address ] = result;

    } else if ( _managing == MANAGING.LIQUIDITYTOKEN ) { 
        if ( requirements( LiquidityTokenQueue, isLiquidityToken, _address ) ) {
            LiquidityTokenQueue[ _address ] = 0;
            if( !listContains( liquidityTokens, _address ) ) {
                liquidityTokens.push( _address );
            }
        }
        result = !isLiquidityToken[ _address ];
        isLiquidityToken[ _address ] = result;
        bondCalculator[ _address ] = _calculator;

    } else if ( _managing == MANAGING.LIQUIDITYMANAGER ) { 
        if ( requirements( LiquidityManagerQueue, isLiquidityManager, _address ) ) {
            LiquidityManagerQueue[ _address ] = 0;
            if( !listContains( liquidityManagers, _address ) ) {
                liquidityManagers.push( _address );
            }
        }
        result = !isLiquidityManager[ _address ];
        isLiquidityManager[ _address ] = result;

    } else if ( _managing == MANAGING.DEBTOR ) { 
        if ( requirements( debtorQueue, isDebtor, _address ) ) {
            debtorQueue[ _address ] = 0;
            if( !listContains( debtors, _address ) ) {
                debtors.push( _address );
            }
        }
        result = !isDebtor[ _address ];
        isDebtor[ _address ] = result;

    } else if ( _managing == MANAGING.REWARDMANAGER ) { 
        if ( requirements( rewardManagerQueue, isRewardManager, _address ) ) {
            rewardManagerQueue[ _address ] = 0;
            if( !listContains( rewardManagers, _address ) ) {
                rewardManagers.push( _address );
            }
        }
        result = !isRewardManager[ _address ];
        isRewardManager[ _address ] = result;

    } else if ( _managing == MANAGING.SOKP ) { 
        sOKPQueue = 0;
        sOKP = _address;
        result = true;

    } else return false;

    emit ChangeActivated( _managing, _address, result );
    return true;
}


function requirements( 
    mapping( address => uint ) storage queue_, 
    mapping( address => bool ) storage status_, 
    address _address 
) internal view returns ( bool ) {
    if ( !status_[ _address ] ) {
        require( queue_[ _address ] != 0, "Must queue" );
        require( queue_[ _address ] <= block.number, "Queue not expired" );
        return true;
    } return false;
}


function listContains( address[] storage _list, address _token ) internal view returns ( bool ) {
    for( uint i = 0; i < _list.length; i++ ) {
        if( _list[ i ] == _token ) {
            return true;
        }
    }
    return false;
}
}
