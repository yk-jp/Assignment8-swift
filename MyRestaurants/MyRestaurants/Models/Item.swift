//
//  Item.swift
//  MyRestaurants
//
//  Created by Yusuke K on 2022-06-03.
//

import Foundation

enum Item: Hashable {
    case food(Food)
    case filter(Filter)
    
    var food: Food? {
        if case .food(let food) = self {
            return food
        } else {
            return nil
        }
    }
    
    var filter: Filter? {
        if case .filter(let filter) = self {
            return filter
        } else {
            return nil
        }
    }
    
    static let filterItems: [Item] = [
        .filter(Filter(item:"Japanese")),
        .filter(Filter(item:"Mexican")),
        .filter(Filter(item:"American")),
        .filter(Filter(item:"Korean")),
        .filter(Filter(item:"Italian")),
        .filter(Filter(item:"Asian")),
        .filter(Filter(item:"Greek")),
        .filter(Filter(item:"Chinese")),
        .filter(Filter(item:"Canadian")),
        .filter(Filter(item:"Others"))
    ]
    
    static let menuItems:[Item] = [
        .food(Food(name: "Chipotle",
                   img: "chipotle",
                   type: "",
                   time: ["Lunch", "Dinner"],
                   country: ["Mexican"],
                   cost: 1)),
        .food(Food(name: "Pokeland",
                   img: "pokeland",
                   type: "Seafood",
                   time: ["Lunch", "Dinner"],
                   country: [""],cost: 2)),
        .food(Food(name: "CTB",
                   img: "CTB",
                   type: "",
                   time: ["Breakfast", "Lunch"],
                   country: ["American"],
                   cost: 3)),
        .food(Food(name: "Four Seasons",
                   img: "four seasons",
                   type: "",
                   time: ["Lunch", "Dinner"],
                   country: ["Asian", "Korean"],
                   cost: 4)),
        .food(Food(name: "Chick-fil-A",
                   img: "chick-fil-a",
                   type: "Fast Food",
                   time: ["Lunch"],
                   country: ["American"],
                   cost: 5)),
        .food(Food(name: "Aladdins",
                   img: "",
                   type: "",
                   time: ["Lunch", "Dinner"],
                   country:["Greek","Italian"],
                   cost: 6)),
        .food(Food(name: "Cheese Cake",
                   img: "cheese cake",
                   type: "dessert",
                   time: ["Morning", "Lunch", "Dinner"],
                   country:["Greek","Italian"],
                   cost: 7)),
        .food(Food(name: "Fish And Chips",
                   img: "fish and chips",
                   type: "Seafood",
                   time: ["Lunch", "Dinner"],
                   country:["Canadian"],
                   cost: 7)),
        .food(Food(name: "French Fries",
                   img: "french fries",
                   type: "Fast Food",
                   time: ["Morning","Lunch", "Dinner"],
                   country:["American"],
                   cost: 8)),
        .food(Food(name: "Pizza",
                   img: "pizza",
                   type: "Main dish",
                   time: ["Lunch", "Dinner"],
                   country:["Greek","Italian"],
                   cost: 9)),
        .food(Food(name: "Poutine",
                   img: "poutine",
                   type: "Traditional",
                   time: ["Lunch", "Dinner"],
                   country:["Canadian"],
                   cost: 10)),
        .food(Food(name: "Sushi",
                   img: "sushi",
                   type: "Main dish",
                   time: [ "Dinner"],
                   country:["Japanese", "Asian"],
                   cost: 11)),
        .food(Food(name: "Udon",
                   img: "udon",
                   type: "Traditional",
                   time: ["Morning","Lunch", "Dinner"],
                   country:["Asian","Japanese"],
                   cost: 12)),
        .food(Food(name: "Waffle",
                   img: "waffle",
                   type: "Dessert",
                   time: ["Morning","Lunch", "Dinner"],
                   country:["American"],
                   cost: 13)),
    ]
}
