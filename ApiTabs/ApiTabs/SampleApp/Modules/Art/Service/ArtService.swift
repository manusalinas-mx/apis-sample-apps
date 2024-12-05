//
//  ArtService.swift
//  ApiTabs
//
//  Created by Manuel Salinas on 12/4/24.
//

import Foundation

class ArtService {
    private var currentTask: Task<[Department], Error>? // Para `getDepartments`
    private var objectTask: Task<[ArtObject], Error>? // Para `getObjects`

    // MARK: - Generic Method
    // Método genérico para obtener datos
    private func fetchData<T: Decodable>(from url: URL) async throws -> T {
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        return decodedData
    }

    // MARK: - Fetch Departments & Items
    func getDepartments() async throws -> [Department] {
        // Cancelar la tarea en curso, si existe
        currentTask?.cancel()

        // Crear y almacenar una nueva tarea
        let task = Task { () -> [Department] in
            let url = URL(string: Constants.Module.Art.departments)!
            let response: DepartmentResponse = try await fetchData(from: url)
            let departments = response.departments.sorted(by: { $0.name < $1.name })

            return departments
        }

        currentTask = task
        return try await task.value
    }

    func getObjects(from departmentId: Int) async throws -> [ArtObject] {
        print("Loading items por department no.", departmentId)
        // Cancelar la tarea en curso, si existe
        objectTask?.cancel()

        // Crear y almacenar una nueva tarea
        let task = Task { () -> [ArtObject] in
            var objects: [ArtObject] = []

            // Obtener la lista de IDs de objetos
            let depObjectsUrl = URL(string: Constants.Module.Art.departmentObjects + "\(departmentId)")!
            let depObjects: DepartmentObjects = try await fetchData(from: depObjectsUrl)
            let objectIds = Array(depObjects.objectIDs.suffix(20)) // Limitar a los últimos 20


            // Descargar los detalles de cada objeto
            for id in objectIds {
                let objectUrl = URL(string: Constants.Module.Art.object + "\(id)")!
                let object: ArtObject = try await fetchData(from: objectUrl)

                objects.append(object)
                print("Adding object: \(id) - name: \(object.title)")
            }

            print("Total objects added: ", objects.count)
            return objects
        }

        objectTask = task
        return try await task.value
    }
}
