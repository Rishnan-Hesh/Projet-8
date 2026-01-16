import Foundation
import CoreData

class UserDataViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""

    private var viewContext: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.viewContext = context
        fetchUserData()
    }

    private func fetchUserData() {
        do {
            guard let user = try UserRepository(viewContext: viewContext).getUser() else {
                fatalError("User not found")
            }
            firstName = user.firstName ?? ""
            lastName = user.lastName ?? ""
        } catch {
            print("Error when trying to get user: \(error)")
        }
    }
}
