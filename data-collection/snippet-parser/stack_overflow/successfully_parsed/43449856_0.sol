contract Petroleum{




address _creator;
uint user_number;


struct Baril_order {
    uint price;
    uint quantity;
    address addr;
}

Baril_order[] buy_orderbook_brent;

mapping(address => uint) account_map;
mapping(uint => uint) user_balance;
mapping(uint => uint) number_of_brent;

function Petroleum() payable{       

    _creator=msg.sender;
    user_number=0;
    test=0;

    account_map[_creator]=0;
    account_map[0x7f8105da4dd1af61da7bf587766103ba8534fcdc]=1;

    user_balance[account_map[msg.sender]]=100000;
    number_of_brent[account_map[msg.sender]]=5;
    number_of_wti[account_map[msg.sender]]=2;
    debt[account_map[msg.sender]]=20;
    user_balance[account_map[0x7f8105da4dd1af61da7bf587766103ba8534fcdc]]=200000;
    number_of_brent[account_map[0x7f8105da4dd1af61da7bf587766103ba8534fcdc]]=7;
    number_of_wti[account_map[0x7f8105da4dd1af61da7bf587766103ba8534fcdc]]=10;
    debt[account_map[0x7f8105da4dd1af61da7bf587766103ba8534fcdc]]=3;
}

function append_buy_brent(uint price, uint quantity, address addr) payable {
        buy_orderbook_brent.push(
            Baril_order({
                price:price,
                quantity: quantity,
                addr: addr,
            })
        );
    }
}
