// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Switch} from "../src/Switch.sol";

contract SwitchScript is Script {
    
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        Switch attack = new Switch();
        attack.turnSwitchOn();
        // bool val = attack.getSwitch();

        vm.stopBroadcast();
    }
}


interface IExpose {
    function flipSwitch(bytes memory _data) external;
}
