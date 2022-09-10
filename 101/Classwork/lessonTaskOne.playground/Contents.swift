//Создать структуры Shape, Circle, Square, Triangle; у Shape должна быть функция, которая вычисляет площадь


protocol Shape {
    func calculate() -> Double
}

class Circle: Shape {
    private var radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func calculate() -> Double {
        Double.pi * radius * radius
    }

}

class Square: Shape {
    private var sideLength: Double
    
    init(sideLength: Double) {
        self.sideLength = sideLength
    }
    
    func calculate() -> Double {
        sideLength * sideLength
    }

}

class Triangle: Shape {
    private var firstSide: Double
    private var secondSide: Double
    private var thirdSide: Double
    private var perimeter: Double
    
    init(firstSide: Double, secondSide: Double, thirdSide: Double) {
        self.firstSide = firstSide
        self.secondSide = secondSide
        self.thirdSide = thirdSide
        
        perimeter = firstSide + secondSide + thirdSide
        
    }
    
    func calculate() -> Double {
        sqrt(perimeter * (perimeter - firstSide) * (perimeter - secondSide) * (perimeter - thirdSide))
    }
    
}
