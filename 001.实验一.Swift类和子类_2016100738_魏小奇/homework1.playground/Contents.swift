//: Playground - noun: a place where people can play
import Cocoa
/*
 （1）找出从1-10000的所有质数，将找出的质数存入可变数组，对数组进行正反排序并输出结果(采用5种以上的方法实现)；
 */
var primeNumber:[Int] = []
var isPrime:Bool = true
for x in 2...10000{
    isPrime = true
    for y in 2..<Int(sqrt(Double(x))) {
        if(x%y == 0){
            isPrime = false
            break
        }
    }
    if(isPrime){
        primeNumber.append(x)
    }
}

print(primeNumber)
// 方法一
primeNumber.sort(){$0>$1}
print(primeNumber)
//方法二
primeNumber.sort{(a,b)->Bool in a>b}
print(primeNumber)
//方法三
primeNumber.sort(by: {$0>$1})
print(primeNumber)
//方法四
func func_sort(num1:Int,num2:Int) -> Bool{
    return num1 < num2
}
primeNumber.sort(by: func_sort)
print(primeNumber)
//方法五
primeNumber.sort(by: {(num1,num2) in return num1 > num2})
print(primeNumber)
/*
 （1）    实现Person类：
 a)    要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；
 b)    具有指定构造函数和便利构造函数；
 c)    两个Person实例对象可以用==和!=进行比较；
 d)    Person实例可以直接用print输出；

 */
enum Gender:Int{
    case male = 1
    case female
}
class Person:CustomStringConvertible{
    var firstName:String = ""
    var lastName:String = ""
    var fullName:String{
        get{
            return firstName + " " + lastName
        }
    }
    var age:Int = 0
    var gender:Gender = Gender.male
    var description: String{
        return "name:\(firstName) \(lastName) age:\(age) gender:\(gender) "
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(firstName:String){
        self.init(firstName: "",lastName:"",age:0,gender:Gender.female)
        self.firstName = firstName
    }
    static func ==(p1:Person,p2:Person) -> Bool{
        return p1.fullName==p2.fullName && p1.age==p2.age && p1.gender==p2.gender
    }
    static func !=(p1:Person,p2:Person) -> Bool{
        return p1.fullName != p2.fullName || p1.age != p2.age || p1.gender != p2.gender
    }
}
var p1 = Person(firstName: "lgy", lastName: "l", age: 18, gender: Gender.male)
print(p1)
/*
 （1）    从Person分别派生Teacher类和Student类：
 a)    Teacher类增加属性title，实例可以直接用print输出；
 b)    Student类增加属性stuNo，实例可以直接用print输出；
 */
class Teacher:Person{
    var title:String
    override var description: String{
        return super.description + " title:\(title)"
    }
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title = title;
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    
}
var p2 =  Teacher(firstName: "l", lastName: "gy", age: 18, gender: Gender.male, title: "professor")
print(p2)
class Student:Person{
    var stuNo:String
    override var description: String{
        return super.description + "stuNo:\(stuNo)"
    }
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo = stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
}
/*
 （1）    分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
 （2）    对数组执行以下要求：
 a)    分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；
 b)    对数组按以下要求排序并输出：age、fullName、gender+age；
 */
var p3 = Student(firstName: "w", lastName: "xq", age: 12, gender: Gender.male, stuNo: "2016100738")
print(p3)

var p4 = Teacher(firstName: "su", lastName: "han", age: 23, gender: Gender.female, title: "professor")
var p5 = Student(firstName: "chen", lastName: "xi", age: 21, gender: Gender.male, stuNo: "2016110503")
var p6 = Teacher(firstName: "liao", lastName: "xuehua", age: 25, gender: Gender.female, title: "teacher")
var p7 = Person(firstName: "wang", lastName: "haonan", age: 19, gender: Gender.male)
var people = [Person]()
people.append(p1)
people.append(p2)
people.append(p3)
people.append(p4)
people.append(p5)
people.append(p6)
people.append(p7)
var dictPeople = ["Teacher":0,"Student":0,"Person":0]
for value in people{
    if value is Teacher {
        dictPeople["Teacher"]! += 1
    }else if value is Student{
        dictPeople["Student"]! += 1
    }else{
        dictPeople["Person"]! += 1
    }
}
print(dictPeople)
people.sort(){$0.age>$1.age&&$0.fullName>$1.fullName&&$0.gender.rawValue+$0.age>$1.gender.rawValue+$1.age}
print(people)
