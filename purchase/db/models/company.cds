using {managed} from '@sap/cds/common';


namespace db.models;

entity Companies : managed {
    key id          : UUID;
        description : String(100);
        document    : String(14);
}
