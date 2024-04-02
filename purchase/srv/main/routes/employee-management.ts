import "../configuration/module-alias";

import { Request, Service } from "@sap/cds/apis/services";

import { db } from "@/common/entities/db/models";
import cds from "@sap/cds";

export default (service: Service) => {
  service.before(["READ", "CREATE"], "Employees", (request: Request) => {
    if (!request.user.is("ROLE_HR")) {
      return request.reject(403, "Não autorizado6666");
    }
  });
  service.before("CREATE", "Employees", async (request: Request) => {
    const swapi = await cds.connect.to("swapi");
    const person = await swapi.send({
      method: "GET",
      path: "people/1",
      headers: { "Content-Type": "application/json" },
    });
    request.data.name = person.name;
    request.data.email = person.name + "@gmail.com";
  });
  service.after(
    "READ",
    "Employees",
    (results: db.models.Employees[], request: Request) => {
      results.forEach((employee) => employee.email.split("@")[1]);
    }
  );
};


