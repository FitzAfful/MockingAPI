import Vapor

final class EmployeesController: RouteCollection {

    func boot(router: Router) throws {
        let route = router.grouped("api", "employees")
        route.post(use: create)
        route.get(use: index)
        route.get(Employee.parameter, use: get)
        route.delete(Employee.parameter, use: delete)
    }

    func index(_ req: Request) throws -> Future<[Employee]> {
        return Employee.query(on: req).all()
    }

    func get(_ req: Request) throws -> Future<Employee> {
        return try req.parameters.next(Employee.self)
    }

    func create(_ req: Request) throws -> Future<Employee> {
        return try req.content.decode(Employee.self).flatMap { employee in
            return employee.save(on: req)
        }
    }

    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(Employee.self).flatMap { employee in
            return employee.delete(on: req)
        }.transform(to: .ok)
    }
}
