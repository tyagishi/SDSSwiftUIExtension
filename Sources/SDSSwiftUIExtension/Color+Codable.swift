//
//  File.swift
//
//  Created by : Tomoaki Yagishita on 2022/10/13
//  © 2022  SmallDeskSoftware
//

import Foundation
import SwiftUI
import SwiftUIColorNames

extension Color: Codable {
    private enum CodingKeys: CodingKey {
        case rgb
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let rgbValue = self.rgbUInt32
        try container.encodeIfPresent(rgbValue, forKey: .rgb)
    }

    public init(from decoder: Decoder) throws {
        let colorContainer = try decoder.container(keyedBy: CodingKeys.self)
        let rgbValue = try colorContainer.decode(UInt32.self, forKey: .rgb)
        self.init(hex: rgbValue)
    }
}
