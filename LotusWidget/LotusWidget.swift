//
//  LotusWidget.swift
//  LotusWidget
//
//  Created by Kiara on 12.03.24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
}

struct LotusWidgetEntryView: View {
    @Environment(\.widgetFamily) var family
    var entry: Provider.Entry

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            Text("Small")
        case .systemMedium:
            CalendarView2(vm: WidgetCalendarViewModel())
        case .systemLarge:
            CalendarView2(vm: WidgetCalendarViewModel())
        default:
            Text("Some other WidgetFamily in the future.")
        }
    }
}

struct LotusWidget: Widget {
    let kind: String = "LotusWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            LotusWidgetEntryView(entry: entry)
        }
        .supportedFamilies([.systemMedium, .systemLarge])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct LotusWidget_Previews: PreviewProvider {
    static var previews: some View {
        LotusWidgetEntryView(entry: SimpleEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
