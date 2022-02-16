//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/16/22.
//

import Foundation

struct Category: Codable, Identifiable {
	let id: Int
	let name: String
	let image: String
}
