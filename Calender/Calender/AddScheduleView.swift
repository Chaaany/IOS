import SwiftUI

struct AddScheduleView: View {
    var selectedDate: Date
    @Binding var schedules: [Date: [String]]
    @Environment(\.dismiss) var dismiss
    @State private var scheduleText: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("새 일정 추가")) {
                    TextField("일정을 입력하세요", text: $scheduleText)
                }
                
                Button("저장") {
                    schedules[selectedDate, default: []].append(scheduleText)
                    dismiss() // 모달 닫기
                }
                .disabled(scheduleText.isEmpty) // 입력된 일정이 없으면 버튼 비활성화
            }
            .navigationTitle("일정 추가")
            .navigationBarItems(leading: Button("취소") {
                dismiss()
            })
        }
    }
}
