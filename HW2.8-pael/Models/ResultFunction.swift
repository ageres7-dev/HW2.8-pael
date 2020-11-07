//
//  getResult.swift
//  HW2.8-pael
//
//  Created by Brubrusha on 11/7/20.
//

extension Result {
    func getResult(text: String) -> Result? {
        switch text {
        case "pAei":
            return Result(
                shortInfo: "Прибыль",
                picture: "",
                characteristic: ""
            )
        default:
            return Result(
                shortInfo: "",
                picture: "",
                characteristic: ""
            )
        }
    }
}
