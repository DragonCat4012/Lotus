//
//  VersionChanges.swift
//  Lotus
//
//  Created by Kiara on 28.07.23.
//

import Foundation

let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0"
let UD_appVersion = "latestAppVersion"

func isLatestVersion() -> Bool {
    return UserDefaults.standard.string(forKey: UD_appVersion) == appVersion
}

func setLatestVersion() {
    UserDefaults.standard.set(appVersion, forKey: UD_appVersion)
}
