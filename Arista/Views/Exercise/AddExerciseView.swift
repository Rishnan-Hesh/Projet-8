import SwiftUI

struct AddExerciseView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddExerciseViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    TextField("Catégorie", text: $viewModel.category)
                    DatePicker("Heure de démarrage", selection: $viewModel.startTime)
                    Stepper("Durée: \(viewModel.duration)/300 min", value: $viewModel.duration, in: 0...300, step: 5)
                    Stepper("Intensité: \(viewModel.intensity)/10", value: $viewModel.intensity, in: 0...10)
                }
                .formStyle(.grouped)
                Spacer()
                Button("Ajouter l'exercice") {
                    viewModel.addExercise()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Nouvel Exercice ...")
        }
    }
}

#Preview {
    AddExerciseView(viewModel: AddExerciseViewModel(context: PersistenceController.preview.container.viewContext))
}
