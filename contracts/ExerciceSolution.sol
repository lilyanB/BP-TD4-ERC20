pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract ExerciceSolution is ERC20 
{

  constructor (string memory name, string memory symbol,uint256 initialSupply) public ERC20(name, symbol) {
        _mint(msg.sender, initialSupply);
	}

  mapping(address => bool) public isWhiteList;
  mapping(address => uint256) public tier;
  
  /*
  function symbol() external view returns (string memory){
    return ERC20.symbol();
  }*/
    
  function getToken() external returns (bool){
    
    _mint(msg.sender, 100);
  }

	function buyToken() override external payable returns (bool){
    
    _mint(msg.sender, msg.value);
  }

	//function whiteListUser(address customerAddress) external {}

	//function unWhiteListUser(address customerAddress) external {}

	function isCustomerWhiteListed(address customerAddress) override external returns (bool){
    return isWhiteList[customerAddress];
  }

	//function setUserLevel(address customerAddress, uint256 level) external {}

	function customerTierLevel(address customerAddress) override external returns (uint256){
    return tier[customerAddress];
  }
}