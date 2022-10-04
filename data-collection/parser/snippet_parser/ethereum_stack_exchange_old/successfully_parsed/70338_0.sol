pragma solidity >= 0.4.22 < 0.6.0;

contract Test {


event test1(address a,uint16 b,uint16 c,uint16 d,uint16 e);
event test2(address a,uint128 f,uint16 g);
event test3(address a,uint128 f,bool h);


function method1(uint16 a,uint16 b,uint16 c,uint16 d) external payable {



    emit test1(msg.sender,a,b,c,d);
}


function method2(uint128 f,uint16 g) external payable {



    emit test2(msg.sender,f,g);
}


function method3(uint128 f) external payable {



    emit test3(msg.sender,f,true);
}


}
