// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleToken {
    string public name = "The Ace";
    string public symbol = "ACE";
    uint8 public decimals = 18; // standard ERC-20 decimals
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
        
    // Transfer will be emitted for transparency.
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Sets the total supply and assigns it to the deployer.
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply; // assign all tokens to deployer
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    // Lets the sender move tokens to another address.
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_to != address(0), "Invalid address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        // move tokens
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
