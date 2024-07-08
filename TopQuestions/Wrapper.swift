//  Wrapper.swift
//  TopQuestions


import Foundation

struct Wrapper<T: Codable>: Codable {
	let items: [T]
}
