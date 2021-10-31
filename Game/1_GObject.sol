pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import '0_GOInterface.sol';

contract Object is Interface {
    //for example health is 10
    uint health = 10;
    
    function getPowerProtection() virtual public returns(uint) {}

    function acceptAttack(address ad, uint attack) external override {
        
        attack -= getPowerProtection(); 
        health -= attack;

        if (isDied(health)) {
            Death(ad);
        }
    }

    function isDied(uint value) private returns (bool) {
        if (value <= 0) {
            return true;
        }
        return false;
    }

    function sendAllMoneyDestroyWallet(address ad) internal {
        ad.transfer(123, true, 160);
    }

    function Death(address ad) virtual internal {
        sendAllMoneyDestroyWallet(ad);
    }
}
