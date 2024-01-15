// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";

contract FallbackScript is Script {
    address public ethernaunt = 0xd7dbCDF0Efc84fD1362C626d75Ea7de74703AF23;
    
    function setUp() public {}

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        IExpose raget = IExpose(ethernaunt);

        vm.stopBroadcast();
    }
}

interface IExpose {
    function contribute() external payable;

    function getContribution() external view returns (uint);

    function withdraw() external;
}