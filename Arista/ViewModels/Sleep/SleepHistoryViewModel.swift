import Foundation
import CoreData

class SleepHistoryViewModel: ObservableObject {
    @Published var sleepSessions = [Sleep]()
    
    var viewContext: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.viewContext = context
        fetchSleepSessions()
    }
    
    func fetchSleepSessions() {
        do {
            let data = SleepRepository(viewContext: viewContext)
            sleepSessions = try data.getSleepSessions()
        } catch {
            print("Error when trying to get sleep sessions: \(error)")
        }
        
        func reload() {
            fetchSleepSessions()
        }
    }
}
