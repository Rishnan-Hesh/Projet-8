import Foundation

import CoreData

class ExerciseListViewModel: ObservableObject {
    @Published var exercises = [Exercise]()
        
    init() {
        fetchExercises()
    }
    
    private func fetchExercises() {
        do {
            let data = ExerciseRepository()
            exercises = try data.getExercise()
        } catch {
            print("Error when trying to get exercises: \(error)")
        }
    }
    func reload() {
            fetchExercises()
        }
}
