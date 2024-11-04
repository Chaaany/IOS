import Foundation
struct CalendarDay {
    let date: Date
    var isCurrentMonth: Bool
    var isToday: Bool
    
    var dayNumber: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}

func generateDaysInMonth(for date: Date) -> [CalendarDay] {
    var days: [CalendarDay] = []
    let calendar = Calendar.current
    guard let monthInterval = calendar.dateInterval(of: .month, for: date) else { return [] }
    
    // 해당 월의 첫 주에 필요한 이전 달의 날짜 추가
    let startDayOfWeek = calendar.component(.weekday, from: monthInterval.start) - 1
    if let previousMonth = calendar.date(byAdding: .month, value: -1, to: date),
       let previousMonthInterval = calendar.dateInterval(of: .month, for: previousMonth) {
        
        let previousMonthEnd = previousMonthInterval.end.addingTimeInterval(-86400) // 이전 달의 마지막 날
        for day in (0..<startDayOfWeek).reversed() {
            if let previousDate = calendar.date(byAdding: .day, value: -day - 1, to: monthInterval.start) {
                days.append(CalendarDay(date: previousDate, isCurrentMonth: false, isToday: calendar.isDateInToday(previousDate)))
            }
        }
    }
    
    // 현재 월의 날짜 추가
    var currentDate = monthInterval.start
    while currentDate < monthInterval.end {
        let isToday = calendar.isDateInToday(currentDate)
        days.append(CalendarDay(date: currentDate, isCurrentMonth: true, isToday: isToday))
        currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
    }
    
    // 해당 월의 마지막 주에 필요한 다음 달의 날짜 추가
    let endDayOfWeek = calendar.component(.weekday, from: monthInterval.end.addingTimeInterval(-86400)) - 1
    if let nextMonth = calendar.date(byAdding: .month, value: 1, to: date),
       let nextMonthInterval = calendar.dateInterval(of: .month, for: nextMonth) {
        
        var nextDate = nextMonthInterval.start
        for _ in endDayOfWeek..<6 {
            days.append(CalendarDay(date: nextDate, isCurrentMonth: false, isToday: calendar.isDateInToday(nextDate)))
            nextDate = calendar.date(byAdding: .day, value: 1, to: nextDate)!
        }
    }
    
    return days
}

func generateFixedDaysInMonth(for date: Date) -> [CalendarDay] {
    var days: [CalendarDay] = []
    let calendar = Calendar.current
    guard let monthInterval = calendar.dateInterval(of: .month, for: date) else { return [] }
    
    // 현재 월의 첫 주에 필요한 이전 달의 날짜 추가
    let startDayOfWeek = calendar.component(.weekday, from: monthInterval.start) - 1
    if let previousMonth = calendar.date(byAdding: .month, value: -1, to: date),
       let previousMonthInterval = calendar.dateInterval(of: .month, for: previousMonth) {
        
        let previousMonthEnd = previousMonthInterval.end.addingTimeInterval(-86400)
        for day in (0..<startDayOfWeek).reversed() {
            if let previousDate = calendar.date(byAdding: .day, value: -day - 1, to: monthInterval.start) {
                days.append(CalendarDay(date: previousDate, isCurrentMonth: false, isToday: calendar.isDateInToday(previousDate)))
            }
        }
    }
    
    // 현재 월의 날짜 추가
    var currentDate = monthInterval.start
    while currentDate < monthInterval.end {
        let isToday = calendar.isDateInToday(currentDate)
        days.append(CalendarDay(date: currentDate, isCurrentMonth: true, isToday: isToday))
        currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
    }
    
    // 다음 달의 날짜로 6행을 채우기 위한 추가 셀
    let totalCells = 42 // 6행 * 7열 = 42개의 셀
    if days.count < totalCells {
        let extraDays = totalCells - days.count
        var nextDate = monthInterval.end
        for _ in 0..<extraDays {
            days.append(CalendarDay(date: nextDate, isCurrentMonth: false, isToday: calendar.isDateInToday(nextDate)))
            nextDate = calendar.date(byAdding: .day, value: 1, to: nextDate)!
        }
    }
    
    return days
}


