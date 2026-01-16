import Foundation

import CoreData

class ExerciseListViewModel: ObservableObject {
    @Published var exercises = [Exercise]()
    
    var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.viewContext = context
        fetchExercises()
    }
    
    private func fetchExercises() {
        do {
            let data = ExerciseRepository(viewContext: viewContext)
            exercises = try data.getExercise()
        } catch {
            print("Error when trying to get exercises: \(error)")
        }
    }
    func reload() {
            fetchExercises()
        }
}
