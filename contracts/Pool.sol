// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Pool {

  mapping (address => uint256) public contributions;

  uint256 public totalEthValue;
  address crowdfund;
  address tokenAddress;
  
  function Pool (address pCrowdfund, address pTokenAddress) {
    crowdfund = pCrowdfund;
    tokenAddress = pTokenAddress;
  }

  function () payable {
    contributions[msg.sender] += msg.value;
    totalEthValue += msg.value;
  }

  function submit() {
    if(!crowdfund.call.value(totalEthValue)())
      revert();
  }
}
