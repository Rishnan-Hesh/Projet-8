import CoreData
import Foundation

struct SleepRepository {
    let viewContext: NSManagedObjectContext
    
    init(viewContext: NSManagedObjectContext = PersistenceController.shared.container.viewContext) {
            self.viewContext = viewContext
        }
    
    func getSleepSessions() throws -> [SleepSession] {
        let request: NSFetchRequest<Sleep> = Sleep.fetchRequest()
        // pas de fetchLimit pour obtenir toutes les sessions
        // tri avec sortDescriptor
        request.sortDescriptors = [NSSortDescriptor(key: "startDate", ascending: false)]

        do {
            let entities = try viewContext.fetch(request)

            return entities.map { $0.toDomain() }
        } catch {
            return []
        }
    }
    
    func addSleepSession(startDate: Date, duration: Int, quality: Int) throws {
        let sleepSession = Sleep(context: viewContext)
        sleepSession.id = UUID()
        sleepSession.startDate = startDate
        sleepSession.duration = Int64(duration)
        sleepSession.quality = Int64(quality)
        
        // Debug, user trouvé ?
        if let user = try? UserRepository(viewContext: viewContext).getUser() {
            print("Utilisateur trouvé: \(user.firstName ?? "?")")
            sleepSession.user = user
        } else {
            print("ERREUR : Aucun utilisateur trouvé !")
            throw NSError(domain: "ExerciseRepository", code: 1, userInfo: [NSLocalizedDescriptionKey: "Aucun utilisateur trouvé"])
        }
        
        try viewContext.save()
    }
}
