
pragma solidity >=0.4.22 <0.9.0;

contract MainContract {
    mapping(uint => string) public tempMap;

    function addData(uint number,string memory name ) public {
        tempMap[number] = name;
    }

    function get(uint number) external view returns(string memory){
        return tempMap[number];
    }
}

contract Temp{
    MainContract main = new MainContract();

    function getData(uint number) public view returns(string memory){
        return main.get(number);
    }
}
