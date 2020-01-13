pragma solidity ^0.5.11;

contract IoTSmartContacrt{
     struct Manager{
        string name;
        bytes32 managerID;
        Device[] devices;
    }
    struct Device{
        address manager;
        bytes32 deviceID;
        bytes32 firmwareHash;
    }
    mapping(address => Manager) public ManagerAddress;
    mapping (address => uint) public ManagerDeviceCount;

    function RegisterManager(string memory _name, bytes32 _id) public returns(address){
        ManagerAddress[msg.sender].name = _name;
        ManagerAddress[msg.sender].managerID = _id;
    }
    function RegisterDevice(bytes32 _identifier,address _manager, bytes32 firmwareHash) public returns(address){
        
    }
}