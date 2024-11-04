import SwiftUI

struct CalendarView: View {
    @Binding var currentMonth: Date
    @Binding var selectedDate: Date?
    @Binding var schedules: [Date: [String]]
    var onDateSelected: (Date) -> Void
    
    var body: some View {
        VStack {
            // 요일 헤더
            HStack {
                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // 날짜 표시 (항상 6행으로 고정)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(generateFixedDaysInMonth(for: currentMonth), id: \.date) { day in
                    ZStack {
                        // 선택된 날짜는 파란색 원으로 강조
                        if day.date == selectedDate {
                            Circle()
                                .fill(Color.blue.opacity(0.3))
                                .frame(width: 30, height: 30)
                        }
                        
                        // 날짜 텍스트
                        Text(day.dayNumber)
                            .fontWeight(day.isToday ? .bold : .regular)
                            .foregroundColor(day.isCurrentMonth ? .primary : .secondary)
                            .opacity(day.isCurrentMonth ? 1.0 : 0.4) // 이전/다음 월 날짜는 흐리게 표시
                        
                        // 일정이 있는 경우, 날짜 아래에 작은 점 표시
                        if let events = schedules[day.date], !events.isEmpty {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 5, height: 5)
                                .offset(y: 12)
                        }
                    }
                    .frame(width: 40, height: 40) // 셀 크기를 고정
                    .onTapGesture {
                        onDateSelected(day.date)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity) // 전체 달력 뷰의 너비 고정
    }
}


