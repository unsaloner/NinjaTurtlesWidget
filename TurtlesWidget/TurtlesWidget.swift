//
//  TurtlesWidget.swift
//  TurtlesWidget
//
//  Created by Unsal Oner on 26.03.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    @AppStorage("turtle", store: UserDefaults(suiteName: "group.com.unsaloner.NinjaTurtlesWidget"))
    var turtleData : Data = Data()

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), turtle: NinjaTurtles(image: "michaelangelo", name: "michaelangelo", characteristic: "Funny"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        if let turtle = try? JSONDecoder().decode(NinjaTurtles.self, from: turtleData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, turtle: turtle)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let turtle = try? JSONDecoder().decode(NinjaTurtles.self, from: turtleData) {
            let entry = SimpleEntry(date: Date(), configuration: configuration, turtle: turtle)
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
            
        
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let turtle : NinjaTurtles
}

struct TurtlesWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ImageView(image: Image(entry.turtle.image))
    }
}

@main
struct TurtlesWidget: Widget {
    let kind: String = "TurtlesWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            TurtlesWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Ninja Turtles Widget")
        .description("Turtle Widget!")
    }
}

struct TurtlesWidget_Previews: PreviewProvider {
    
    static var previews: some View {
        TurtlesWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), turtle:michaelangelo))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
}
