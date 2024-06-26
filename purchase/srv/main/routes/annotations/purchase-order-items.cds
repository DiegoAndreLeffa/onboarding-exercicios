using {PurchaseOrderManagentService} from '..';

annotate PurchaseOrderManagentService.Product {
    id          @(title: 'Identificador');
    name        @(title: 'Nome');
    description @(title: 'Descrição');
    price       @(title: 'Preço');
};

annotate PurchaseOrderManagentService.PurchaseOrderItems with @(UI: {
    LineItem         : [
        {
            $Type: 'UI.DataField',
            Value: id,
            Label: 'ID do pedido',
        },
        {
            $Type: 'UI.DataField',
            Value: headerId_id,
            Label: 'ID do cabeçalho',
        },
        {
            $Type: 'UI.DataField',
            Value: material,
            Label: 'Materiais',
        },
        {
            $Type: 'UI.DataField',
            Value: quantity,
            Label: 'Qtd',

        },
        {
            $Type: 'UI.DataField',
            Value: uom,
            Label: 'Unidade de medida',
        },
        {
            $Type: 'UI.DataField',
            Value: netPrice,
            Label: 'Preço',

        },
        {
            $Type: 'UI.DataField',
            Value: center,
            Label: 'Centro',
        },
    ],

    Facets           : [{
        ID    : 'orderItems',
        $Type : 'UI.CollectionFacet',
        Label : 'Informações Gerais',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Label : 'items',
            Target: '@UI.FieldGroup#items'
        }]
    },
    {
        ID    : 'products',
        $Type : 'UI.CollectionFacet',
        Label : 'Informações Gerais',
        Facets: [{
            $Type : 'UI.ReferenceFacet',
            Label : 'Produtos',
            Target: '@UI.FieldGroup#product'
        }]
    },
    // {
    //     ID    : 'orderItems',
    //     $Type : 'UI.CollectionFacet',
    //     Label : 'Informações Gerais',
    //     Facets: [{
    //         $Type : 'UI.ReferenceFacet',
    //         Label : 'items',
    //         Target: 'product/@UI.LineItem'
    //     }]
    // },

    ],

    FieldGroup #items: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: id,
                Label: 'ID'
            },
            {
                $Type: 'UI.DataField',
                Value: headerId_id,
                Label: 'Cabeçalho ID'
            },
            {
                $Type: 'UI.DataField',
                Value: material,
                Label: 'Material'
            },
            {
                $Type: 'UI.DataField',
                Value: quantity,
                Label: 'Quantidade'
            },
            {
                $Type: 'UI.DataField',
                Value: uom,
                Label: 'Unidade de  medida'
            },
            {
                $Type: 'UI.DataField',
                Value: netPrice,
                Label: 'Preço'
            },
            {
                $Type: 'UI.DataField',
                Value: center,
                Label: 'Centro'
            },
        ]
    },
    FieldGroup #product: {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type: 'UI.DataField',
            Value: product_id,
            Label: 'ID'
        },
        {
            $Type: 'UI.DataField',
            Value: product.name,
            Label: 'Nome'
        },
        {
            $Type: 'UI.DataField',
            Value: product.description,
            Label: 'Descrição'
        },
          {
            $Type: 'UI.DataField',
            Value: product.price,
            Label: 'Preço'
        },
        ]
    },
    SelectionFields  : [
        netPrice,
        quantity,
        material
    ],
}) {
    product @(
        title: 'Produtos',
        Common: {
            ValueList : {
                $Type : 'Common.ValueListType',
                CollectionPath : 'Product',
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterInOut',
                        ValueListProperty: 'id',
                        LocalDataProperty: 'id'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name',

                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'description',

                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'price',
                    }
                ]
            },
        }
    );
    netPrice @(title: 'Preços');
    quantity @(title: 'Quantidade');
    material @(title: 'Materiais')

};


// id,headerId_id,material,quantity,uom,netPrice,center,product_id
// ae51200c-6a9e-4d80-aa3f-1b68ffae20f7,fa4b5f4e-7758-4d5d-a5f3-081d4eac2c39,MATERIAL1,10,PC,25.00,CENTRO1,2a529e1b-2e8f-4497-98bc-2c3916542e3b
// d068d120-105c-4b92-8980-4bcf16d920e5,fa4b5f4e-7758-4d5d-a5f3-081d4eac2c39,MATERIAL2,20,KG,35.50,CENTRO2,e38ece71-08cf-4233-ad30-cfd716840f65
// e85c7326-52ee-4ed6-b01f-fde5b9b38825,fa4b5f4e-7758-4d5d-a5f3-081d4eac2c39,MATERIAL3,15,M,45.75,CENTRO3,71776bb7-055f-4f0e-b87b-579ae43e6905
// eb36e349-d69f-4d65-881b-0cf7c3f7e5f9,f13d1c0c-4e6c-4a4b-ba33-bd91d9a4173d,MATERIAL4,12,PC,30.25,CENTRO4,de9845b9-be5d-48fc-9d5e-614cb26a1519
// f7e53518-1708-49a9-a04f-31c3c1e0140b,f13d1c0c-4e6c-4a4b-ba33-bd91d9a4173d,MATERIAL5,25,KG,55.80,CENTRO5,bef00842-1040-4a7c-b97e-0758a2ee732e
// f3b89544-ef36-48ac-b536-c2db64f41fe4,f13d1c0c-4e6c-4a4b-ba33-bd91d9a4173d,MATERIAL6,8,M,40.00,CENTRO6,e38ece71-08cf-4233-ad30-cfd716840f65
// cfa8c869-00c1-495e-9302-1836a50b3c6d,d784d6e7-5035-4d51-95e0-7ab9464ff2cf,MATERIAL7,30,PC,20.00,CENTRO7,71776bb7-055f-4f0e-b87b-579ae43e6905
// 3be46045-5347-45e3-b774-328a7f6970c4,d784d6e7-5035-4d51-95e0-7ab9464ff2cf,MATERIAL8,18,KG,45.90,CENTRO8,e38ece71-08cf-4233-ad30-cfd716840f65
// c808c95e-5c0a-49db-aa7b-43e7c0ad22c4,d784d6e7-5035-4d51-95e0-7ab9464ff2cf,MATERIAL9,22,M,60.75,CENTRO9,bef00842-1040-4a7c-b97e-0758a2ee732e
// 051f18bc-666f-4d63-b7b7-c4f32f45ac88,9e1f7ad4-6f6a-49ae-8162-53b1fb2901ad,MATERIAL10,15,PC,28.50,CENTRO10,2a529e1b-2e8f-4497-98bc-2c3916542e3b
// 05d5ed85-f7a2-475d-8f67-b2c0715acfd0,9e1f7ad4-6f6a-49ae-8162-53b1fb2901ad,MATERIAL11,28,KG,50.00,CENTRO11,71776bb7-055f-4f0e-b87b-579ae43e6905
// ed3d5f4f-62e0-4c3e-b51d-546e7d123cfc,9e1f7ad4-6f6a-49ae-8162-53b1fb2901ad,MATERIAL12,10,M,35.25,CENTRO12,e38ece71-08cf-4233-ad30-cfd716840f65
// 63e5f933-7c0b-4e4a-8e39-eebf71ff4908,c2ee8b9f-783d-4a1a-bcd4-c1b9d44f5c56,MATERIAL13,20,PC,22.75,CENTRO13,bef00842-1040-4a7c-b97e-0758a2ee732e
// 17be6e89-f3b4-4a12-84af-3c7da110e87f,c2ee8b9f-783d-4a1a-bcd4-c1b9d44f5c56,MATERIAL14,15,KG,48.60,CENTRO14,e38ece71-08cf-4233-ad30-cfd716840f65
// ca44fecd-bb5d-4242-b185-83e47c1925a1,c2ee8b9f-783d-4a1a-bcd4-c1b9d44f5c56,MATERIAL15,18,M,55.00,CENTRO15,bef00842-1040-4a7c-b97e-0758a2ee732e