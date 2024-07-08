//  User.swift
//  TopQuestions


import Foundation

struct User: Hashable {
	let name: String
	let reputation: Int
	var profileImageURL: URL?
}

extension User: Codable {
	enum CodingKeys: String, CodingKey {
		case name = "display_name"
		case profileImageURL = "profile_image"
		case reputation
	}
}
