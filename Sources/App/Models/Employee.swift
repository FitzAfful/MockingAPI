import FluentSQLite
import Vapor

final class Employee: SQLiteModel {
    typealias Database = SQLiteDatabase

    var id: Int?
    var employeeName: String
    var employeeAge: Int
    var employeeSalary: Double
    var profileImage: String?

    init(id: Int? = nil, employeeName: String, employeeAge: Int, employeeSalary: Double, profileImage: String? = nil) {
        self.id = id
        self.employeeSalary = employeeSalary
        self.employeeName = employeeName
        self.employeeAge = employeeAge
        if profileImage == nil {
            self.profileImage = "https://f1.pngfuel.com/png/897/471/707/man-silhouette-portrait-head-shot-male-face-neck-shoulder-png-clip-art.png"
        } else {
            self.profileImage = profileImage
        }
    }
}

extension Employee: Migration { }
extension Employee: Content { }
extension Employee: Parameter { }
