// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ETHDaddy is ERC721{
  address public owner;
  uint256 public maxSupply=0;

  struct Domain{
    string name;
    uint256 cost;
    bool isOwned;
  }
  mapping(uint256 => Domain) public domains;
  modifier onlyOwner(){
    require(msg.sender == owner);
    _;
  }
  constructor (string memory _name, string memory _symbol) 
    ERC721(_name,_symbol)
  {
    owner = msg.sender;
  }

  function list(string memory _name,uint256 _cost) public onlyOwner{

      maxSupply++;
      domains[maxSupply] = Domain(_name,_cost,false);




  }
}