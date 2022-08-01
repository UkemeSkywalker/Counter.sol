// SPDX-License-Identifier: MIT;
pragma solidity ^0.8.0;

contract Timer{

    uint public count;
    uint timer = 0;
    error timeNotReached(string);
    bool reached = false;

     modifier requiredTime(){
          
            if(block.timestamp < timer){
                revert timeNotReached("Sorry wait till 30 seconds");
            }
            _;
           
        }

        function increment() public requiredTime {
            count++;
            updateTime(block.timestamp + 30 seconds);
        }

        function decrement() requiredTime public{
            count--;
            updateTime(block.timestamp + 30 seconds);
        }

        function updateTime(uint _timer) internal{
            timer = _timer;
        }

        function BlockTimeStamp() public view returns(uint256 t) {
            t = timer - block.timestamp;
            return t;
        }

}