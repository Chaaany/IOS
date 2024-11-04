//
//  MonthView.swift
//  Calender
//
//  Created by Ben on 11/4/24.
//

import SwiftUI

struct MonthView: View {
    var monthDate: Date
    @Binding var selectedDate: Date?
    @Binding var schedules: [Date: [String]]
    
    var body: some View {
        VStack {
            // 월 헤더
            Text(monthYearFormatter.string(from: monthDate))
                .font(.title2)
                .padding(.vertical)
            
            // 요일 헤더
            HStack {
                ForEach(["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"], id: \.self) { day in
                    Text(day).frame(maxWidth: .infinity)
                }
            }
            
            // 날짜 표시
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 10) {
                ForEach(generateDaysInMonth(for: monthDate), id: \.date) { day in
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
                        
                        // 일정이 있는 경우, 날짜 아래에 작은 점 표시
                        if let events = schedules[day.date], !events.isEmpty {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 5, height: 5)
                                .offset(y: 12) // 날짜 아래쪽으로 위치 조정
                        }
                    }
                    .frame(height: 40) // 각 셀의 고정 높이 설정
                    .onTapGesture {
                        selectedDate = day.date
                    }
                }
            }
        }
    }
    
    // 날짜 포맷터
    private let monthYearFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }()
}
