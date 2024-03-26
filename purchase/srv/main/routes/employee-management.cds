using {db.models} from '../../../db/models';

@requires: 'authenticated-user'
service EmployeeManagementService {
    entity Employees            as projection on models.Employees;
    entity Departments          as projection on models.Departments;
}

@requires: 'ROLE_DUMMY_ADMIN'
service PurchaseOrderManagementAdminService {
    entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;
    entity PurchaseOrderItems   as projection on models.PurchaseOrderItems;
}
