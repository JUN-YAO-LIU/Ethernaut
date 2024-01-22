// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "../lib/forge-std/src/Test.sol";
import {console2} from "../lib/forge-std/src/console2.sol";
import {Switch} from "../src/Switch.sol";

contract SwitchTest is Test {

    function test_SwitchStatus() public {
        address user = makeAddr("user1");

        vm.startPrank(user);

        Switch attack = new Switch();
        attack.turnSwitchOn();
        bool val = attack.getSwitch();
        vm.stopPrank();
    }
}
