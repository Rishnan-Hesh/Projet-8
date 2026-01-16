import SwiftUI

struct AddSleepSessionView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddSleepSessionViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    DatePicker("Heure de démarrage", selection: $viewModel.startTime)
                    Stepper("Durée: \(viewModel.duration)/600 min", value: $viewModel.duration, in: 0...600, step: 5)
                    Stepper("Qualité: \(viewModel.quality)/10", value: $viewModel.quality, in: 0...10)
                }
                
                Spacer()
                
                Button("Ajouter la session") {
                    viewModel.addSleepSession()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Nouvel session de sommeil ...")
        }
    }
}

#Preview {
    AddSleepSessionView(viewModel: AddSleepSessionViewModel(context: PersistenceController.preview.container.viewContext))
}
