using {PurchaseOrderManagentService} from '..';

annotate PurchaseOrderManagentService.Companies with @(UI: {LineItem: [
    {
        $Type: 'UI.DataField',
        Value: id,
        Label: 'ID',
    },
    {
        $Type: 'UI.DataField',
        Value: description,
        Label: 'ID',
    },
    {
        $Type: 'UI.DataField',
        Value: document,
        Label: 'ID',
    },
], });
