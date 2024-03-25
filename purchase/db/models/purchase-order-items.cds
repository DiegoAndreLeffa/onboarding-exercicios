using {managed} from '@sap/cds/common';
using {db.models} from '.';

namespace db.models;

entity PurchaseOrderItems : managed {
    key id       : UUID;
    key headerId : Association to models.PurchaseOrderHeaders;
        material : String(18);
        quantity : Integer;
        uom      : String(3);
        netPrice : Decimal(11, 2);
        center   : String(10);
        product  : Association to models.Product;
}
