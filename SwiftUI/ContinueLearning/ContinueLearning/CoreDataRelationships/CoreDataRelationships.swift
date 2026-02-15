//
//  CoreDataRelationships.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 03.02.2026.
//

import SwiftUI
import CoreData
import Combine

class CoreDataManager {
    static let instance = CoreDataManager()
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "CoreDataRelationshipContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Ошибка загрузки Core Data. \(error.localizedDescription)")
            }
        }
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
        } catch let error {
            print("Ошибка сохранения. \(error.localizedDescription)")
        }
    }
}

class CoreDataRelationshipViewModel: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var businesses: [BusinessEntity] = []
    @Published var departments: [DepartmentEntity] = []
    @Published var employees: [EmployeeEntity] = []
    
    func addBusiness() {
        let newBusiness = BusinessEntity(context: manager.context)

        //newBusiness.name = "Apple"
        //newBusiness.name = "Microsoft"
        newBusiness.name = "Facebook"
        
        // добавить существующий департамент новой компании
        //newBusiness.departments = []
        //newBusiness.departments = [departments[0], departments[1]]
        
        // добавить сущствующих сотрудников в новую компанию
        //newBusiness.employees = []
        //newBusiness.employees = [employees[1]]
        
        // добавить новую компанию к существующему дапертаменту
        //newBusiness.addToDepartments(<#T##value: DepartmentEntity##DepartmentEntity#>)
        
        // добавить новую компанию к сщуствующему сотруднику
        //newBusiness.addToEmployees(<#T##value: EmployeeEntity##EmployeeEntity#>)
        
        save()
    }
    
    func addDepartment() {
        let newDepartment = DepartmentEntity(context: manager.context)
//        newDepartment.name = "Маркетинг"
//        newDepartment.businesses = [businesses[0]]
        //newDepartment.name = "Инженерный отдел"
        //newDepartment.addToEmployees([employees[1]])
        newDepartment.name = "Экономический"
        newDepartment.businesses = [businesses[0], businesses[1], businesses[2]]
        newDepartment.employees =  [employees[1]]
        
        save()
    }
    
    func addEmployee() {
//        let newEmployee = EmployeeEntity(context: manager.context)
//        newEmployee.name = "Jessy"
//        newEmployee.age = 28
//        newEmployee.dateJoined = Date()
//        
//        newEmployee.business = businesses[0]
//        newEmployee.department = departments[0]
//        let newEmployee = EmployeeEntity(context: manager.context)
//        newEmployee.name = "Emily"
//        newEmployee.age = 29
//        newEmployee.dateJoined = Date()
        let newEmployee = EmployeeEntity(context: manager.context)
        newEmployee.name = "John"
        newEmployee.age = 30
        newEmployee.dateJoined = Date()
        
        newEmployee.business = businesses[2]
        newEmployee.department = departments[0]

        save()
    }
    
    init() {
        getBusinesses()
        getDepartments()
        getEmployees()
    }
    
    func getBusinesses() {
        let request = NSFetchRequest<BusinessEntity>(entityName: "BusinessEntity")
        
        let sort = NSSortDescriptor(keyPath: \BusinessEntity.name, ascending: true)
        request.sortDescriptors = [sort]
        
//        let filter = NSPredicate(format: "name == %@", "Apple")
//        request.predicate = filter
        
        do {
            businesses = try manager.context.fetch(request)
        } catch let error {
            print("Ошбика получения данных. \(error.localizedDescription)")
        }
    }
    
    func updateBusiness() {
        let existingBusiness = businesses[2]
        existingBusiness.addToDepartments(departments[1])
        
        save()
    }
    
    func getDepartments() {
        let request = NSFetchRequest<DepartmentEntity>(entityName: "DepartmentEntity")
        
        do {
            departments = try manager.context.fetch(request)
        } catch let error {
            print("Ошбика получения данных. \(error.localizedDescription)")
        }
    }
    
    func deleteDepartment() {
        let departmеnt = departments[2]
        // тут надо внимательно, смотреть как удаляются зависимые сущности, каскадное там удаление, игнорируется, зануляется, запрет удалять таких с существующими зависимостями или ничего не происходит
        // сейчас по умолчанию nullify
        manager.context.delete(departmеnt)
        
        save()
    }
    
    func getEmployees() {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Ошбика получения данных. \(error.localizedDescription)")
        }
    }
    
    func getEmployees(forBusiness business: BusinessEntity) {
        let request = NSFetchRequest<EmployeeEntity>(entityName: "EmployeeEntity")
        
        let filter = NSPredicate(format: "business == %@", business)
        request.predicate = filter
        
        do {
            employees = try manager.context.fetch(request)
        } catch let error {
            print("Ошбика получения данных. \(error.localizedDescription)")
        }
    }
    
    func save() {
        businesses.removeAll()
        departments.removeAll()
        employees.removeAll()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.manager.save()
            self.getBusinesses()
            self.getDepartments()
            self.getEmployees()
        }
    }
}

struct CoreDataRelationships: View {
    @StateObject var viewModel = CoreDataRelationshipViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    Button(action: {
                        viewModel.deleteDepartment()
                    }, label : {
                        Text("Выполнить")
                            .foregroundStyle(.white)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .clipShape(Capsule())
                    })
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(viewModel.businesses) { business in
                                BusinessView(entity: business)
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(viewModel.departments) { department in
                                DepartmentView(entity: department)
                            }
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(alignment: .top) {
                            ForEach(viewModel.employees) { employee in
                                EmployeeView(entity: employee)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Relationships")
        }
    }
}

struct BusinessView: View {
    
    var entity: BusinessEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Название: \(entity.name ?? "")")
                .bold()
            
            if let departments = entity.departments?.allObjects as? [DepartmentEntity] {
                Text("Департаменты")
                    .bold()
                ForEach(departments) { department in
                    Text(department.name ?? "")
                }
                .padding(.horizontal)
            }
            
            if let employess = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Сотрудники")
                    .bold()
                ForEach(employess) { employee in
                    Text(employee.name ?? "")
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(.gray.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

struct DepartmentView: View {
    
    var entity: DepartmentEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Название: \(entity.name ?? "")")
                .bold()
            
            if let businesses = entity.businesses?.allObjects as? [BusinessEntity] {
                Text("Компании")
                    .bold()
                ForEach(businesses) { business in
                    Text(business.name ?? "")
                }
                .padding(.horizontal)
            }
            
            if let employess = entity.employees?.allObjects as? [EmployeeEntity] {
                Text("Сотрудники")
                    .bold()
                ForEach(employess) { employee in
                    Text(employee.name ?? "")
                }
                .padding(.horizontal)
            }
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(.blue.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

struct EmployeeView: View {
    
    var entity: EmployeeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Название: \(entity.name ?? "")")
                .bold()
            
            Text("Компания: \(entity.business?.name ?? "")")
                .padding(.horizontal)
            
            Text("Департамент: \(entity.department?.name ?? "")")
                .padding(.horizontal)
            
            Text("Дата: \(entity.dateJoined ?? Date())")
                .padding(.horizontal)
        }
        .padding()
        .frame(maxWidth: 300, alignment: .leading)
        .background(.green.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }
}

#Preview {
    CoreDataRelationships()
}
