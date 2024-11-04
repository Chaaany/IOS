import SwiftUICore
import SwiftUI

struct ContentView: View {
    @State private var selectedDate: Date? = nil
    @State private var schedules: [Date: [String]] = [:]
    @State private var showingAddSchedule = false
    @State private var currentMonth: Date = Date() // 현재 표시 중인 월
    
    var body: some View {
        VStack {
            // 월 이동 버튼과 현재 월 표시
            HStack {
                Button(action: {
                    previousMonth()
                }) {
                    Image(systemName: "chevron.left")
                }
                
                Text(monthYearFormatter.string(from: currentMonth))
                    .font(.title)
                
                Button(action: {
                    nextMonth()
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
            
            // 월별 캘린더 뷰
            CalendarView(currentMonth: $currentMonth, selectedDate: $selectedDate, schedules: $schedules) { date in
                selectedDate = date
                if !Calendar.current.isDate(date, equalTo: currentMonth, toGranularity: .month) {
                    // 선택한 날짜의 월로 변경
                    currentMonth = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: date)) ?? currentMonth
                }
            }
            
            // 일정 추가 버튼
            if selectedDate != nil {
                Button("일정 추가") {
                    showingAddSchedule = true
                }
                .padding()
                .sheet(isPresented: $showingAddSchedule) {
                    if let date = selectedDate {
                        AddScheduleView(selectedDate: date, schedules: $schedules)
                    }
                }
            }
            
            // 스크롤 가능한 일정 목록
            ScrollView {
                if let date = selectedDate, let events = schedules[date], !events.isEmpty {
                    VStack(alignment: .leading) {
                        Text("일정 목록")
                            .font(.headline)
                            .padding(.top)
                        
                        ForEach(events, id: \.self) { event in
                            Text(event)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                    }
                } else if selectedDate != nil {
                    Text("선택된 날짜에 일정이 없습니다.")
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
            }
            .frame(maxHeight: 200) // 일정 목록의 높이 제한을 설정하여 스크롤 가능하게 만듦
        }
    }
    
    // 이전 월로 이동
    func previousMonth() {
        currentMonth = Calendar.current.date(byAdding: .month, value: -1, to: currentMonth) ?? Date()
    }
    
    // 다음 월로 이동
    func nextMonth() {
        currentMonth = Calendar.current.date(byAdding: .month, value: 1, to: currentMonth) ?? Date()
    }
    
    // 월과 연도를 포맷팅하는 DateFormatter
    private let monthYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
}


#Preview {
    ContentView()
}
