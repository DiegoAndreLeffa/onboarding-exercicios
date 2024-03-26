using {db.models} from '../../../db/models';

@requires: 'authenticated-user'
service PurchaseOrderManagentService {
    @readonly entity PurchaseOrderHeaders as projection on models.PurchaseOrderHeaders;
    @readonly entity PurchaseOrderItems   as projection on models.PurchaseOrderItems;
}
