pragma solidity^0.4.24;
 
contract Bank {
    
    struct Account {
        address addr;
        uint amount;
    }
    
    mapping(address => uint) balances;
    
    address public owner;
    
    Account[] internal accounts;
    
    modifier onlyOwner {
        require (msg.sender == owner, "You can only manage money in accounts you own.");
        _;
    }
    
    function addAdccount(address _addr, uint _amount) internal {
        accounts.push(Account(_addr, _amount));
    }
    
    function deposit(uint money) public payable {
        balances[msg.sender] += money;
    }
    
    function withdraw(uint money) public payable onlyOwner {
        balances[msg.sender] -= money;
    }
    
    function transfer(address _to, address _from, uint money) payable public onlyOwner {
        balances[_from] -= money;
        balances[_to] += money;
    }
    
}