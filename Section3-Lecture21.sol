pragma solidity^0.4.24;
 
contract Bank {
    
    struct Account {
        address addr;
        uint amount;
    }
    
    mapping(address => uint) balances;
    
    Account[] public accounts;
    
    function addAdccount(address _addr, uint _amount) public {
        accounts.push(Account(_addr, _amount));
    }
    
    function deposit(uint money) public {
       balances[msg.sender] += money;
    }
    
    function withdraw(uint money) public {
       balances[msg.sender] -= money;
    }
    
    function transfer(address _to, address _from, uint money) public {
        balances[_from] -= money;
        balances[_to] += money;
    }
    
}