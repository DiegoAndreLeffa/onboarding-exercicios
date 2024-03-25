using {managed} from '@sap/cds/common';
using {db.models} from '.';

namespace db.models;

entity Employees : managed {
    key id         : UUID;
        name       : String;
        email      : String;
        department : Association to models.Departments;
}
