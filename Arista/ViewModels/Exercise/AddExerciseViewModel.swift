import Foundation
import CoreData

class AddExerciseViewModel: ObservableObject {
    @Published var category: String = ""
    @Published var startTime: Date = Date()
    @Published var duration: Int = 0
    @Published var intensity: Int = 0
    
    private var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.viewContext = context
    }
    
    func addExercise() {
        do {
            try ExerciseRepository(viewContext: viewContext).addExercise(
                category: category,
                duration: duration,
                intensity: intensity,
                startDate: startTime
            )
            
            try viewContext.save()
            
        } catch {
            print("Error when trying to add exercise: \(error)")
        }
    }
}
