// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Stop {
        function consecutiveWins() external view returns(uint){
            IExpose attack = IExpose(0xc136FFfc7CF9BadA5a75b4a633399F803da20877);
            return  attack.consecutiveWins();
        }
}


interface IExpose {
   function flip(bool _guess) external returns (bool);

   function consecutiveWins() external view returns(uint);
}