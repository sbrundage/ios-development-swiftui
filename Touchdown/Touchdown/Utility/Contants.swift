//
//  Contants.swift
//  Touchdown
//
//  Created by Stephen Brundage on 2/8/22.
//

import SwiftUI

// MARK: - DATA

let players: [Player] = Bundle.main.decode("player.json")
let categories: [Category] = Bundle.main.decode("category.json")
let products: [Product] = Bundle.main.decode("product.json")
let brands: [Brand] = Bundle.main.decode("brand.json")

let sampleProduct: Product = products[0]

// MARK: - COLORS

let colorBackground = Color("ColorBackground")
let colorGray = Color(UIColor.systemGray4)


// MARK: - LAYOUT

let columnSpacing: CGFloat = 10
let rowSpacing: CGFloat = 10
var gridLayout: [GridItem] {
	Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
}

// MARK: - UX

let feedback = UIImpactFeedbackGenerator(style: .medium)
