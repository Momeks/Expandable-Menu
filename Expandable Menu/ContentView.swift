//
//  ContentView.swift
//  Expandable Menu
//
//  Created by Momeks on 6/9/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var showItems1 = false
	@State private var showItems2 = false
	@State private var showItems3 = false
	
	var body: some View {
		VStack(alignment: .leading, spacing: 10) {
		
			Item(title: "Item 1", image: "1.circle") {
				withAnimation(.spring().speed(2.5)) { showItems1.toggle() }
			}
			if showItems1 {
				VStack(alignment: .leading, spacing: 10) {
					SubItem(title: "Sub Item 1", image: "1.circle.fill")
					SubItem(title: "Sub Item 2", image: "2.circle.fill")
					SubItem(title: "Sub Item 3", image: "3.circle.fill")
				}
				.padding()
			}
			
			Item(title: "Item 2", image: "2.circle") {
				withAnimation(.spring().speed(2.5)) { showItems2.toggle() }
			}
			if showItems2 {
				VStack(alignment: .leading, spacing: 10) {
					SubItem(title: "Sub Item 1", image: "1.circle.fill")
					SubItem(title: "Sub Item 2", image: "2.circle.fill")
				}
				.padding()
			}
			
			
			Item(title: "Item 3", image: "3.circle") {
				withAnimation(.spring().speed(2.5)) { showItems3.toggle() }
			}
			if showItems3 {
				VStack(alignment: .leading, spacing: 10) {
					SubItem(title: "Sub Item 1", image: "1.circle.fill")
				}
				.padding()
			}
		}
		.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


//MARK: - MenuItem
struct Item: View {
	
	var title: String
	var image: String
	var action: (() -> Void)?
	
	var body: some View {
		Button {
			action?()
		} label: {
			Label(title, systemImage: image)
				.font(.largeTitle.bold())
				.foregroundColor(.primary)
		}
	}
}

//MARK: - MenuItem
struct SubItem: View {
	
	var title: String
	var image: String
	var action: (() -> Void)?
	
	var body: some View {
		Button {
			action?()
		} label: {
			Label(title, systemImage: image)
				.font(.title3.bold())
				.foregroundColor(.secondary)
		}
	}
}
