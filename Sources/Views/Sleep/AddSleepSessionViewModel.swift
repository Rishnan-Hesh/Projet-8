import Foundation
import CoreData

class AddSleepSessionViewModel: ObservableObject {
    @Published var startTime: Date = Date()
    @Published var duration: Int = 0
    @Published var quality: Int = 0
    
    var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.viewContext = context
    }
    
    func addSleepSession() {
        do {
            try SleepRepository(viewContext: viewContext).addSleepSession(
                startDate: startTime,
                duration: duration,
                quality: quality
            )
            
            try viewContext.save()
            
        } catch {
            print("Error when trying to add sleep session: \(error)")
        }
    }
}
