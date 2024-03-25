import "../configuration/module-alias";

import { Request, Service } from "@sap/cds/apis/services";

import { db } from "@/common/entities/db/models";
import cds from "@sap/cds";

export default (service: Service) => {
  service.after(
    "READ",
    "PurchaseOrderHeaders",
    (results: db.models.PurchaseOrderHeaders[], request: Request) => {
      results.forEach((poHeader) => (poHeader.company = "ABC"));
    }
  );
  
  service.before("CREATE", "PurchaseOrderHeaders", async (request: Request) => {
    const swapi = await cds.connect.to("swapi");
    const person = await swapi.send({
      method: "GET",
      path: "people/1",
      headers: { "Content-Type": "application/json" },
    });
    const items = [
      {
        material: "Material_insomnia",
        quantity: 10,
        uom: "PC",
        netPrice: 30,
        center: "ABCD",
      },
      {
        material: "Material_insomnia2",
        quantity: 5,
        uom: "KG",
        netPrice: 500,
        center: "ABCD",
      },
    ];
    request.data.items = items;
    request.data.createdBy = person.name;
    request.data.modifiedBy = person.name;
  });
};
