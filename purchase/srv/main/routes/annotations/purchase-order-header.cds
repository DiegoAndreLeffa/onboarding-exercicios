using {PurchaseOrderManagentService} from '..';

annotate PurchaseOrderManagentService.Companies {
    id          @(title: 'Identificador');
    description @(title: 'Descrição');
    document    @(title: 'CNPJ')
};


annotate PurchaseOrderManagentService.PurchaseOrderHeaders with @(UI: {
    LineItem       : [
        {
            $Type                : 'UI.DataField',
            Value                : id,
            Label                : 'ID do pedido',
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '20%',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : company,
            Label                : 'Empresa',
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '20%'
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : purchasingOrganization,
            Label                : 'Grupo de compras',
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '20%'
            }

        },
        {
            $Type                : 'UI.DataField',
            Value                : createdAt,
            Label                : 'Data de criação',
            ![@UI.Importance]    : #Low,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '20%'
            },
        // ![@UI.Hidden],
        },

    ],
    SelectionFields: [
        id,
        company,
        purchasingGroup
    ],
}) {
    company @(
        title : 'Empresas',
        Common: {ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'Companies',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    ValueListProperty: 'id', //campo na entidade original
                    LocalDataProperty: 'company' // campo na entidade header
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'document'
                }
            ]
        }, }
    );
    purchasingGroup @(
           title : 'Grupo de compras',
           Common: {ValueList: {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'PurchaseOrderHeaders',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    ValueListProperty: 'id', //campo na entidade original
                    LocalDataProperty: 'company' // campo na entidade header
                },
                // {
                //     $Type            : 'Common.ValueListParameterDisplayOnly',
                //     ValueListProperty: ''
                // },
                // {
                //     $Type            : 'Common.ValueListParameterDisplayOnly',
                //     ValueListProperty: 'document'
                // }
            ]
        }, }
    )
};
