using {managed} from '@sap/cds/common';
using {db.models} from '.';

namespace db.models;

entity Departments : managed {
    key id             : UUID;
        departmentName : String;
        employee       : Composition of many models.Employees
                             on employee.department = $self;
}
