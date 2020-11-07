//
//  getResult.swift
//  HW2.8-pael
//
//  Created by Brubrusha on 11/7/20.
//

extension Result {
    func getResult(text: String) -> Result? {
        switch text {
        case "Paei":
            return Result(
                shortInfo: "Прибыль",
                picture: "0",
                characteristic: """
                результат хорошего
                менеджмента. Производитель
                является тем руководителем,
                который способен его
                обеспечить. Это преданный
                своему делу профессионал,
                разбирающийся в потребностях
                клиентов и технологиях,
                которые могут их
                удовлетворить. Поэтому он
                всегда знает, что и как
                нужно делать для достижения
                """
            )
        case "P---":
            return Result(
                shortInfo: "Герой-одиночка",
                picture: "1",
                characteristic: """
                Это
                производитель, у которого
                практически не развиты
                функции администрирования,
                предпринимательства и
                интеграции. Поэтому он не
                умеет сгенерировать идеи,
                организовать их воплощение и
                сплотить команду.
                """
            )
         case "pAei"
        default:
            return Result(
                shortInfo: "",
                picture: "",
                characteristic: ""
            )
        }
    }
}
