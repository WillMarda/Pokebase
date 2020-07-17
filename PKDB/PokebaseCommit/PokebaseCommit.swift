//
//  PokebaseCommit.swift
//  PokebaseCommit
//
//  Created by Willem Marda on 7/13/20.
//  Copyright © 2020 WillMarda. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

struct CommitTimeLine: IntentTimelineProvider {
    
    typealias Entry = LastCommitEntry
    typealias Intent = PokebaseCommitIntent

    public func snapshot(for configuration: PokebaseCommitIntent, with context: Context, completion: @escaping (LastCommitEntry) -> ()) {
        let fakeCommit = Commit(message: "Fixed stuff", author: "John Appleseed", date: "2020-06-23")
        let entry = LastCommitEntry(
            date: Date(),
            commit: fakeCommit,
            branch: RepoBranch(
                account: "apple",
                repo: "swift",
                branch: "master"
            )
        )
        completion(entry)
    }

    public func timeline(for configuration: PokebaseCommitIntent, with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .minute, value: 5, to: currentDate)!

        guard let account = configuration.account,
              let repo = configuration.repo,
              let branch = configuration.branch
        else {
            let commit = Commit(message: "Failed to load commits", author: "", date: "")
            let entry = LastCommitEntry(date: currentDate, commit: commit, branch: RepoBranch(
                account: "???",
                repo: "???",
                branch: "???"
            ))
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
            return
        }

        CommitLoader.fetch(account: account, repo: repo, branch: branch) { result in
            let commit: Commit
            
            if case .success(let fetchedCommit) = result {
                commit = fetchedCommit as! Commit
            } else {
                commit = Commit(message: "Failed to load commits", author: "", date: "")
            }
            let entry = LastCommitEntry(date: currentDate, commit: commit, branch: RepoBranch(
                account: account,
                repo: repo,
                branch: branch
            ))
            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
            completion(timeline)
        }
    }
}

struct RepoBranch {
    let account: String
    let repo: String
    let branch: String
}
struct Commit {
    
    let message: String
    let author: String
    let date: String
    
}

struct LastCommitEntry: TimelineEntry {
    
    public let date: Date
    public let commit: Commit
    public let branch: RepoBranch
    
    var relevance: TimelineEntryRelevance? {
        return TimelineEntryRelevance(score: 80) // 0 - not important | 100 - very important
    }
    
}

struct CommitLoader {
    
    static func fetch(account: String, repo: String, branch: String, completion: @escaping (Result<Any, Error>) -> Void) {
        let branchContentsURL = URL(string: "https://api.github.com/repos/\(account)/\(repo)/branches/\(branch)")!
        let task = URLSession.shared.dataTask(with: branchContentsURL) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                return
            }
            let commit = getCommitInfo(fromData: data!)
            completion(.success(commit))
        }
        task.resume()
    }

    static func getCommitInfo(fromData data: Foundation.Data) -> Commit {
        let json = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let commitParentJson = json["commit"] as! [String: Any]
        let commitJson = commitParentJson["commit"] as! [String: Any]
        let authorJson = commitJson["author"] as! [String: Any]
        let message = commitJson["message"] as! String
        let author = authorJson["name"] as! String
        let date = authorJson["date"] as! String
        return Commit(message: message, author: author, date: date)
    }
}

struct PlaceholderView : View {
    var body: some View {
        Text("Loading Info..")
    }
}

struct GithubPushWidgetView : View {
    
    var entry: CommitTimeLine.Entry

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(entry.branch.account)/\(entry.branch.repo)'s \(entry.branch.branch) Latest Commit")
                .font(.system(.title3))
                .foregroundColor(.white)
            Text("\(entry.commit.message)")
                .font(.system(.callout))
                .foregroundColor(.white)
                .bold()
            Text("by \(entry.commit.author) at \(entry.commit.date)")
                .font(.system(.caption))
                .foregroundColor(.white)
            Text("Updated at \(Self.format(date:entry.date))")
                .font(.system(.caption2))
                .foregroundColor(.white)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .padding()
        .background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.15), Color.white.opacity(0.15)]), startPoint: .top, endPoint: .bottom))
            
        
        
    }

    static func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd-yyyy HH:mm"
        return formatter.string(from: date)
    }
    
}

@main
struct GithubPushWidget: Widget {
    private let kind: String = "CommitCheckerWidget"

    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: PokebaseCommitIntent.self, provider: CommitTimeLine(), placeholder: PlaceholderView()) { entry in
            GithubPushWidgetView(entry: entry)
        }
        .configurationDisplayName("A Repo's Latest Commit")
        .description("Shows the last commit at the a repo/branch combination.")
    }
    
}
