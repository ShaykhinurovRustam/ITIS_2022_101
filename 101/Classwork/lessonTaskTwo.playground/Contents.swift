//    (Классная работа) С помощью ООП и не только, опишите сущности и отношения между сущностями: Студент, Профессор, Оценка, Класс, Университет. Опишите по 3 функции или параметра в каждой сущности.


class University {
    private var students = [Student]()
    private var professors = [Professor]()
    private var name = String()
    
    init(name: String) {
        self.name = name
    }
    
    func getName() -> String {
        name
    }
    
    func getStudents() -> [Student] {
        students
    }
    
    func getProfessors() -> [Professor] {
        professors
    }
    
    func setStudents(with students: [Student]) {
        self.students = students
    }
    
    func setProfessors(with professors: [Professor]) {
        self.professors = professors
    }
    
}


class Classes {
    private var students = [Student]()
    
    func getStudents() -> [Student] {
        students
    }
    
    func addStudent(student: Student) {
        students.append(student)
    }
    
    func kickAllStudent() {
        students.removeAll()
    }
}


class Student {
    private var mark = Mark(mark: 0)
    private var name = String()
    private var university = University(name: "")
    private var classes = Classes()
    
    init(name: String, university: University, classes: Classes) {
        self.name = name
        self.university = university
        self.classes = classes
    }
    
    func getMark() -> Int {
        mark.getMark()
    }
    
    func setMark(with m: Int) {
        mark.setMark(mark: m)
    }
    
    func setName(with name: String) {
        self.name = name
    }
    
    func getName() -> String {
        name
    }
    
}

class Professor {
    private var name = String()
    private var age = Int()
    private var university =  University(name: "")
    private var classes = [Classes]()
    
    init(name: String, age: Int, university: University, classes: [Classes]) {
        self.name = name
        self.age = age
        self.university = university
        self.classes = classes
    }
    
    
    func setMark(to student: Student, with mark: Int) {
        student.setMark(with: mark)
    }

    func toString() {
        print("Name: \(name) | Age: \(age) | University: \(university.getName()) | Classes: \(classes)")
    }
    
}

struct Mark {
    var mark: Int
            
    func getMark() -> Int {
        mark
    }
    
    mutating func setMark(mark: Int) {
        self.mark = mark
    }
    
}

