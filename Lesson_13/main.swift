//
//  swift 9-th stream
//  Lesson_13
//
//  Created by Evgeny Mastepan on 30.10.2024.
//

import Foundation

/* Задание 1: Связь между классами Student и Course */
class Student {
    let name: String
    var course: Course?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) деинициализировано.")}
}
        
 class Course {
     let title: String
     weak var student: Student?
     init(title: String) {
     self.title = title
     }
     deinit {print("\(title) деинициализировано.")
    }
}

func enrollAndRelease() {
    let student = Student(name: "Себастьян Перейро")
    let course = Course(title: "Торговля чёрным деревом в малой Полинезии")
    student.course = course
    course.student = student
}
enrollAndRelease()

/* Задание 2: Связь между классами Author и Book с замыканием */
class Author {
    let name: String
    var book: Book?
    var introduceBook: (() -> Void)?

    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) деинициализировано.") }
}
class Book {
    let title: String
    weak var author: Author?
    init(title: String) {
        self.title = title
    }
    deinit {
        print("\(title) деинициализировано.")
    }
}

func createAuthorAndBook() {
    let author = Author(name: "Жюль Габриель Верн")
    let book = Book(title: "Пятнадцатилетний капитан")
    author.book = book
    book.author = author
    author.introduceBook = { [weak author] in
        if let bookTitle = author?.book?.title {
            print("\(author?.name ?? "Автор неизвестен") написал книгу: \(bookTitle)")
        }
    }
    author.introduceBook?()
}
createAuthorAndBook()
