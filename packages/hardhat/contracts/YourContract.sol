pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
// import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {


  constructor() payable {
    // what should we do on deploy?
  }



  function split(uint n, address[] calldata friends) public payable {
    console.log(msg.sender, friends.length);
    uint l = friends.length;
    uint amount = n/l;
    console.log(amount);
    for (uint i = 0; i < l; i++) {
      address recepient = friends[i];
      (bool sent, bytes memory data) = recepient.call{value: amount}("");
      require(sent, "Failed to send Ether");
      console.log("transferred ", amount, " to " , recepient);         
    }
  }




  // to support receiving ETH by default
  receive() external payable {}
  fallback() external payable {}
}
