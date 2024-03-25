using {managed} from '@sap/cds/common';
using {db.models} from '.';

namespace db.models;

entity Product : managed {
    key id          : UUID;
        name        : String;
        description : String;
        price       : String;
        supplierId  : Association to models.Supplier;
}
