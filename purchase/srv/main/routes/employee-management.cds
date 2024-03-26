using {db.models} from '../../../db/models';

@requires: 'authenticated-user'
service EmployeeManagementService {
    entity Employees            as projection on models.Employees;
    entity Departments          as projection on models.Departments;
}

