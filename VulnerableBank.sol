// VulnerableBank.sol
contract VulnerableBank {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);
        (bool success, ) = msg.sender.call{value: bal}("");
        require(success);
        balances[msg.sender] = 0;
    }
}
