using {managed} from '@sap/cds/common';
using {db.models} from '.';

namespace db.models;

entity PurchaseOrderHeaders : managed {
    key id                     : UUID;
        company                : String(6);
        purchasingOrganization : String(6);
        purchasingGroup        : String(6);
        items                  : Composition of many models.PurchaseOrderItems
                                     on items.headerId = $self;
}
