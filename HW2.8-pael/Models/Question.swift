//
//  Question.swift
//  HW2.8-pael
//
//  Created by Сергей Долгих on 06.11.2020.


//

enum  NumberOfQuestion {
    case first
    case second
    case third
    case fourth
    case fifth
    case sixth
    case seventh
    case eighth
    case ninth
    case tenth
}
struct Characteristic {
    let type: NumberOfQuestion
    let answers: [Anawer]
    
}

extension Characteristic {
    static func getCharacteristic() -> [Characteristic] {
        return [
            Characteristic(
                type: .first,
                answers: [
                    Anawer(text: "Сомневающийся", type: .producer),
                    Anawer(text: "Яркий", type: .administrator),
                    Anawer(text: "Отзывчивый", type: .entrepreneur),
                    Anawer(text: "Вовлеченный", type: .integrator)
                ]
            ),
            Characteristic(
                type: .second,
                answers: [
                    Anawer(text: "Харизматичный", type: .producer),
                    Anawer(text:  "Чувствующий", type: .administrator),
                    Anawer(text: "Анализирующий", type: .entrepreneur),
                    Anawer(text: "Прямой", type: .integrator)
                ]
            ),
            Characteristic(
                type: .third,
                answers: [
                    Anawer(text: "Сопереживающий", type: .producer),
                    Anawer(text:  "Созерцающий", type: .administrator),
                    Anawer(text: "Думающий", type: .entrepreneur),
                    Anawer(text: "Делающий", type: .integrator)
                ]
            ),
            Characteristic(
                type: .fourth,
                answers: [
                    Anawer(text: "Идущий на риск", type: .producer),
                    Anawer(text: "Отдающий себе отчет", type: .administrator),
                    Anawer(text: "Оценивающий", type: .entrepreneur),
                    Anawer(text: "Благожелательный", type: .integrator)
                ]
            ),
            Characteristic(
                type: .fifth,
                answers: [
                    Anawer(text: "Логичный", type: .producer),
                    Anawer(text: "Задающий вопросы", type: .administrator),
                    Anawer(text: "Эффективный", type: .entrepreneur),
                    Anawer(text: "Интуитивный", type: .integrator)
                ]
            ),
            Characteristic(
                type: .sixth,
                answers: [
                    Anawer(text: "Взаимодействующий", type: .producer),
                    Anawer(text: "Активный", type: .administrator),
                    Anawer(text: "Абстрактный", type: .entrepreneur),
                    Anawer(text: "Наблюдающий", type: .integrator)
                ]
            ),
            Characteristic(
                type: .seventh,
                answers: [
                    Anawer(text:"Ориентированный на будущее", type: .producer),
                    Anawer(text: "Теплый", type: .administrator),
                    Anawer(text: "Прагматичный", type: .entrepreneur),
                    Anawer(text: "Размышляющий", type: .integrator)
                ]
            ),
            Characteristic(
                type: .eighth,
                answers: [
                    Anawer(text:"Стремящийся к консенсусу", type: .producer),
                    Anawer(text: "Концептуальный", type: .administrator),
                    Anawer(text: "Наблюдающий", type: .entrepreneur),
                    Anawer(text: "Побеждающий", type: .integrator)
                ]
            ),
            Characteristic(
                type: .ninth,
                answers: [
                    Anawer(text: "Осведомленный", type: .producer),
                    Anawer(text: "Сдержанный", type: .administrator),
                    Anawer(text: "Рациональный", type: .entrepreneur),
                    Anawer(text: "Генерирующий идеи", type: .integrator)
                ]
            ),
            Characteristic(
                type: .tenth,
                answers: [
                    Anawer(text: "Приятный", type: .producer),
                    Anawer(text: "Аккуратный, точный", type: .administrator),
                    Anawer(text: "Яркий, выделяющийся", type: .entrepreneur),
                    Anawer(text: "Деловой, серьезный", type: .integrator)
                ]
            )
        ]
    }
}
