export namespace db.models {
    export interface Companies extends Managed {
        id: string;
        description: string;
        document: string;
    }

    export interface Departments extends Managed {
        id: string;
        departmentName: string;
        employee: Employees[];
    }

    export interface Employees extends Managed {
        id: string;
        name: string;
        email: string;
        department?: Departments;
        department_id?: string;
    }

    export interface Product extends Managed {
        id: string;
        name: string;
        description: string;
        price: string;
    }

    export interface PurchaseOrderHeaders extends Managed {
        id: string;
        company: string;
        purchasingOrganization: string;
        purchasingGroup: string;
        items: PurchaseOrderItems[];
    }

    export interface PurchaseOrderItems extends Managed {
        id: string;
        headerId?: PurchaseOrderHeaders;
        headerId_id?: string;
        material: string;
        quantity: number;
        uom: string;
        netPrice: number;
        center: string;
        product?: Product;
        product_id?: string;
    }

    export interface Supplier extends Managed {
        id: string;
        name: string;
        location: string;
    }

    export enum Entity {
        Companies = "db.models.Companies",
        Departments = "db.models.Departments",
        Employees = "db.models.Employees",
        Product = "db.models.Product",
        PurchaseOrderHeaders = "db.models.PurchaseOrderHeaders",
        PurchaseOrderItems = "db.models.PurchaseOrderItems",
        Supplier = "db.models.Supplier"
    }

    export enum SanitizedEntity {
        Companies = "Companies",
        Departments = "Departments",
        Employees = "Employees",
        Product = "Product",
        PurchaseOrderHeaders = "PurchaseOrderHeaders",
        PurchaseOrderItems = "PurchaseOrderItems",
        Supplier = "Supplier"
    }
}

export namespace sap.common {
    export interface CodeList {
        name: string;
        descr: string;
    }

    export interface Countries extends sap.common.CodeList {
        code: string;
    }

    export interface Currencies extends sap.common.CodeList {
        code: string;
        symbol: string;
    }

    export interface Languages extends sap.common.CodeList {
        code: string;
    }

    export enum Entity {
        CodeList = "sap.common.CodeList",
        Countries = "sap.common.Countries",
        Currencies = "sap.common.Currencies",
        Languages = "sap.common.Languages"
    }

    export enum SanitizedEntity {
        CodeList = "CodeList",
        Countries = "Countries",
        Currencies = "Currencies",
        Languages = "Languages"
    }
}

export namespace EmployeeManagementService {
    export interface Departments {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        departmentName: string;
        employee: Employees[];
    }

    export interface Employees {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        name: string;
        email: string;
        department?: Departments;
        department_id?: string;
    }

    export enum Entity {
        Departments = "EmployeeManagementService.Departments",
        Employees = "EmployeeManagementService.Employees"
    }

    export enum SanitizedEntity {
        Departments = "Departments",
        Employees = "Employees"
    }
}

export namespace PurchaseOrderManagentService {
    export interface Companies {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        description: string;
        document: string;
    }

    export interface Product {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        name: string;
        description: string;
        price: string;
    }

    export interface PurchaseOrderHeaders {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        company: string;
        purchasingOrganization: string;
        purchasingGroup: string;
        items: PurchaseOrderItems[];
    }

    export interface PurchaseOrderItems {
        createdAt?: Date;
        createdBy?: string;
        modifiedAt?: Date;
        modifiedBy?: string;
        id: string;
        headerId?: PurchaseOrderHeaders;
        headerId_id?: string;
        material: string;
        quantity: number;
        uom: string;
        netPrice: number;
        center: string;
        product?: Product;
        product_id?: string;
    }

    export enum ActionAcceptTravel {
        name = "acceptTravel"
    }

    export enum Entity {
        Companies = "PurchaseOrderManagentService.Companies",
        Product = "PurchaseOrderManagentService.Product",
        PurchaseOrderHeaders = "PurchaseOrderManagentService.PurchaseOrderHeaders",
        PurchaseOrderItems = "PurchaseOrderManagentService.PurchaseOrderItems"
    }

    export enum SanitizedEntity {
        Companies = "Companies",
        Product = "Product",
        PurchaseOrderHeaders = "PurchaseOrderHeaders",
        PurchaseOrderItems = "PurchaseOrderItems"
    }
}

export type User = string;

export interface Cuid {
    ID: string;
}

export interface Managed {
    createdAt?: Date;
    createdBy?: string;
    modifiedAt?: Date;
    modifiedBy?: string;
}

export interface Temporal {
    validFrom: Date;
    validTo: Date;
}

export enum Entity {
    Cuid = "cuid",
    Managed = "managed",
    Temporal = "temporal"
}

export enum SanitizedEntity {
    Cuid = "Cuid",
    Managed = "Managed",
    Temporal = "Temporal"
}
