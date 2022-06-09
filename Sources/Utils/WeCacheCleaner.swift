//
//  WeCacheCleaner.swift
//  Ilham Hadi Prabawa
//
//  Created by Ilham Hadi Prabawa on 17/11/21.
//  Copyright © 2021 Xamben. All rights reserved.
//

import Foundation
import WebKit

final class WebCacheCleaner {
    
    class func clean() {
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        print("[WebCacheCleaner] All cookies deleted")
        
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})
                print("[WebCacheCleaner] Record \(record) deleted")
            }
        }
    }
    
}
