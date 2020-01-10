pragma solidity ^0.5.11;

contract IoTSmartContacrt{
    struct Device{
        address manager;
        bytes32 deviceID;
        bytes32 firmwareHash;
    }
    struct Manager{
        string name;
        bytes32 managerID;
        Device[] devices;
    }

    mapping(address => Manager) public ManagerAdd;
    function RegisterDevice(bytes32 _identifier,address _manager, bytes32 firmwareHash) public returns(address){

    }
}