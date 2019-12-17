pragma solidity ^0.5.11;

contract WorkingWithVariable{
    uint256 public myUint;
    function setmyUint(uint _myuint) public{
        myUint = _myuint;
    }
    bool public myBool;
     function setmyBool(bool _mybool) public{
        myBool = _mybool;
    }
    address public myAddress;
    function setAdd(address _address) public{
        myAddress = _address;
    }
    function getBalanceofAddress() public view returns(uint){
        return myAddress.balance;
    }
}