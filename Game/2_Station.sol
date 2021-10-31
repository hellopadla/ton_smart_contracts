pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

import '1_GObject.sol';

contract Station is Object {

    address[] public UnitsAd;
    // for example health is 20
    uint health2 = 20;

    function getHealth() public override returns(uint) {
        tvm.accept();
        return health2;
    }

    function addUnit(address ad) external  {
        tvm.accept();
        UnitsAd.push(ad);
    }

    function delUnit(address ad) public {
        tvm.accept();
        for (uint256 i = 0; i < UnitsAd.length; i++) {
            if (UnitsAd[i] == ad) {
                address temp = UnitsAd[i];
                UnitsAd[i] = UnitsAd[UnitsAd.length - 1];
                UnitsAd[UnitsAd.length - 1] = temp;
                UnitsAd.pop();
                break;
            }
        }
    }
}