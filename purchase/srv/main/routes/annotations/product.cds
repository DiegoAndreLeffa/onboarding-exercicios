using {PurchaseOrderManagentService} from '..';

annotate PurchaseOrderManagentService.Product with @(UI: {
    LineItem           : [
        {
            $Type: 'UI.DataField',
            Value: id,
            Label: 'ID',
        },
        {
            $Type: 'UI.DataField',
            Value: name,
            Label: 'Nome do produto',
        },
        {
            $Type: 'UI.DataField',
            Value: description,
            Label: 'Descrição',
        },
        {
            $Type: 'UI.DataField',
            Value: price,
            Label: 'Preço',
        },
    ],

    Facets             : [{
        ID    : 'product',
        $Type : 'UI.CollectionFacet',
        Label : 'Informações Gerais',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Label : 'Produtos',
            Target: '@UI.FieldGroup#product'
        }]
    }],

    FieldGroup #product: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: id,
                Label: 'ID'
            },
            {
                $Type: 'UI.DataField',
                Value: name,
                Label: 'Nome'
            },
            {
                $Type: 'UI.DataField',
                Value: description,
                Label: 'Descrição'
            },
            {
                $Type: 'UI.DataField',
                Value: price,
                Label: 'Preço'
            }
        ]
    },
});
