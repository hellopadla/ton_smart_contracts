pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import '0_GOInterface.sol';
import '1_GObject.sol';
import '2_Station.sol';


contract Unit is Object {

    address public StationAd;
    
   constructor(Station station, address ad) public {
        station.addUnit(ad);
    }

    function Attack(Interface gObject, address ad) external {
       gObject.acceptAttack(ad, getAttack());
    }

    function getAttack() virtual public returns(uint) {}

    function getHealth() virtual public override returns(uint) {}

    function Death(address dest) internal override {
        sendAllMoneyDestroyWallet(dest);
    }
}
