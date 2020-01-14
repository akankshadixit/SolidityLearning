pragma solidity ^0.5.11;

contract IoTSmartContacrt{
    struct Device{
        bytes32 deviceKey;                 //public key of the IoT device
        bytes32 firmwareHash;             //firmware hash 
    }
     struct Manager{
        string name;
        bytes32 managerKey;
        uint numdevices;
        mapping(uint => Device) devices;
    }
    uint numManagers;
    mapping(uint => Manager) managers;

    function RegisterManager(string memory _name, bytes32 _managerKey) public returns(uint managerID){
        managerID = numManagers++;
        managers[managerID] = Manager(_name, _managerKey,0);
    }
    function RegisterDevices(bytes32 _deviceKey, bytes32 _firmwareHash, uint managerID) public returns (bool success){
        Manager storage m = managers[managerID];
        m.devices[m.numdevices++] = Device(_deviceKey,_firmwareHash);
        return true;
    }
}