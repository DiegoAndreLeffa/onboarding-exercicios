using {PurchaseOrderManagentService} from '..';

annotate PurchaseOrderManagentService.Companies {
    id          @(title: 'Identificador');
    description @(title: 'Descrição');
    document    @(title: 'CNPJ')
};


annotate PurchaseOrderManagentService.PurchaseOrderHeaders with @(UI: {
    LineItem          : [
        {
            $Type                : 'UI.DataField',
            Value                : id,
            Label                : 'ID do pedido',
            ![@UI.Importance]    : #High,
            ![@HTML5.CssDefaults]: {
                $Type: 'HTML5.CssDefaultsType',
                width: '30%',
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
        // {
        //     $Type                : 'UI.DataField',
        //         Value                : items,
        //         Label                : 'Product',
        //         ![@UI.Importance]    : #Low,
        //         ![@HTML5.CssDefaults]: {
        //             $Type: 'HTML5.CssDefaultsType',
        //             // width: '20%'
        //         },
        // },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'PurchaseOrderManagentService.acceptTravel',
            Label : 'BOTÃO1'
        },

    ],
    Identification    : [{
        $Type : 'UI.DataFieldForAction',
        Action: 'PurchaseOrderManagentService.acceptTravel',
        Label : 'BOTÃO2'
    },

    ],

    Facets            : [
        {
            ID    : 'orderHeader',
            $Type : 'UI.CollectionFacet',
            Label : 'Informações Gerais',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Label : 'Header',
                Target: '@UI.FieldGroup#header'
            }]
        },
        {
            ID    : 'item',
            $Type : 'UI.ReferenceFacet',
            Label : 'Itens',
            Target: 'items/@UI.LineItem'
        },
        {
            ID    : 'companies',
            $Type : 'UI.ReferenceFacet',
            Label : 'Companias',
            Target: '@UI.LineItem'
        },
    ],

    FieldGroup #header: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: id,
                Label: 'ID'
            },
            {
                $Type: 'UI.DataField',
                Value: company,
                Label: 'Compania'
            },
            {
                $Type: 'UI.DataField',
                Value: purchasingGroup,
                Label: 'Grupo de compra'
            },
            {
                $Type: 'UI.DataField',
                Value: purchasingOrganization,
                Label: 'Organização de compra'
            },
            {
                $Type: 'UI.DataField',
                Value: createdAt,
                Label: 'Data de criação'
            },
            {
                $Type: 'UI.DataField',
                Value: createdBy,
                Label: 'Criado por'
            },
        ]
    },


    SelectionFields   : [
        id,
        company,
        purchasingGroup,
    ],


}) {


    company         @(
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
            Parameters    : [{
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
